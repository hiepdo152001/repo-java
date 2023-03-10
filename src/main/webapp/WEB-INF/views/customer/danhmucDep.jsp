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
	<title>Dép</title>
	<jsp:include page="/WEB-INF/views/comon/variables.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>  
<!-- menu4 -->
<div class="menu4" style="width: 800px;margin: auto;margin-top: 50px">
	<img style="width: 800px; height: 400px;" src="${base }/images/sale2.png">
</div>
<!-- /menu4 -->
<!-- menu5 -->
<div class="menu5">
	<a href="#">Dép</a>
</div>
<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include> 
<section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
	 <c:forEach items="${dep.data}" var="products">
                          
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
						</c:forEach>
						</div>
						</div>
        </section>
        <div style="width: 200px; margin: auto;">
			<div id="paging"></div>
			</div>
			<style>
 #sanpham:hover{
 margin:5px;
 position: relative;
  box-shadow: 0 4px 8px 0 black, 0 6px 20px 0 black;
  text-align: center;}
</style>				
						
	<!-- /list -->
	<!-- page -->
	
	<script type="text/javascript">
					 
				$( document ).ready(function() {
		$("#categoryId").val(${searchModel.categoryId});
		
		$("#paging").pagination({
			currentPage: ${dep.currentPage},
	        items: ${dep.totalItems},
	        itemsOnPage: 8,
	        cssStyle: 'light-theme',
	        onPageClick: function(pageNumber, event) {
	        	$('#page').val(pageNumber);
	        	$('#btnSearch').trigger('click');
			},
	    });
		
	});		
	<!-- /page -->
</script>
<!-- /converse -->
<jsp:include page="/WEB-INF/views/customer/jsAddtoCart.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/gioithieuDrake.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/dangki.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/menuend.jsp"></jsp:include>
</body>
</html>
