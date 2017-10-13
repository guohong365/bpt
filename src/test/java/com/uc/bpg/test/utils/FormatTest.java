package com.uc.bpg.test.utils;

import org.junit.Test;

import com.uc.bpg.forms.RoleQueryForm;

public class FormatTest {
	
	@Test
	public void test(){
		RoleQueryForm queryForm=new RoleQueryForm();
		
		System.err.println(queryForm.toString());
	}

}
