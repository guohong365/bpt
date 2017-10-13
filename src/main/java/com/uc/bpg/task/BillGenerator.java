package com.uc.bpg.task;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import com.uc.bpg.Constant;
import com.uc.bpg.domain.Bill;
import com.uc.bpg.domain.DeviceUsage;
import com.uc.bpg.domain.Hotel;
import com.uc.bpg.service.BillGeneratorSevice;
import com.uc.utils.LoggerSupportorImpl;

public class BillGenerator extends LoggerSupportorImpl {
	
	private BillGeneratorSevice generatorSevice;
	
	public BillGeneratorSevice getGeneratorSevice() {
		return generatorSevice;
	}
	
	public void setGeneratorSevice(BillGeneratorSevice generatorSevice) {
		this.generatorSevice = generatorSevice;
	}
	
	private boolean enabled;
	
	public boolean isEnabled() {
		return enabled;
	}
	
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	private boolean generateZeroBill;
	
	public void setGenerateZeroBill(boolean generateZeroBill) {
		this.generateZeroBill = generateZeroBill;
	}
	
	public boolean isGenerateZeroBill() {
		return generateZeroBill;
	}
	
	public void run(){
		getLogger().trace("bill generator task run......");
		
		if(!isEnabled()){
			getLogger().trace("Bill generator is diabled....");
			return;
		}
		
		List<Hotel> hotels=getGeneratorSevice().selectHotels();
		
		for(Hotel hotel: hotels){
			if(needGenerate(hotel)){
				getLogger().trace("hotel [{}] need to generate bill by cycle[{}]....", hotel.getName(), hotel.getBillingCycleString());
				List<DeviceUsage> usages=getGeneratorSevice().selectUnbilledUsage(hotel.getId());
				getLogger().trace("has [{}] usage records.", usages.size());
				if (usages.isEmpty() && !isGenerateZeroBill()) {
					continue;
				}
				BigDecimal income=new BigDecimal("0");
				BigDecimal payable=new BigDecimal("0");
				BigDecimal rent=new BigDecimal("0");
				for(DeviceUsage usage:usages){
					income=income.add(usage.getCharge());
					payable=payable.add(usage.getChargeStandard());
					rent=rent.add(usage.getRent());
				}				
				getLogger().trace("total income[{}], need pay distribute[{}]...", income.toString(), payable.toString());				
				Bill bill=new Bill();
				bill.setGeneratedTime(Calendar.getInstance().getTime());
				bill.setUuid(UUID.randomUUID().toString());
				bill.setHotel(hotel.getId());
				bill.setIncome(income);
				bill.setBasicCharge(payable);;	
				bill.setRent(rent);
				bill.setState(Constant.BILL_STATE_UNPAYED);
				getGeneratorSevice().insertGeneratedBill(bill, usages);
				getLogger().trace("bill for[{}] generated....", hotel.getName());
			} else {
				getLogger().trace("hotel [{}] cycle[{}] skiped....", hotel.getName(), hotel.getBillingCycleString());
			}
		}
		
	}
	
	int getMonthLastDate(Calendar current){
		current.set(Calendar.DAY_OF_MONTH, 1);
		current.add(Calendar.MONTH, 1);
		current.add(Calendar.DATE, -1);
		return current.get(Calendar.DAY_OF_MONTH);
	}
	
	int getQuarterMonth(Calendar current){
		int month= current.get(Calendar.MONTH);
		return month%3 + 1;		
	}
	
	boolean isLastDayOfMonth(Calendar current, int day){
		return current.get(Calendar.DAY_OF_MONTH)== day ||
				getMonthLastDate(current)<day;
	}
	
	int getMonth(Calendar current){
		return current.get(Calendar.MONTH) + 1;
	}
	
	private boolean needGenerate(Hotel hotel) {
		Calendar current=Calendar.getInstance();
		switch(hotel.getBillingCycle()){
		case Constant.BILL_CYCLE_WEEKLY:
			return (current.get(Calendar.DAY_OF_WEEK)==hotel.getBillingDateParam1());
		case Constant.BILL_CYCLE_MONTHLY:		
			return isLastDayOfMonth(current, hotel.getBillingDateParam2());
		case Constant.BILL_CYCLE_QUARTERLY:
			return (getQuarterMonth(current)==hotel.getBillingDateParam1() &&
				isLastDayOfMonth(current, hotel.getBillingDateParam2()));			
		case Constant.BILL_CYCLE_YEAERLY:
			return (getMonth(current)==hotel.getBillingDateParam1() && isLastDayOfMonth(current, hotel.getBillingDateParam2()));
		}		
		return false;
	}
}
