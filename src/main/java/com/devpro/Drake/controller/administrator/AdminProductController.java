package com.devpro.Drake.controller.administrator;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import org.springframework.web.servlet.ModelAndView;

import com.devpro.Drake.controller.BaseController;
import com.devpro.Drake.dto.ProductSearchModel;
import com.devpro.Drake.entities.Categories;
import com.devpro.Drake.entities.Product;
import com.devpro.Drake.entities.product_image;
import com.devpro.Drake.service.CategoriesService;
import com.devpro.Drake.service.ProductService;

@Controller
public class AdminProductController extends BaseController {

	@Autowired
	private CategoriesService categoriesService;
	
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping(value = { "/admin" }, method = RequestMethod.GET)
	public String admin(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		model.addAttribute("product", new Product());
		return "administrator/admin";
	}
	@RequestMapping(value = { "/admin/addproduct" }, method = RequestMethod.GET)
	public String adminProductAddOrUpdate(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		model.addAttribute("product", new Product());	
		return "administrator/admin";
	}
	
	//return về cái trang chứa thông tin product edit
	@RequestMapping(value = {"/admin/addproduct/{productId}"} , method =  RequestMethod.GET)
	public String editProduct(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") int productId)throws IOException{
		
		model.addAttribute("product", productService.getById(productId));
		
		return "administrator/admin";
	}
	@RequestMapping(value = { "/admin/product/delete"}, method = RequestMethod.POST)
		public ResponseEntity<Map<String, Object>> deleteProduct(final Model model, 
				final HttpServletRequest request,
				final HttpServletResponse response,
				final @RequestBody Product product) throws IOException{
			
			Product productInDB= productService.getById(product.getId());
			productInDB.setStatus(false);
			productService.saveOrUpdate(productInDB);
			Map<String , Object> jsonResult =new HashMap<String, Object>();
			jsonResult.put("code", 200);
			jsonResult.put("message", "đã xoá thành công");
			
			return ResponseEntity.ok(jsonResult);
		}
	
	// list sp
	@RequestMapping(value = { "/admin/product/list" }, method = RequestMethod.GET)
	public String adminProductList (final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response
			
			) throws IOException {
		
		List<Categories> products =categoriesService.findAll();
		ModelAndView modelAndView=new ModelAndView("/product/list","products",products);
		
//		ProductSearchModel searchModel = new ProductSearchModel();
//		searchModel.keyword = request.getParameter("keyword");
//		searchModel.categoryId =getInteger(request, "categoryId");
//		searchModel.setPage(getCurrentPage(request));
//		
//		model.addAttribute("listPro",productService.search(searchModel));
//		model.addAttribute("searchModel",searchModel);
		return "administrator/list";
	}
	

	@RequestMapping(value = { "/admin" }, method = RequestMethod.POST)
	public String adminProductAddOrUpdate(final Model model, 
										  final HttpServletRequest request,
										  final HttpServletResponse response, 
										  @ModelAttribute("product") Product product,
										  @RequestParam("productAvatar") MultipartFile productAvatar,
										  @RequestParam("productPictures") MultipartFile[] productPictures
	) throws Exception {

		if (product.getId() == null || product.getId() <= 0) { // thÃªm má»›i
			productService.add(product, productAvatar, productPictures);
		}
		else
		{ // chỉnh sửa
			
			productService.update(product, productAvatar, productPictures);
		}

		return "redirect:/admin/product/list";
	}


	
	
	
}



