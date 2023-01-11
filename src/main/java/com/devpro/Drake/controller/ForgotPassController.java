package com.devpro.Drake.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.Drake.entities.User;
import com.devpro.Drake.service.UserService;
@Controller
public class ForgotPassController extends BaseController {
	public String randomPassWord() {
		String passrandom=RandomStringUtils.randomAlphabetic(10);
		return passrandom;
	}
   @Autowired
   private UserService userService;
   @Autowired
   private JavaMailSender mailsender;
	@RequestMapping(value = "/forgotPassWord" ,method= RequestMethod.GET)
	public String forgotPassword(final HttpServletRequest request,
			final HttpServletResponse response,
			final Model model) throws IOException{
		
		return "ForgotPass";
	}
	@RequestMapping(value = "/forgotPassWord" , method = RequestMethod.POST)
	public String forgotPass(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)throws IOException{
		
		String nameEmail=request.getParameter("email");
		String username=request.getParameter("username");
		List<User> Alluser=userService.findAll();
		ArrayList<String> userEmail=new ArrayList<String>();
		ArrayList<String> arrayUsername=new ArrayList<String>();
		for (User userInDB : Alluser) {
			userEmail.add(userInDB.getEmail());
		}
		for (User userInDB : Alluser) {
			arrayUsername.add(userInDB.getUsername());
		}
		String message="";
//		for (int i = 0; i < arrayUsername.size(); i++) {
//			if(arrayUsername.get(i).contains(username))
//			{
		if(userEmail.contains(nameEmail))
		{
			User user=userService.loadUserByEmail(nameEmail);
			String newPass=randomPassWord();
			
			String setpass=new BCryptPasswordEncoder().encode(newPass);
			user.setPassword(setpass);
			userService.saveOrUpdate(user);
			
			message="kiểm tra email để nhận mật khẩu mới";
			
			//senemail 
			
			String content="mật khẩu đã được thay đổi thành công :"+newPass;
			SimpleMailMessage passWordMail= new SimpleMailMessage();
			passWordMail.setTo(nameEmail);
			passWordMail.setSubject("new PassWord");
			passWordMail.setText(content);
			mailsender.send(passWordMail);
			
			
		}
//		else {
//			message="email không đúng hoặc chưa được đăng kí ";
//		}
//			}
		
		else {
			message="email không đúng hoặc chưa được đăng kí ";
		}
//		}
		model.addAttribute("message", message);
		
		return "ForgotPass";
	}
	
	

}
