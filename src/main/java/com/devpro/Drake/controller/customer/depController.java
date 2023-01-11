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
import com.devpro.Drake.service.DanhMuc_Service;

@Controller
public class depController extends BaseController {
	@Autowired DanhMuc_Service danhMuc_Service;
@RequestMapping(value = ("/Dép"),method = RequestMethod.GET)
public String DepProduct(final Model model,
		final HttpServletRequest request,
		final HttpServletResponse response)throws IOException{
	ProductSearchModel search=new ProductSearchModel();
	search.keyword=request.getParameter("keyword");
	search.setPage(getCurrentPage(request));
	
	model.addAttribute("dep",danhMuc_Service.search(search, "Dép"));
	return "customer/danhmucDep";
	
}
}
