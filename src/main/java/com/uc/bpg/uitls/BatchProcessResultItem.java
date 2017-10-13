package com.uc.bpg.uitls;

public class BatchProcessResultItem {
	private String item;
	private String msg;
	private boolean ok;
	public BatchProcessResultItem(String item, String msg, boolean ok) {
		this.item=item;
		this.msg=msg;
		this.ok=ok;
	}
	
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
}
