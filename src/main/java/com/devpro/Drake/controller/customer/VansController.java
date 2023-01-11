package com.devpro.Drake.controller.customer;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.Drake.controller.BaseController;
import com.devpro.Drake.dto.ProductSearchModel;
import com.devpro.Drake.service.BaseService;
import com.devpro.Drake.service.DanhMuc_Service;
import com.devpro.Drake.service.ProductService;

@Controller
public class VansController extends BaseController{
	@Autowired
	private DanhMuc_Service danhMuc_Service;
	
	@RequestMapping(value = "/Vans" ,method = RequestMethod.GET)
	public String Vans(final HttpServletRequest request,
			final HttpServletResponse response,
			final Model model) throws IOException{
		ProductSearchModel search=new ProductSearchModel();
		search.keyword=request.getParameter("keyword");
		search.setPage(getCurrentPage(request));
		model.addAttribute("vans" ,danhMuc_Service.search(search, "Vans"));
		model.addAttribute("searchModel",search);
		
		return "customer/danhmucVans";
		
	}

}
