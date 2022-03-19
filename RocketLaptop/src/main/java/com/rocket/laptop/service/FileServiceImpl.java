package com.rocket.laptop.service;

import java.util.HashMap;
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

}
