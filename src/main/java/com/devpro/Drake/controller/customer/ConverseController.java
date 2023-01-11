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
import com.devpro.Drake.controller.administrator.categoryController;
import com.devpro.Drake.dto.BaseSearchModel;
import com.devpro.Drake.dto.ProductSearchModel;
import com.devpro.Drake.service.LayOutProductService;
import com.devpro.Drake.service.ProductService;
import com.devpro.Drake.service.DanhMuc_Service;

@Controller
public class ConverseController extends BaseController {
   @Autowired
  private ProductService productService;
   @Autowired
   private DanhMuc_Service danhMuc_Service;
	
	@RequestMapping(value = { "/Giỏ Hoa Quả" }, method = RequestMethod.GET)
	public String converse(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		ProductSearchModel search=new ProductSearchModel();
		search.keyword=request.getParameter("keyword");
		search.categoryId =getInteger(request, "categoryId");
	    search.setPage(getCurrentPage(request));
		model.addAttribute("converse",danhMuc_Service.search(search, "Giỏ Hoa Quả"));
		
		model.addAttribute("searchModel",search);
		
		return "customer/danhmucConverse";
	}
}
