package com.rocket.laptop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rocket.laptop.model.FileDto;
import com.rocket.laptop.repository.FileMapper;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private FileMapper fileMapper;
	
	@Override
	public void fileAdd(FileDto fileDto) {
		fileMapper.fileInsert(fileDto);
	}

	@Override
	public FileDto isType(int type, String product_code) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("product_code", product_code);
		
		return fileMapper.findByType(map);
	}

	@Override
	public List<FileDto> getProductDetailFile(String product_code) {
		return fileMapper.getProductDetailFile(product_code);
	}

	@Override
	public void fileDelete(String product_code) {
		fileMapper.fileDelete(product_code);
	}

	@Override
	public List<FileDto> getAllFiles(String product_code) {
		return fileMapper.getAllFiles(product_code);
	}

	@Override
	public void fileModify(FileDto fileDto, String product_code) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("fileDto", fileDto);
		map.put("product_code", product_code);
		
		fileMapper.fileModify(map);
	}

}
