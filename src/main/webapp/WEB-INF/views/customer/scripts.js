/*!
* Start Bootstrap - Shop Homepage v5.0.2 (https://startbootstrap.com/template/shop-homepage)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-shop-homepage/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project

function saveContact(baseUrl) {
	// tạo javascript object.  
	var data = {
		fullName: jQuery("#idFullName").val(), // lay theo id
		email: jQuery("#idEmail").val(), // lay theo id
		message: jQuery("#idMessage").val(), // lay theo id
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/contact", //->request mapping
		type: "post",					//-> method type của Request Mapping	
		contentType: "application/json",//-> nội dung gửi lên dạng json
		data: JSON.stringify(data),

		dataType: "json", // kiểu dữ liệu trả về từ Controller
		success: function(jsonResult) {
			alert(jsonResult.message);
		},
		error: function(jqXhr, textStatus, errorMessage) {
			alert("error");
		}
	});
}

// Thêm sản phẩm vào trong giỏ hàng
function AddToCart(baseUrl, productId, quanlity) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // Id sản phẩm
		quanlity: quanlity, // Số lượng cho vào giỏ hàng
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			
			$("#iconShowTotalItemsInCart").html(jsonResult.totalItems);
			
			/*$([document.documentElement, document.body]).animate({
			    scrollTop: $("#iconShowTotalItemsInCart").offset().top
			}, 2000);*/
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}

// Cập nhật số lượng sản phẩm trong giỏ hàng
function UpdateQuanlityCart(baseUrl, productId, quanlity) {
	
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id	
		quanlity: quanlity
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/updateQuanlityCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			$( "#quanlity_" + productId ).html(jsonResult.currentProductQuality);
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}
