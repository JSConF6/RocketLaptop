package com.rocket.laptop.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import com.rocket.laptop.model.UserDto;

public interface MailService {
	void sendMailPassword(UserDto userDto) throws MessagingException;
}
