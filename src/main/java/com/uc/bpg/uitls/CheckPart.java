package com.uc.bpg.uitls;

public enum CheckPart {
	FileName(0x01),	
	HeaderLines(0x02),
	HeaderBytes(0x04),
	BodyLines(0x8),
	BodyBytes(0x10);
	
	private int value;

	private CheckPart(int value) {
		this.value=value;
	}
	public int getValue(){
		return value;
	}
	public boolean in(int value){
		return (this.value&value)==this.value;
	}
	public boolean notIn(int value){
		return (this.value&value)!=this.value;
	}
}
