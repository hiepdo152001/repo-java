package com.devpro.Drake.controller.administrator;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.Drake.entities.Role;
import com.devpro.Drake.entities.User;

import com.devpro.Drake.service.RolesService;
import com.devpro.Drake.service.UserService;

@Controller
public class AdminHomeController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private RolesService RolesService;
	
	@RequestMapping(value = "/admin/user" ,method=RequestMethod.GET )
	public String User(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		model.addAttribute("user", userService.findAll());
		model.addAttribute("roles", RolesService.findAll());
		
		return "administrator/user";
	}

	@RequestMapping(value = "/admin/deleteUser" , method=RequestMethod.POST )
	public ResponseEntity<Map<String, Object>> deleteUser(
			final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @RequestBody User user) throws IOException{
	  User users=userService.getById(user.getId());
	users.setStatus(false);
	userService.saveOrUpdate(users);
	Map<String , Object> jsonResult =new HashMap<String, Object>();
	jsonResult.put("code", 200);
	jsonResult.put("message", "delete thành công");
	
	return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = {"/admin/changeAdmin"} , method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> changeRole(
			final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			final@RequestBody User user)throws IOException{
		Role ADMIN=RolesService.getAdminRole();
		Role GUEST=RolesService.getGuestRole();
		User userbyId=userService.getById(user.getId());
		userbyId.deleteRole(GUEST);
		userbyId.addRole(ADMIN);
		userService.saveOrUpdate(userbyId);
		Map<String , Object> jsonResult=new HashMap<String, Object>();
		jsonResult.put("message", "done");
		jsonResult.put("success", "đã cấp quyền Admin");
		
		return ResponseEntity.ok(jsonResult);
		
		
	}
	@RequestMapping(value = {"/admin/changeGUEST"}, method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> changeGuest(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @RequestBody User user)throws IOException{
		Role Guest=RolesService.getGuestRole();
		Role Admin=RolesService.getAdminRole();
		User userbyId=userService.getById(user.getId());
		userbyId.deleteRole(Admin);
		userbyId.addRole(Guest);
		userService.saveOrUpdate(userbyId);
		Map<String , Object> jsonResult=new HashMap<String, Object>();
		jsonResult.put("massage", "done ");
		jsonResult.put("success", "đã cấp quyền Guest");
		return ResponseEntity.ok(jsonResult);
		
	}
	

}
