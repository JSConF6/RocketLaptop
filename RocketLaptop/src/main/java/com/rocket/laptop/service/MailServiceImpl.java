package com.rocket.laptop.service;

import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.rocket.laptop.model.UserDto;

@Service
public class MailServiceImpl implements MailService {

	private final Logger logger = LoggerFactory.getLogger(MailServiceImpl.class);

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private UserService userService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Value("${sendfile}")
	private String sendfile;

	@Override
	public void sendMailPassword(UserDto userDto) throws MessagingException {
		logger.info("임시 비밀번호 전송");
		
		String pwd = getTempPassword();

		StringBuilder sb = new StringBuilder();
		sb.append("<img src='cid:logo'><br/>안녕하세요. RocketLaptop 임시 비밀번호 안내 관련 이메일 입니다.<br/>");
		sb.append("[" + userDto.getUser_id() + "]" + "님의 임시 비밀번호는 ");
		sb.append(pwd + " 입니다. 로그인 후 비밀번호를 변경 해주세요.");

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(message, true, "UTF-8");

		mimeMessageHelper.setTo(userDto.getUser_email());
		mimeMessageHelper.setSubject(userDto.getUser_name() + "님의 RocketLaptop 임시비밀번호 안내 이메일 입니다.");
		mimeMessageHelper.setText(sb.toString(), true);

		FileSystemResource file = new FileSystemResource(new File(sendfile));
		mimeMessageHelper.addInline("logo", file);

		updatePassword(pwd, userDto);

		mailSender.send(message);
	}

	public void updatePassword(String pwd, UserDto userDto) {
		String encPassword = bCryptPasswordEncoder.encode(pwd);

		userDto.setUser_password(encPassword);

		userService.updateFindPassword(userDto);
	}

	public String getTempPassword() {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		String pwd = "";

		int idx = 0;
		for (int i = 0; i < 10; i++) {
			idx = (char) (charSet.length * Math.random());
			pwd += charSet[idx];
		}

		return pwd;
	}

}
