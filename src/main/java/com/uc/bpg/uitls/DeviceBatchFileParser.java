package com.uc.bpg.uitls;

import java.io.IOException;

public interface DeviceBatchFileParser {

	DeviceBatchFile parser(byte[] fileBytes) throws IOException;

}