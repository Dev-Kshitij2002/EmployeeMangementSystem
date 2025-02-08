package com.ty.empapp.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

	 @Autowired
	 private JavaMailSender mailSender;

	 public void sendEmailWithAttachment(String to, String subject, String body, MultipartFile attachment)
	            throws MessagingException, IOException {

	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true);

	        helper.setTo(to);
	        helper.setSubject(subject);
	        helper.setText(body, true);

	        if (attachment != null && !attachment.isEmpty()) {
	            helper.addAttachment(attachment.getOriginalFilename(), attachment);
	        }

	        mailSender.send(message);
	    }
}