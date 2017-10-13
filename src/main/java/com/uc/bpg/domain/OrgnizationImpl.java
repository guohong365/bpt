package com.uc.bpg.domain;

import java.util.Date;

import com.uc.web.domain.AbstractOrgnization;
import com.uc.web.domain.WithLongId;
import com.uc.web.tools.annotation.AutoGenerateEntity;
import com.uc.web.tools.annotation.ComponentType;
import com.uc.web.tools.annotation.FormField;

@AutoGenerateEntity
public class OrgnizationImpl extends AbstractOrgnization implements WithLongId {
	private String uuid;
	@FormField(value="地址", order=10)
	private String address;
	@FormField(value="电话", order=11)
	private String tele;
	@FormField(value="联系人", order=12)
	private String linkman;
	@FormField(value="备注", component=ComponentType.TEXT_AREA, order=13)
	private String description;
	private Long creater;
	@FormField(value="创建时间",order=101, readOnly=true)
	private Date createTime;
	private String type;
	private Long cancelater;
	@FormField(value="注销时间", order=201, readOnly=true)
	private Date cancelTime;
	@FormField(value="创建人", order=100,readOnly=true)
	private String createrName;
	@FormField(value="注销人", order=200, readOnly=true)
	private String cancelaterName;
	
	public Long getId(){
		return (Long) super.getId();
	}
	public void setId(Long id){
		super.setId(id);
	}
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTele() {
		return tele;
	}
	public void setTele(String tele) {
		this.tele = tele;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Long getCreater() {
		return creater;
	}
	public void setCreater(Long creater) {
		this.creater = creater;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Long getCancelater() {
		return cancelater;
	}
	public void setCancelater(Long cancelater) {
		this.cancelater = cancelater;
	}
	public Date getCancelTime() {
		return cancelTime;
	}
	public void setCancelTime(Date cancelTime) {
		this.cancelTime = cancelTime;
	}
	public String getCreaterName() {
		return createrName;
	}
	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}
	public String getCancelaterName() {
		return cancelaterName;
	}
	public void setCancelaterName(String cancelaterName) {
		this.cancelaterName = cancelaterName;
	}
	
 
}