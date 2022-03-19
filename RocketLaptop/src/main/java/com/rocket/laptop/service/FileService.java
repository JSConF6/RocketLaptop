package com.rocket.laptop.service;

import java.util.Map;

import com.rocket.laptop.model.FileDto;

public interface FileService {
	public void fileAdd(FileDto fileDto);
	
	public FileDto isType(int type, String product_code);
}
