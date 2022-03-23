package com.rocket.laptop.service;

import java.util.List;
import java.util.Map;

import com.rocket.laptop.model.FileDto;

public interface FileService {
	public void fileAdd(FileDto fileDto);
	
	public FileDto isType(int type, String product_code);
	
	public List<FileDto> getProductDetailFile(String product_code);
	
	public void fileDelete(String product_code);
}
