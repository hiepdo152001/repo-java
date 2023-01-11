package com.devpro.Drake.controller.customer;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.Drake.controller.BaseController;
import com.devpro.Drake.entities.User;
import com.devpro.Drake.service.UserService;

@Controller
public class profileController extends BaseController {
	@Autowired
private	UserService userService;
@RequestMapping(value = {"/profileUser"},method = RequestMethod.GET)
public String profile(final Model model,
		final HttpServletRequest request,
		final HttpServletResponse response)throws IOException{
	User user=new User();
	model.addAttribute("user",user);
	
	return "customer/profileUser";
}
@RequestMapping(value = {"/profileUser/{UserId}"} , method =  RequestMethod.GET)
public String profileUserEdit(final Model model,
		final HttpServletRequest request,
		final HttpServletResponse response,
		@PathVariable("UserId") int UserId)throws IOException{
	
	model.addAttribute("user", userService.getById(UserId));
	
	return "customer/profileUser";
}
@RequestMapping(value = {"/profileUser"},method = RequestMethod.POST)
public String profileUsers(final Model model,
		final HttpServletRequest request,
		final HttpServletResponse response,
		@ModelAttribute("user") User user,
		@RequestParam("userAvatar") MultipartFile userAvatar
        )throws IOException{
	if (user.getId()== null || user.getId()<=0) { // thÃªm má»›i
		return "redirect:/profileUser";
	}
	else
	{ // chỉnh sửa
		
		userService.update(user, userAvatar);
	}
	
		return "redirect:/trangchu";
}
}
