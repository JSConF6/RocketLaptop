package com.rocket.laptop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rocket.laptop.model.AddressDto;
import com.rocket.laptop.repository.AddressMapper;

@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	private AddressMapper addressMapper;
	
	@Override
	public int addressAdd(AddressDto addressDto) {
		return addressMapper.addressAdd(addressDto);
	}

	@Override
	public int getAddressListCount(String user_id) {
		return addressMapper.getAddressListCount(user_id);
	}

	@Override
	public List<AddressDto> getAddressList(String user_id) {
		return addressMapper.getAddressList(user_id);
	}

	@Override
	public AddressDto getAddressDetail(AddressDto addressDto) {
		return addressMapper.getAddressDetail(addressDto);
	}

	@Override
	public int addressModify(AddressDto addressDto) {
		return addressMapper.addressModify(addressDto);
	}

	@Override
	public int addressDelete(AddressDto addressDto) {
		return addressMapper.addressDelete(addressDto);
	}

}
