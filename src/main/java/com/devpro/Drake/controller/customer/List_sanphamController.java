package com.devpro.Drake.controller.customer;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.Drake.controller.BaseController;
import com.devpro.Drake.dto.Cart;
import com.devpro.Drake.dto.CartItem;
import com.devpro.Drake.dto.ProductSearchModel;
import com.devpro.Drake.entities.Categories;
import com.devpro.Drake.entities.Product;
import com.devpro.Drake.service.CategoriesService;
import com.devpro.Drake.service.DanhMuc_Service;
import com.devpro.Drake.service.PagerData;
import com.devpro.Drake.service.ProductImagesService;
import com.devpro.Drake.service.ProductService;
import com.mysql.cj.util.StringUtils.SearchMode;
import com.devpro.Drake.service.LayOutProductService;

@Controller
public class List_sanphamController extends BaseController {
	@Autowired 
	private CategoriesService categoriesService;
	
	@Autowired 
	private ProductService productService;
	@Autowired
	private LayOutProductService layOutProductService;
	
	@Autowired
	private ProductImagesService productImagesService;
	@RequestMapping(value = { "/trangchu" }, method = RequestMethod.GET)
	public String trangchu(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		ProductSearchModel searchmodel=new ProductSearchModel();
		searchmodel.keyword=request.getParameter("keyword");
		searchmodel.categoryId=getInteger(request, "categoryId");
		searchmodel.setPage(getCurrentPage(request));
		model.addAttribute("sanpham" ,layOutProductService.search(searchmodel));
		model.addAttribute("searchmodel",searchmodel);
		
		return "customer/layout";
	}
	
@RequestMapping(value = {"/trangchu/converse/{productSeo}"}, method = RequestMethod.GET)
public String converse(final Model model,
		final HttpServletRequest request,
		final HttpServletResponse response,
		@PathVariable("productSeo") String productSeo) throws IOException{
	
	ProductSearchModel searchModel = new ProductSearchModel();
	
	searchModel.seo = productSeo;

	PagerData<Product> products = productService.search(searchModel);
	Product product = products.getData().get(0);
	
	
	model.addAttribute("product", product);
	model.addAttribute("products", productService.findAll());
	model.addAttribute("productImages", productImagesService.findAll());
	model.addAttribute("category" ,categoriesService.findAll());
	
	return "customer/sanpham";
}
@RequestMapping(value = "ajax/ToCart" , method = RequestMethod.POST)
public ResponseEntity<Map<String, Object>> ajax_addToCart(final Model model,
		final HttpServletRequest request,
		final HttpServletResponse response,
		final @RequestBody CartItem cartItem) throws IOException{
	//lấy session thông qua request
	
	HttpSession session = request.getSession();
	
	//lấy thông tin giỏ hàng
	Cart cart=null;
	
	//kiểm tra trong session có đối tượng nào tên cart không
	
	if(session.getAttribute("cart")!=null) //nếu có
	{    //lấy đối tượng đó ra và add lại thành kiểu (Cart)
		cart=(Cart) session.getAttribute("cart");
	}
	else
	{ 
		//nếu không : khởi tạo đối tượng mới và set Cart
		cart=new Cart();
		session.setAttribute("cart",cart);
	}
	
	//lấy danh sách sản phẩm có trong giỏ hàng
	List<CartItem> cartItems= cart.getCartItems();
	
	//kiểm tra trong giỏ hàng có sp đó chưa
	boolean isExits=false;
	for (CartItem item : cartItems) {
		if(item.getProductId()==cartItem.getProductId())
		{
			isExits=true;
			item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());//số lg sản phẩm = slg của chi tiết sp + slg có trong sesion
		}
	}
	//nếu sp chưa có trong cartItem
	if(!isExits)
	{
		Product productInDb= productService.getById(cartItem.getProductId());
		cartItem.setProductName(productInDb.getTitle());
		cartItem.setPriceUnit(productInDb.getPrice());
		cartItem.setAvatar(productInDb.getAvatar());
		cartItem.setStatus(productInDb.getStatus());
		cart.getCartItems().add(cartItem);
		
		
		
	}
	// tính tổng tiền
			this.calculateTotalPrice(request);
			
			// trả về kết quả
			Map<String, Object> jsonResult = new HashMap<String, Object>();
			jsonResult.put("code", 200);
			jsonResult.put("status", "TC");
			jsonResult.put("totalItems", getTotalItems(request));

			session.setAttribute("totalItems", getTotalItems(request));
			return ResponseEntity.ok(jsonResult);
		}
private int getTotalItems(final HttpServletRequest request) {
	HttpSession httpSession = request.getSession();
     //kiểm tra cart trong giỏ hàng
	if (httpSession.getAttribute("cart") == null) {
		return 0;
	}
     //có
	Cart cart = (Cart) httpSession.getAttribute("cart");
	//lấy list cartitem
	List<CartItem> cartItems = cart.getCartItems();

	int total = 0;
	
	for (CartItem item : cartItems) {
		total += item.getQuanlity();
	}

	return total;
}

private void calculateTotalPrice(final HttpServletRequest request) {

	// để lấy session sử dụng thông qua request
	// session tương tự như kiểu Map và được lưu trên main memory.
	HttpSession session = request.getSession();

	// Lấy thông tin giỏ hàng.
	Cart cart = null;
	if (session.getAttribute("cart") != null) {
		cart = (Cart) session.getAttribute("cart");
	} else {
		cart = new Cart();
		session.setAttribute("cart", cart);
	}

	// Lấy danh sách sản phẩm có trong giỏ hàng
	List<CartItem> cartItems = cart.getCartItems();
	BigDecimal total = BigDecimal.ZERO;
	
	for(CartItem ci : cartItems) {
		total = total.add(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuanlity())));
	}

	cart.setTotalPrice(total);
}


}
