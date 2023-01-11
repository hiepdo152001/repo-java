package com.devpro.Drake.conf;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;



@Configuration
public class EmailConf {
    @Bean
    public JavaMailSender getJavaMailSender() {
    	JavaMailSenderImpl mailSender =new JavaMailSenderImpl();
    	mailSender.setHost("smtp.gmail.com");
    	mailSender.setPort(587);
    	
    	mailSender.setUsername("hiepdo152001@gmail.com");
    	mailSender.setPassword("vfpwhplkmqampsjs");
    	
    	Properties prop=mailSender.getJavaMailProperties();
    	prop.put("mail.transport.protocol","smtp");
    	prop.put("mail.smtp.auth", "true");
    	prop.put("mail.smtp.starttls.enable","true");
    	prop.put("mail.debug", "true");
		return mailSender;
    	
    }

	
}
