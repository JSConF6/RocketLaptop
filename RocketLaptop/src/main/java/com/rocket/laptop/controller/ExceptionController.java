package com.rocket.laptop.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.rocket.laptop.exception.OrderFailException;
import com.rocket.laptop.model.ResponseDto;

@ControllerAdvice
public class ExceptionController {
	
	@ExceptionHandler(OrderFailException.class)
	public ResponseDto<String> OrderFail(Exception e){
		return new ResponseDto<String>(445, "주문정보를 확인 해주세요");
	}
}
