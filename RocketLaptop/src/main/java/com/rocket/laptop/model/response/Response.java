package com.rocket.laptop.model.response;

import java.util.Map;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Response {
	private int status;
	private String message;
}
