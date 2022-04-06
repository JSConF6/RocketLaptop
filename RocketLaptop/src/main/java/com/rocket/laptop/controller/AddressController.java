package com.rocket.laptop.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rocket.laptop.model.AddressDto;
import com.rocket.laptop.model.ResponseDto;
import com.rocket.laptop.service.AddressService;

@Controller
public class AddressController {

	private static final Logger logger = LoggerFactory.getLogger(AddressController.class);
	
	@Autowired
	private AddressService addressService;
	
	@GetMapping("/user/mypage/address/list")
	public String addressListView(@RequestParam("user_id") String user_id, Model model) {
		logger.info("배송지 목록으로 이동");
		
		int listCount = addressService.getAddressListCount(user_id);
		List<AddressDto> addressList = addressService.getAddressList(user_id);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("addressList", addressList);
		
		return "/user/addressListView";
	}
	
	@GetMapping("/user/mypage/address/detail")
	@ResponseBody
	public ResponseDto<AddressDto> addressListView(AddressDto addressDto) {
		logger.info("배송지 정보");
		
		AddressDto addressDetail = addressService.getAddressDetail(addressDto);
		
		return new ResponseDto<AddressDto> (HttpStatus.OK.value(), addressDetail);
	}
	
	@PostMapping("/user/mypage/address/add")
	@ResponseBody
	public ResponseDto<String> addressAdd(AddressDto addressDto) {
		logger.info("배송지 등록");
		
		int result = addressService.addressAdd(addressDto);
		
		if(result != 1) {
			return new ResponseDto<String> (HttpStatus.BAD_REQUEST.value(), "배송지 등록 실패");
		}
		
		return new ResponseDto<String> (HttpStatus.OK.value(), "배송지 등록 성공");
	}
	
	@PostMapping("/user/mypage/address/modify")
	@ResponseBody
	public ResponseDto<String> addressModify(AddressDto addressDto) {
		logger.info("배송지 수정");
		
		int result = addressService.addressModify(addressDto);
		
		if(result != 1) {
			return new ResponseDto<String> (HttpStatus.BAD_REQUEST.value(), "배송지 수정 실패");
		}
		
		return new ResponseDto<String> (HttpStatus.OK.value(), "배송지 수정 성공");
	}
	
	@PostMapping("/user/mypage/address/delete")
	@ResponseBody
	public ResponseDto<String> addressDelete(AddressDto addressDto) {
		logger.info("배송지 삭제");
		
		int result = addressService.addressDelete(addressDto);
		
		if(result != 1) {
			return new ResponseDto<String> (HttpStatus.BAD_REQUEST.value(), "배송지 삭제 실패");
		}
		
		return new ResponseDto<String> (HttpStatus.OK.value(), "배송지 삭제 성공");
	}
}
