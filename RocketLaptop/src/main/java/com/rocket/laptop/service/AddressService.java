package com.rocket.laptop.service;

import java.util.List;

import com.rocket.laptop.model.AddressDto;

public interface AddressService {
	public int addressAdd(AddressDto addressDto);

	public int getAddressListCount(String user_id);

	public List<AddressDto> getAddressList(String user_id);

	public AddressDto getAddressDetail(AddressDto addressDto);

	public int addressModify(AddressDto addressDto);

	public int addressDelete(AddressDto addressDto);
}
