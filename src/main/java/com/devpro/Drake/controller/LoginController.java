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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.Drake.entities.Role;
import com.devpro.Drake.entities.User;
import com.devpro.Drake.service.RolesService;
import com.devpro.Drake.service.UserService;

@Controller
public class LoginController extends BaseController  {
	@Autowired
	private UserService userService;
    
	@Autowired
	private RolesService rolesService;
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String login(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "login";
	}
	
	@RequestMapping(value = { "/registration" }, method = RequestMethod.GET)
	public String registration(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		User user=new User();
		model.addAttribute("user", new User());
		return "registration";
	}
	private void addNewUser(User user) {
		User u=new User();
		u.setUsername(user.getUsername());
		u.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
		u.setEmail(user.getEmail());
	    u.setAdress(user.getAdress());
	    u.setPhone(user.getPhone());
	    u.setName(user.getName());
	    u.setAvatar(user.getAvatar());
		Role guest = rolesService.getGuestRole();
		u.addRole(guest);
		userService.saveOrUpdate(u);
	}
//	@RequestMapping(value = { "/registration" }, method = RequestMethod.POST)
//	public String registrationDB(final Model model,
//			final HttpServletRequest request,
//			final HttpServletResponse response,
//			@ModelAttribute("user") User user
//		
//			)
//			throws IOException {
//		
//		
//		if(user.getId()==null||user.getId()<=0)
//		{   
//			addNewUser(user);
//					
//		}
//		
//		return "redirect:/registration";
//	}
	@RequestMapping(value = { "/registration" }, method = RequestMethod.POST)
	public String signUpAdd(final Model model, 
						final HttpServletRequest request, 
						final HttpServletResponse response,
						@ModelAttribute("user") User user)
			throws IOException {
		
			List<User> allUser = userService.findAll();
			ArrayList<String> userName= new ArrayList<String>();
			ArrayList<String> userEmail= new ArrayList<String>();
			for (User userInDb : allUser) {
				userName.add(userInDb.getUsername());
				userEmail.add(userInDb.getEmail());
			}
			String finalForm = new String();
			if (userName.contains(user.getUsername())==false && userEmail.contains(user.getEmail())==false) {
				user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
				Role guest = rolesService.getGuestRole();
				user.addRole(guest);
				userService.saveOrUpdate(user);
				finalForm = "redirect:/login";
			} else if (userName.contains(user.getUsername()) && userEmail.contains(user.getEmail())){
				model.addAttribute("emailFalse", "Email đã được sử dụng :(");
				model.addAttribute("userFalse", "Tên đăng nhập đã tồn tại :((");
				finalForm = "registration";
			} else if (userName.contains(user.getUsername())){
				model.addAttribute("userFalse", "Tên đăng nhập đã tồn tại :((");
				finalForm = "registration";
			} else if(userEmail.contains(user.getEmail())){
				model.addAttribute("emailFalse", "Email đã được sử dụng :((");
				finalForm = "registration";
			}
			
		return finalForm;
	}
	
}
