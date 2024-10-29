package com.bitc.jeogi.common.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MailController {
	
	private final JavaMailSender mailSender;	
	
	@GetMapping("checkEmail")
	public String sendMail() throws Exception{
		
		
		
		return "redirect:/";
	}

}






