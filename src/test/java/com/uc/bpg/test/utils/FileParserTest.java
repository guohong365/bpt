package com.uc.bpg.test.utils;

import java.io.File;
import java.io.FileInputStream;
import org.junit.Test;

import com.uc.bpg.uitls.DeviceBatchFile;
import com.uc.bpg.uitls.DeviceBatchFileParserImpl;

public class FileParserTest {
	
	@Test
	public void test() throws Exception{
		String filePath="E:/stsWorkspace/bpg/src/main/doc";
		String fileName="batch_add.txt";
		
		String fullName=filePath + "/" + fileName;
		
		File file=new File(fullName);
		
		FileInputStream stream=new FileInputStream(file);
		byte[] bytes=new byte[(int) file.length()];
		stream.read(bytes);
		stream.close();
		DeviceBatchFileParserImpl parser=new DeviceBatchFileParserImpl();
		DeviceBatchFile batchFile= parser.parser(bytes);
		
		System.err.println("--------------------");
		System.err.println(batchFile.toString());		
		
		
		
	}
}
