package com.devpro.Drake.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.Drake.entities.User;
import com.devpro.Drake.service.UserService;

@Controller
public class changePassword extends BaseController{
   @Autowired 
   private UserService userService;
   
	@RequestMapping(value = {"/changePassWord"} , method=RequestMethod.GET)
	public String changePassWord(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)throws IOException{
		return "changePassWord";
	}
	@RequestMapping(value = {"/changePassWord"}, method=RequestMethod.POST)
	public String changePasswordd(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)throws IOException{
		BCryptPasswordEncoder passwordenycode=new BCryptPasswordEncoder();
		String newUserName=request.getParameter("Username");
		String existingPassWord= request.getParameter("PassWord");
		String newPass=request.getParameter("password");
		List<User> username=userService.findAll();
		ArrayList<String> user=new ArrayList<String>();
		ArrayList<String> DbPass=new ArrayList<String>();
		for (User users : username) {
			user.add(users.getUsername());
		}
		for (User u : username) {
			DbPass.add(u.getPassword());
		}
		String message="";
		boolean test;
		for (int i = 0; i < user.size(); i++) {
		if(user.get(i).contains(newUserName))
		{
			if(passwordenycode.matches(existingPassWord, DbPass.get(i)))
		    {
			User name=userService.loadUserByUsername(newUserName);
			String newpass=new BCryptPasswordEncoder().encode(newPass);
			name.setPassword(newpass);
			userService.saveOrUpdate(name);
			message="b???n ???? thay ?????i m???t kh???u th??nh c??ng ^.^ !";
			test=true;
		     }
			else {
				message="m???t kh???u hi???n t???i kh??ng ????ng ";	
			}
		}
		if(test=false) {
			message="username kh??ng ????ng ho???c ch??a ???????c ????ng k?? ";
		}
	}
		model.addAttribute("message",message);
		return "changePassWord";
}
}
	
