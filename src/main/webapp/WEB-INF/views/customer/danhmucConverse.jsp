<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>converse</title>
	<jsp:include page="/WEB-INF/views/comon/variables.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</head>
<body>
<div class="menu1">
		<ul>
			<li class="text">
				<a href="#">HotLine:</a>
				<a id="mau" href="#">1800.0080</a>
			</li>
			<li>
				<img src="${base }/images/khoa.png">
				<a id="mau" href="${base }/registration">Đăng kí
				
				</a>
			</li>
			<li>
				<img src="${base }/images/nguoi.webp">
				<a id="mau" href="${base }/login">Đăng Nhập
				</a>
			</li>
			<li>
				<img src="${base }/images/nguoi.webp">
				<a id="mau" href="${base }/logout">Đăng Xuất
				</a>
			</li>
			<li>
				<img src="${base }/images/nguoi.webp">
				<a id="mau" href="${base }/trangchu/contact"> Liên hệ Với Chúng tôi
				</a>
			</li>
		</ul>
	</div>
	<!-- menu1 -->
	<!-- menu2 -->
	<div class="menu2">
		<div class="drake">
			<img src="${base }/images/drak.jpg">
		</div>
		<div class="tienich">
	<c:if test="${isLogined }">
	
					<a href="${base}/profileUser/${userLogined.id}">${userLogined.username}</a>
					</c:if>
					
					
					
		<div class="giohang">
			<a href="${base }/cart"><img  src="${base }/images/giohanng.jpg" style="width: 35px; height: 35px"></a>
		
					<span style="position: absolute;margin-left: -5px" id="iconShowTotalItemsInCart" class="badge bg-dark text-white ms-1 rounded-pill">
					
					<c:if test="${totalItems == null}">0</c:if>
					<c:if test="${totalItems > 0}">${totalItems}</c:if>
				
					</span>

				
		</div>
		</div>
	</div>
	
	
	<!-- hieuung -->
	<div class="quangcao" style="margin-top: -20px">
		<marquee direction="right">Miễn Phí Vận Chuyển Toàn Quốc</marquee>
		<div class="box"><a href=""></a></div>
	</div>
	<!-- menu3 -->
<div class="header" style="width: 1300px; height: 30px; margin: auto ;margin-top: 30px; margin-bottom: 80px;" >
	<nav style="height: 60px; width: 1300px">
			
			 <ul  >
			     <li>
					<a href="${base }/trangchu">Trang chủ</a>
					
			     </li>
			<c:forEach items="${ categories}" var="categorys">
			<c:if test="${categorys.status ==true }">
			     <li>
					<a href="${base }/${categorys.name}">${categorys.name}</a>
					
			     </li>
			     </c:if>
			     
			     </c:forEach>
                <li>
                
                    <form class="form-inline" id="keyword" action="/Giỏ Hoa Quả" method="get">
                   
                    <div class="d-flex flex-row">
                     <input type="hidden" id="page" name="page" class="form-control">
            <input id="keyword" name="keyword" class="form-control" placeholder="Search" value="${searchModel.keyword }" style="margin-right: 15px;">
            <button type="submit" id="btnSearch" name="btnSearch" value="Search"  class="btn btn-primary" style="margin-right: 25px;">Seach</button>
               </div> </form>
                <li>
			   
                <li>
                <c:if test="${isLogined }">
	
					<a style="font-size: 16px" href="${base}/history">lịch sử mua hàng</a>
					</c:if>
                </li>
			</ul>
			
			
			</nav>
			</div>
			<style>
    .header	nav{width: 507px; background: #E08F48; margin: auto;} 
 	.header	nav ul{ 
 			padding: 0px; margin: 0px; 
 			list-style: none; 
		line-height: 30px; 

		} 
	.header	nav ul li{ 
			display: inline; 
			display: inline-block; 
		} 
	.header	nav ul li a{padding: 15px; 
			color:#E1EBD5; 
			text-decoration: none; 
			display: inline-block;
			} 
	.header	nav ul li a:hover{background:#7D3D05;color: red}
			 
/* 			a:hover{background:#7D3D05;color: red}  */
			</style>
<!-- 	</style> -->
		
		
<!-- 		<style type="text/css"> -->

                
           
<jsp:include page="/WEB-INF/views/customer/layout/anhcv.jsp"></jsp:include> 
<section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
	 <c:forEach items="${converse.data }" var="products">
                          
                          <c:if test="${products.amount > 0}">
                          <div class=" col mb-5 "   >
							<div class="card h-100" id="sanpham" style="width: 300px">
								<!-- Sale badge-->
								<c:if test="${products.priceSale ==null }">
								<div class="badge text-white position-absolute" style="top: 0.5rem; right: 0.5rem ;" >
								<img style="width: 35px; height: 40px ;" src="images/new.png">
								</div>
								</c:if>
								<c:if test="${products.priceSale !=null }">
								<div  class="badge text-white position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img style="width: 30px;height: 30px ; " src="images/ss.jpg">
								</div>
								</c:if>
								<!-- Product image-->
								<!-- <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />\ -->
						
								
								<img  style="position: relative;width: 200px; height: 200px;margin: auto;" src="${base }/upload/${products.avatar}">
								
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<a style="font-size: 18px" href="${base }/trangchu/converse/${products.seo}">${products.title }</a>
											
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
										<div style="margin-top: 25px; color: red; font-size: 20px">
										<fmt:setLocale value="vi_VN" scope="session"/>
										<fmt:formatNumber value="${products.price} " type="currency" />
										</div >
										</c:if>
										<c:if test="${products.priceSale !=null }">
										<!-- Product price-->
										<div style="margin-top: 25px;color: red; font-size: 20px">
										<span class="text-muted text-decoration-line-through" >
										<fmt:setLocale value="vi_VN" scope="session"/>
										<fmt:formatNumber value="${products.price} " type="currency"/>
										</span>
										<fmt:setLocale value="vi_VN" scope="session"/>
										<fmt:formatNumber value="${products.priceSale} " type="currency"/>
										</div>
										</c:if>
									</div>
								</div>
								
								<!-- Product actions-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent" style="display: flex; margin: auto;">
									<div class="icon" style="background: #CC1417">
									    
										<a onclick="AddToCart('${base }', ${products.id}, 1);" >add to cart</a>
									</div>
									<div class="icon" style="background: #5CDBDB">
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
			<div class="row" style="width: 300px; margin: auto;">
							
				<div id="paging"></div>
							
						</div> 
						
	<!-- /list -->
	<!-- page -->
	 <jsp:include page="/WEB-INF/views/administrator/layout/jsAdmin.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/jsAddtoCart.jsp"></jsp:include>
	<script type="text/javascript">
					 
				$( document ).ready(function() {
					$("#keyword").val("categoryId");
					$("#paging").pagination({
						currentPage: ${converse.currentPage},
				        items: ${converse.totalItems},
				        itemsOnPage: 8,
				        cssStyle: 'light-theme',
				        onPageClick: function(pageNumber, event) {
				        	
				        	// lưu ý phải có thẻ <input type="hidden" id="page" name="page" class="form-control">
				        	//lấy giá trị page = giá trị khi click page chíng bằng pageNumber
				        	$('#page').val(pageNumber);
				        	//bắt sự kiện click ở nút search trên chỗ thanh tìm kiếm 
				        	
				        	$("#btnSearch").trigger('click');
						},
				    });
		
	});		
	<!-- /page -->
</script>
<!-- /converse -->
<jsp:include page="/WEB-INF/views/customer/layout/gioithieuDrake.jsp"></jsp:include> 
<jsp:include page="/WEB-INF/views/customer/layout/dangki.jsp"></jsp:include> 
<jsp:include page="/WEB-INF/views/customer/layout/menuend.jsp"></jsp:include> 

</body>
</html>
