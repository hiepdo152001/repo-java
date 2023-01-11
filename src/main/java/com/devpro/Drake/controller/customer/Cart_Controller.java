package com.devpro.Drake.controller.customer;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.lang.Math;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.Drake.controller.BaseController;
import com.devpro.Drake.dto.Cart;
import com.devpro.Drake.dto.CartItem;
import com.devpro.Drake.entities.Product;
import com.devpro.Drake.entities.SaleOrder;
import com.devpro.Drake.entities.SaleOrderProducts;
import com.devpro.Drake.entities.User;
import com.devpro.Drake.service.ProductService;
import com.devpro.Drake.service.SaleOrderService;

@Controller
public class Cart_Controller extends BaseController {
	@Autowired
	private ProductService productService;
	@Autowired
	private SaleOrderService saleOrderService;
	@RequestMapping(value = "cart" , method = RequestMethod.GET)
	public String Cart(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)throws IOException{
	model.addAttribute("product",productService.findAll());
		
		return "customer/cart";
	}
	@RequestMapping(value = "ajax/addToCart" , method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_addToCart(
			final Model model,
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
			if(productInDb.getPriceSale()==null) {
			cartItem.setPriceUnit(productInDb.getPrice());
			}
			if(productInDb.getPriceSale()!=null)
			{
				cartItem.setPriceUnit(productInDb.getPriceSale());
			}
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
	@RequestMapping(value = { "/ajax/updateQuanlityCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_UpdateQuanlityCart(final Model model, 
																	   final HttpServletRequest request,
																	   final HttpServletResponse response, 
																	   final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		int currentProductQuality = 0;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				currentProductQuality = item.getQuanlity() + cartItem.getQuanlity();
				item.setQuanlity(currentProductQuality);				
			}
		}

		// tính tổng tiền
		this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("currentProductQuality", currentProductQuality);
        jsonResult.put("totalPrice",calculateTotalPrice(request));
		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.POST)
	public String cartFinish(final ModelMap model, 
							 final HttpServletRequest request, 
							 final HttpServletResponse response) throws Exception {

		// Thông tin khách hàng
		String customerFullName = request.getParameter("customerFullName");
		String customerAddress = request.getParameter("customerAddress");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");

		// tạo hóa đơn
		SaleOrder saleOrder = new SaleOrder();
		
//		 kiểm tra xem khách hàng có phải đã login hay chưa?
		if(super.isLogined()) {
			User userLogined = super.getUserLogined();
			saleOrder.setUser(userLogined); //khóa ngoại user_id
			saleOrder.setCustomerName(userLogined.getName());
			saleOrder.setCustomerAddress(userLogined.getAdress());
			saleOrder.setCustomerPhone(userLogined.getPhone());
			saleOrder.setCustomerEmail(userLogined.getEmail());
			
		} else {
			saleOrder.setCustomerName(customerFullName);
			saleOrder.setCustomerEmail(customerEmail);
			saleOrder.setCustomerAddress(customerAddress);
			saleOrder.setCustomerPhone(customerPhone);	
		}		

		// mã hóa đơn
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));

//		if(getUserLogined() != null) {
//			
//		}

		// kết các sản phẩm trong giỏ hàng cho hóa đơn
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		for (CartItem cartItem : cart.getCartItems()) {
			
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuanlity());
            
			// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
			saleOrder.addSaleOrderProducts(saleOrderProducts);
			
			Product product= productService.getById(cartItem.getProductId());
		    product.setAmount(product.getAmount() - cartItem.getQuanlity());
	        productService.saveOrUpdate(product);
		}
		saleOrderService.saveOrUpdate(saleOrder);

		// xóa dữ liệu giỏ hàng trong session
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", "0");

		return "redirect:/trangchu";
		
	}
	
	@RequestMapping(value = { "/ajax/cartdelete"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @RequestBody CartItem cartItem) throws IOException{
		
		HttpSession session =request.getSession();
		Cart cart=null;
		//kiểm tra trong session có đối tg nào là cart chưa
		if(session.getAttribute("cart") !=null){
			cart=(Cart) session.getAttribute("cart");
		}
		else {
			cart=new Cart();
			session.setAttribute("cart", cart);
		}
		int currentProductQuality = 0;
		List<CartItem> cartItems = cart.getCartItems();
		//kiểm tra trong giỏ hàng nếu có thì delete
		for (Iterator<CartItem> it = cartItems.iterator(); it.hasNext();) {
		    CartItem item = it.next();
			if(item.getProductId()==cartItem.getProductId())
			{
				it.remove();
			}
		}
		this.calculateTotalPrice(request);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("currentProductQuality", currentProductQuality);

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
			
private BigDecimal calculateTotalPrice(final HttpServletRequest request) {

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
				return total;
			}
  
}
