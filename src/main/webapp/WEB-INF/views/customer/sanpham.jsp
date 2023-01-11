<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="base" value="${pageContext.servletContext.contextPath}"></c:set>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Chi Tiết Sản Phẩm</title>
	<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>  


<div class="sanpham" style="margin-top: 50px">
	<div id="box">
		<img style="width: 400px; height: 300px ;border: 1px solid black;" src="${base}/upload/${product.avatar}"  id="img_main">
		<ul>
		
		<c:forEach items="${productImages}" var="productss">
		<c:if test="${productss.product.id == product.id }">
		
			<li><img   src="${base}/upload/${productss.path}" id="${productss.id }" onclick="change_img(${productss.id })" style="border: 1px solid black;" ></li>
			
			</c:if>
			</c:forEach>
			
			
		</ul>
	</div>
	<div class="box2" style="margin-left: 20px">
		<div class="tex1" style="margin-top: -38px; margin-bottom: 10px; font-size: 22px">${product.title }</div>
		<div class="text2">
<!-- 			<div class="t1"><br>SKU: 172681C <br> Chất liệu: Textile <br> Màu sắc: Pink</div> -->
			<div class="t2">
				<div class="t21">
					<h6>Drake Price:</h6>
					
					<c:if test="${product.priceSale !=nulll }">
					<h1>
					<fmt:setLocale value="vi_VN" scope="session"/>
					<fmt:formatNumber value="${product.priceSale} " type="currency"/>
					</h1></c:if>
					<c:if test="${product.priceSale ==nulll }">
					<h1>
					<fmt:setLocale value="vi_VN" scope="session"/>
					<fmt:formatNumber value="${product.price} " type="currency"/>
					</h1></c:if>
				</div>
				<div class="t22" style="margin-top: 10px">
				<h5>MIỄN PHÍ VẬN CHUYỂN TOÀN QUỐC VÀ TẶNG VỚ CHÍNH HÃNG KHI ĐẶT HÀNG ONLINE</h5>	

				</div>
			</div>
		</div>
		<div class="text3" style="margin-top: 10px; font-size: 15px; color: #D64573">${product.details }
		</div>
		<div class="chonsize" style="margin-top: 20px" >
		</div>
		<!-- dathang -->
		<div>
		<h6>Số lượng trong kho:${product.amount}</h6>
		
		</div>
		
		<div class="buttons_added">
  số lượng:
  <input id="valuequatily"
   class="input-qty" type="number" value="1" min="0" max="${product.amount }" >
 
</div>

	
	<div style="margin-top: 20px">
	 <a  href="${base }/cart" class="btn btn-danger" role="button" onclick="AdToCart( ${product.id});">Đặt Hàng</a>
     </div>
	</div>
	
</div>

<!-- sqlienquan -->
<div class="splienquan" style="margin-top: 150px">
<div style="width: 200px;font-family: Arial; font-weight: bold; font-size: 16px; margin: auto; margin-top: 20px;">Sản Phẩm Liên Quan</div>

<section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center"style="display:flex;">
                
	 <c:forEach items="${products }" var="products" begin="0" end="4">
                          <c:if test="${products.status != false }">
                          <div class="col mb-5" >
							<div class="card h-100" style="background: #CEEBEB ;width: 250px">
								<!-- Sale badge-->
								<c:if test="${products.priceSale ==null }">
								<div class="badge text-white position-absolute" style="top: 0.5rem; right: 0.5rem ;" >
								<img style="width: 35px; height: 40px" src="${base }/images/new.png">
								</div>
								</c:if>
								<c:if test="${products.priceSale !=null }">
								<div  class="badge text-white position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img style="width: 30px;height: 30px" src="${base }/images/ss.jpg">
								</div>
								</c:if>
								<!-- Product image-->
								<!-- <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />\ -->
								<img style="height: 200px" src="${base }/upload/${products.avatar}">
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<h5 class="fw-bolder">
											<a href="${base }/trangchu/converse/${products.seo}">${products.title }</a>
										</h5>
										<!-- Product reviews-->
										<div
											class="d-flex justify-content-center small text-warning mb-2">
											<div class="bi-star-fill"></div>
											<div class="bi-star-fill"></div>
											<div class="bi-star-fill"></div>
											<div class="bi-star-fill"></div>
											<div class="bi-star-fill"></div>
										</div>
										<c:if test="${products.priceSale ==null }">
										<fmt:setLocale value="vi_VN" scope="session"/>
										<fmt:formatNumber value="${products.price} " type="currency"/>
										</c:if>
										<c:if test="${products.priceSale !=null }">
										<!-- Product price-->
										<span class="text-muted text-decoration-line-through">
											<fmt:setLocale value="vi_VN" scope="session"/>
										<fmt:formatNumber value="${products.price} " type="currency"/>
										</span>
										<fmt:setLocale value="vi_VN" scope="session"/>
										<fmt:formatNumber value="${products.priceSale} " type="currency"/>
										</c:if>
									</div>
								</div>
								
								
								<!-- Product actions-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent" style="display: flex; margin: auto;">
									<div class="icon">
									    
										<a onclick="AddToCart('${base }', ${products.id}, 1);" >add to cart</a>
									</div>
									<div class="icon">
		                          <a href="${base }/trangchu/converse/${products.seo}" >Đặt Hàng</a>
	                            </div>
								</div>
							</div>
						</div>
						</c:if>
			</c:forEach>
						  </div>
            </div>
        </section>
						
	<!-- /list -->
<jsp:include page="/WEB-INF/views/customer/layout/dangki.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/menuend.jsp"></jsp:include>
<!-- /menuend -->
<!-- dongcuoi -->

<!-- /dongcuoi -->
</div>
<!-- /splienquan -->
<jsp:include page="/WEB-INF/views/administrator/layout/jsAdmin.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/jsAddtoCart.jsp"></jsp:include>
<script type="text/javascript">


function change_img(img_id){
	
	var id= parseInt(img_id);
	id2= id -1;
	id3=id -2;
	id4=id -3;
	id5=id-4;
	id6= id +1;
	id7=id +2;
	id8=id +3;
	id9=id+4;
	var src=document.getElementById(img_id).getAttribute('src');
	document.getElementById("img_main").setAttribute("src",src);
	//reset
 //    document.getElementById(id).removeAttribute("style");
//      document.getElementById(id).setAttribute("style","border:1px solid black;");
   	document.getElementById(id2).setAttribute("style","border:1px solid black;");
	
   	document.getElementById(id6).setAttribute("style","border:1px solid black;");
  // 	document.getElementById(id7).setAttribute("style","border:1px solid black;");
//   	document.getElementById(id8).setAttribute("style","border:1px solid black;");

	//xac lap duong vien
	document.getElementById(id).setAttribute("style","border:1px solid red;");
}
</script>
<script type="text/javascript">
function AdToCart(productId) {
	
	var val=document.getElementById("valuequatily").value;
	let data={
			
			productId: productId, // Id sản phẩm
			quanlity: val,
	};
	
		jQuery.ajax({
			url: '${base}'+ "/ajax/addToCart", //->action
			type: "post",
			contentType: "application/json",
			data: JSON.stringify(data),

			dataType: "json", // kieu du lieu tra ve tu controller la json
			success: function(jsonResult) {
				// tăng số lượng sản phẩm trong giỏ hàng trong icon
				
				$("#iconShowTotalItemsInCart").html(jsonResult.totalItems);
				
				$([document.documentElement, document.body]).animate({
				    scrollTop: $("#iconShowTotalItemsInCart").offset().top
				}, 2000);
			},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}
</script>

</body>
</html>