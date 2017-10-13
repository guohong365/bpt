package com.uc.bpg.uitls;

import java.io.IOException;

public class IllegalHeaderFormat extends IOException {
	private static final long serialVersionUID = 8513319192682619247L;
	
	public IllegalHeaderFormat(Throwable throwable){
		super(throwable);
	}
	
	public IllegalHeaderFormat(String msg){
		super(msg);
	}
	
	public IllegalHeaderFormat(String msg, Throwable throwable) {
		super(msg, throwable);		
	}
	public IllegalHeaderFormat(){		
	}

}
