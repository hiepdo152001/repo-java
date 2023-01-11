package com.devpro.Drake.controller.customer;

import java.io.File;
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
import com.devpro.Drake.dto.ContactSearchModel;
import com.devpro.Drake.entities.Contact;
import com.devpro.Drake.service.ContactService;







@Controller
public class ContactController extends BaseController {
	
	@Autowired
	private ContactService contactService;
	
	
	@RequestMapping(value = { "/trangchu/contact" }, method = RequestMethod.GET)
public String home(final Model model,
		final HttpServletRequest request, 
		final HttpServletResponse response)
		throws IOException {
		
		Contact contact =new Contact();
		model.addAttribute("contacts", new Contact());
		
	return "administrator/contact";
}
//cách 1:
//@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
//public String simpleContact(final Model model,
//		final HttpServletRequest request, 
//		final HttpServletResponse response
//        ) throws IOException{
//		
//String hoten=request.getParameter("Hoten");
//String diachi=request.getParameter("Diachi");
//String noidung=request.getParameter("Noidung");
//System.out.println(hoten);
//System.out.println(diachi);
//System.out.println(noidung);
//
//	return "customer/contact";
//}


@RequestMapping(value = {"/trangchu/contact"},method = RequestMethod.POST)
public String loadDB_contact(final Model model,
		final HttpServletRequest request,
		final HttpServletResponse response,
		@ModelAttribute("contacts") Contact contact) throws IOException{
	
	if(contact.getId()==null || contact.getId()<=0)
	{
		contactService.saveOrUpdate(contact);
	}
	return "administrator/contact";
}
@RequestMapping(value = {"/trangchu/List_contact/{contactid}"},method = RequestMethod.GET )
public String search(final Model model,
		final HttpServletRequest request,
		final HttpServletResponse response,
		@PathVariable("contactid") int contactid
		) throws IOException{
	model.addAttribute("contact",contactService.getById(contactid));
	model.addAttribute("list_contact" ,contactService.findAll());
	
	return "administrator/listContact";
}
@RequestMapping(value = {"/trangchu/List_contact"},method = RequestMethod.GET )
public String List_contact(final Model model,
		final HttpServletRequest request,
		final HttpServletResponse response
		) throws IOException{
	ContactSearchModel searchModel=new ContactSearchModel();
	searchModel.keyword=request.getParameter("keyword");
	searchModel.Id=getInteger(request,"Id");
	searchModel.setPage(getCurrentPage(request));
	model.addAttribute("search_contact",contactService.search(searchModel));
	model.addAttribute("searchModelContact",searchModel);
	
	return "administrator/listContact";
}
}
//ajax cach 3:
//@RequestMapping(value ={"/ajax/contact"},method = RequestMethod.POST)
//public ResponseEntity<Map<String, Object>> ajax_contact(
//		final Model model,
//		final HttpServletRequest request, 
//		final HttpServletResponse response,
//		final @RequestBody Contact contact){
//	System.out.println(contact.getHoten());
//	System.out.println(contact.getDiachi());
//	System.out.println(contact.getNoidung());
//	Map<String, Object> jsonResult=new HashMap<String, Object>();
//	jsonResult.put("code",200);
//	jsonResult.put("message" ,"camon ban" + contact.getDiachi() +"chung toi se lien he ban som nhat");
//return ResponseEntity.ok(jsonResult);
//}

		


