package com.devpro.Drake.controller.customer;

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

import com.devpro.Drake.controller.BaseController;
import com.devpro.Drake.entities.Product;
import com.devpro.Drake.entities.SaleOrderProducts;
import com.devpro.Drake.service.ProductService;
import com.devpro.Drake.service.SaleOderProductService;
import com.devpro.Drake.service.SaleOrderService;
import com.devpro.Drake.service.UserService;

@Controller
public class historyController extends BaseController {
	@Autowired 
   private	ProductService productService;
	@Autowired
	private SaleOderProductService saleOderProductService;
	@Autowired
	private SaleOrderService saleOrderService;
	
	@RequestMapping(value = {"/history"},method=RequestMethod.GET)
	public String history(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)throws
	 IOException{
		model.addAttribute("product",productService.findAll());
		model.addAttribute("saleOder",saleOrderService.findAll());
		model.addAttribute("saleOderProduct",saleOderProductService.findAll());
		
		return "customer/history";
				
	}
	@RequestMapping(value = {"/deleteSaleOderProduct"},method=RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> deleteSaleOderProduct(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@RequestBody SaleOrderProducts saleOrderProducts)throws IOException{
		SaleOrderProducts saleO_product=saleOderProductService.getById(saleOrderProducts.getId());
		saleO_product.setStatus(false);
	     saleOderProductService.saveOrUpdate(saleO_product);
	     
	     Map<String, Object> jsonResult=new HashMap<String, Object>();
	     jsonResult.put("code", 200);
	     jsonResult.put("massage", "bạn đã xoá thành công ");
	     
	     return ResponseEntity.ok(jsonResult);
				
			}

}
