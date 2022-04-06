package com.rocket.laptop.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.rocket.laptop.model.AddressDto;
import com.rocket.laptop.model.CommentDto;
import com.rocket.laptop.model.QuestionDto;

@Mapper
@Repository
public interface AddressMapper {

	int addressAdd(AddressDto addressDto);

	int getAddressListCount(String user_id);

	List<AddressDto> getAddressList(String user_id);

	AddressDto getAddressDetail(AddressDto addressDto);

	int addressModify(AddressDto addressDto);

	int addressDelete(AddressDto addressDto);
	
}
