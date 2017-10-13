package com.uc.bpg.uitls;

public class DataFormatException extends Exception {
	private static final long serialVersionUID = 6050763688767880281L;
	
	public DataFormatException() {
	}
	
	public DataFormatException(Throwable throwable){
		super(throwable);
	}
	
	public DataFormatException(String msg){
		super(msg);
	}
	
	public DataFormatException(String msg, Throwable throwable){
		super(msg, throwable);
	}

}
