package com.rocket.laptop.exception;

public class OrderCancelFailException extends RuntimeException{
	public OrderCancelFailException(String message) {
		super(message);
	}
}
