package com.rocket.laptop.controller;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rocket.laptop.exception.OrderCancelFailException;
import com.rocket.laptop.exception.OrderFailException;
import com.rocket.laptop.model.ResponseDto;

@ControllerAdvice
public class ExceptionController {
	
	private final Logger logger = LoggerFactory.getLogger(ExceptionController.class);
	
	@ExceptionHandler(OrderFailException.class)
	@ResponseBody
	public ResponseDto<String> OrderFail(Exception e){
		logger.info("DB에 주문정보 저장 중 오류 발생");
		
		return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), e.getMessage());
	}
	
	@ExceptionHandler(OrderCancelFailException.class)
	@ResponseBody
	public ResponseDto<String> OrderCancelFail(Exception e){
		logger.info("주문취소중 오류발생");
		
		return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), e.getMessage());
	}
}
