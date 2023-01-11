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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.Drake.entities.Categories;
import com.devpro.Drake.entities.Contact;
import com.devpro.Drake.entities.Product;
import com.devpro.Drake.entities.SaleOrder;
import com.devpro.Drake.service.CategoriesService;

@Controller
public class categoryController {
	
 @Autowired
 private CategoriesService categoriesService;
 
	@RequestMapping(value = { "/admin/category" }, method = RequestMethod.GET)
	public String adminCategory(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response
			) throws IOException {
		
		
		model.addAttribute("category" , new Categories());
		
		return "administrator/category";
	}
	@RequestMapping(value = { "/admin/listcategory" }, method = RequestMethod.GET)
	public String listCategory(final Model model, final HttpServletRequest request,
			final HttpServletResponse response
			) throws IOException {
		
		
		model.addAttribute("category" , new Categories());
		model.addAttribute("categories",categoriesService.findAll());
		return "administrator/listCategory";
	}
	//sửa theo ID
	@RequestMapping(value = { "/admin/category/{categoryId}" }, method = RequestMethod.GET)
	public String editCategory(final Model model, final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("categoryId") int categoryId) throws IOException {
		
		
		model.addAttribute("category" ,categoriesService.getById(categoryId));
		
		return "administrator/category";
	}
	
	@RequestMapping(value = { "/DeleteCategories" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteBill(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @RequestBody Categories categories)throws IOException{
		Categories categorie= categoriesService.getById(categories.getId());
		categorie.setStatus(false);
		categoriesService.saveOrUpdate(categorie);
		Map<String , Object> jsonResult =new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "delete thành công");
		
		return ResponseEntity.ok(jsonResult);
		
		
		
	}
	
	
	@RequestMapping(value = { "/admin/category" }, method = RequestMethod.POST)
	public String adminSaveCategory(final Model model, final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("category") Categories category) throws IOException {
		
		if(category.getId()==null || category.getId()<=0)
		{
			categoriesService.saveOrUpdate(category);
		}
		
		else
		{ // chỉnh sửa
			
			categoriesService.update(category);
		}

		return "redirect:/admin/listcategory";
	}
}
