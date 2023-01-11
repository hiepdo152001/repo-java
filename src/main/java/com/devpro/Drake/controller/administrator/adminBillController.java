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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.Drake.entities.Product;
import com.devpro.Drake.entities.SaleOrder;
import com.devpro.Drake.entities.SaleOrderProducts;
import com.devpro.Drake.service.ProductService;
import com.devpro.Drake.service.SaleOderProductService;

import com.devpro.Drake.service.SaleOrderService;



@Controller
public class adminBillController {
	@Autowired
	private SaleOrderService saleOder_service;
	@Autowired
	private SaleOderProductService saleOderProductService;
	@Autowired
	private ProductService productService;
	@RequestMapping(value = {"/bill"} , method =  RequestMethod.GET)
	public String Bill(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response
			)throws IOException{
		model.addAttribute("saleOder",saleOder_service.findAll());
		model.addAttribute("saleOderProduct",saleOderProductService.findAll());
		
		return "administrator/bill";
	}
	@RequestMapping(value = {"/editBill/{saleOderId}"} , method =  RequestMethod.GET)
	public String editProduct(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("saleOderId") int saleOderId)throws IOException{
		
		model.addAttribute("saleOders", saleOder_service.getById(saleOderId));
		model.addAttribute("saleOderproduct",saleOderProductService.getById(saleOderId));
		return "administrator/editBill";
	}
	
	@RequestMapping(value = {"/editBill"} , method =  RequestMethod.GET)
	public String editBill(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response
			)throws IOException{
		model.addAttribute("saleOder",saleOder_service.findAll());
		model.addAttribute("saleOderProduct",saleOderProductService.findAll());
		
		return "administrator/editBill";
	}
	@RequestMapping(value = { "/editBill" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> editBill(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @RequestBody SaleOrder saleOder
										 
	) throws Exception {
		SaleOrder saleOders= saleOder_service.getById(saleOder.getId());
		saleOders.setTrang_thai("1");
		saleOders.setStatus(false);
		saleOder_service.saveOrUpdate(saleOders);
		Map<String , Object> jsonResult =new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "thành công");
		
		return ResponseEntity.ok(jsonResult);
		
			
	}
	@RequestMapping(value = { "/DeleteBill" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteBill(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @RequestBody SaleOrder saleOder
										 
	) throws Exception {
		SaleOrder saleOders= saleOder_service.getById(saleOder.getId());
		saleOders.setStatus(false);
		saleOders.setTrang_thai("2");
		saleOder_service.saveOrUpdate(saleOders);
		Map<String , Object> jsonResult =new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "delete thành công");
		
		return ResponseEntity.ok(jsonResult);
		
			
	}
	@RequestMapping(value = {"/billActive"} , method =  RequestMethod.GET)
	public String Billactive(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response
			)throws IOException{
		model.addAttribute("saleOder",saleOder_service.findAll());
		model.addAttribute("saleOderProduct",saleOderProductService.findAll());
		
		return "administrator/layout/BillActive";
	}
	@RequestMapping(value = {"/billNoActive"} , method =  RequestMethod.GET)
	public String BillNoactive(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response
			)throws IOException{
		model.addAttribute("saleOder",saleOder_service.findAll());
		model.addAttribute("saleOderProduct",saleOderProductService.findAll());
		
		return "administrator/layout/noActiveBill";
	}
//	@RequestMapping(value = { "/bill/delete"}, method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model, 
//			final HttpServletRequest request,
//			final HttpServletResponse response,
//			final @RequestBody Product product) throws IOException{
//		
//		SaleOder_service sale = saleOder_service.getById(product.getId());
//		SaleOderProductService saleOderProduct=saleOderProductService.getById(product.getId());
//		saleOder_service.delete(saleOder);
//		saleOderProductService.delete(saleOderProduct);
//		Map<String , Object> jsonResult =new HashMap<String, Object>();
//		jsonResult.put("code", 200);
//		jsonResult.put("message", "đã xoá thành công");
//		
//		return ResponseEntity.ok(jsonResult);
//	}

	
}
