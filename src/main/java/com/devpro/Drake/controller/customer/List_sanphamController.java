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
	//l???y session th??ng qua request
	
	HttpSession session = request.getSession();
	
	//l???y th??ng tin gi??? h??ng
	Cart cart=null;
	
	//ki???m tra trong session c?? ?????i t?????ng n??o t??n cart kh??ng
	
	if(session.getAttribute("cart")!=null) //n???u c??
	{    //l???y ?????i t?????ng ???? ra v?? add l???i th??nh ki???u (Cart)
		cart=(Cart) session.getAttribute("cart");
	}
	else
	{ 
		//n???u kh??ng : kh???i t???o ?????i t?????ng m???i v?? set Cart
		cart=new Cart();
		session.setAttribute("cart",cart);
	}
	
	//l???y danh s??ch s???n ph???m c?? trong gi??? h??ng
	List<CartItem> cartItems= cart.getCartItems();
	
	//ki???m tra trong gi??? h??ng c?? sp ???? ch??a
	boolean isExits=false;
	for (CartItem item : cartItems) {
		if(item.getProductId()==cartItem.getProductId())
		{
			isExits=true;
			item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());//s??? lg s???n ph???m = slg c???a chi ti???t sp + slg c?? trong sesion
		}
	}
	//n???u sp ch??a c?? trong cartItem
	if(!isExits)
	{
		Product productInDb= productService.getById(cartItem.getProductId());
		cartItem.setProductName(productInDb.getTitle());
		cartItem.setPriceUnit(productInDb.getPrice());
		cartItem.setAvatar(productInDb.getAvatar());
		cartItem.setStatus(productInDb.getStatus());
		cart.getCartItems().add(cartItem);
		
		
		
	}
	// t??nh t???ng ti???n
			this.calculateTotalPrice(request);
			
			// tr??? v??? k???t qu???
			Map<String, Object> jsonResult = new HashMap<String, Object>();
			jsonResult.put("code", 200);
			jsonResult.put("status", "TC");
			jsonResult.put("totalItems", getTotalItems(request));

			session.setAttribute("totalItems", getTotalItems(request));
			return ResponseEntity.ok(jsonResult);
		}
private int getTotalItems(final HttpServletRequest request) {
	HttpSession httpSession = request.getSession();
     //ki???m tra cart trong gi??? h??ng
	if (httpSession.getAttribute("cart") == null) {
		return 0;
	}
     //c??
	Cart cart = (Cart) httpSession.getAttribute("cart");
	//l???y list cartitem
	List<CartItem> cartItems = cart.getCartItems();

	int total = 0;
	
	for (CartItem item : cartItems) {
		total += item.getQuanlity();
	}

	return total;
}

private void calculateTotalPrice(final HttpServletRequest request) {

	// ????? l???y session s??? d???ng th??ng qua request
	// session t????ng t??? nh?? ki???u Map v?? ???????c l??u tr??n main memory.
	HttpSession session = request.getSession();

	// L???y th??ng tin gi??? h??ng.
	Cart cart = null;
	if (session.getAttribute("cart") != null) {
		cart = (Cart) session.getAttribute("cart");
	} else {
		cart = new Cart();
		session.setAttribute("cart", cart);
	}

	// L???y danh s??ch s???n ph???m c?? trong gi??? h??ng
	List<CartItem> cartItems = cart.getCartItems();
	BigDecimal total = BigDecimal.ZERO;
	
	for(CartItem ci : cartItems) {
		total = total.add(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuanlity())));
	}

	cart.setTotalPrice(total);
}


}
