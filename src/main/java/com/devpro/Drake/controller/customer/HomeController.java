package com.devpro.Drake.controller.customer;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.Drake.dto.employee;

import com.devpro.Drake.entities.Categories;
import com.devpro.Drake.entities.Product;
import com.devpro.Drake.service.CategoriesService;

//Định nghĩa 1 Bean(dành cho Controller trong mô hình MVC)
@Controller
public class HomeController {
//	@Autowired
//	private CategoriesService categoriesService;
//	
//	@RequestMapping(value = { "/trangchu" }, method = RequestMethod.GET)
//	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
//			throws IOException {
//		
//	Categories categories = categoriesService.getOneByNativeSQL("select * from tbl_category where id= '1' ");
////	List<Categories> categories=categoriesService.findAll();
////	for (Categories cate : categories) {
////		System.out.println(cate.getName());
////	}
//	System.out.println(categories.getName());
//		
//		
//		employee em =new employee("hiep",17);
//		model.addAttribute("dungtennay",em);
//		return "customer/layout";
//	}
//	
//	
//	@RequestMapping(value = {"/trangchu/vans"}, method = RequestMethod.GET)
//	public String vans(final Model model,
//			final HttpServletRequest request,
//			final HttpServletResponse response) throws IOException{
//		return "customer/vans";
//	}
//	@RequestMapping(value = { "/sanpham" }, method = RequestMethod.GET)
//	public String sanpham(final Model model, final HttpServletRequest request, final HttpServletResponse response)
//			throws IOException {
//		return "customer/sanpham";
//	}
//	
//	
//	
}



