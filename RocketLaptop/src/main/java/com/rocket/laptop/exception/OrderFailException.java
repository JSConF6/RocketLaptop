package com.rocket.laptop.exception;

public class OrderFailException extends RuntimeException{
	public OrderFailException(String message) {
		super(message);
	}
}
