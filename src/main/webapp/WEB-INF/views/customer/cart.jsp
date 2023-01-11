<!-- taglib JSTL -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="base" value="${pageContext.servletContext.contextPath}"></c:set>
<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Cart</title>

<!-- COMMON -->
<jsp:include page="/WEB-INF/views/comon/variables.jsp"></jsp:include>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- CSS -->
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>

</head>

<body>

	<!-- Navigation-->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<!-- Section-->
 	<c:if test="${totalItems == null}">
	<div class="wrapper" style="width: 1000px;height:500px; margin: auto;margin-top:200px" > 
	<div style="; margin: auto;margin-left: 100px"> 
	<h2 >Không có sản phẩm nào trong giỏ hàng</h2> 
	<a style="margin-left: 250px"  class="btn btn-danger" href="${base }/trangchu">Mua Thêm 
	</a>
	</div> 
	</div> 
	</c:if> 
 	<c:if test="${totalItems > 0}">
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">

			<!-- Shopping cart table -->
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
						   
							<th scope="col" class="border-0 bg-light">
								<div class="p-2 px-3 text-uppercase">Product</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Status</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Price</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Quantity</div>
							</th>
							
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Remove</div>
							</th>
						</tr>
					</thead>
					<tbody>
						
						<c:forEach items="${cart.cartItems }" var="ci">
						<c:if test="${ci.status != false}">
							<tr>
								<th scope="row" class="border-0">
									<div class="p-2">
										<img
											src="${base }/upload/${ci.avatar}"
											alt="" width="70" class="img-fluid rounded shadow-sm">
										
									</div>
									<div class="ml-3 d-inline-block align-middle">
											<h5 class="mb-0">
												<a href="#" class="text-dark d-inline-block align-middle">
													${ci.productName }
												</a>
											</h5>
											
										</div>
								</th>
								<td>
								<span id="_product_status_${ci.productId} }">
												<c:choose>
													<c:when test="${ci.status }">
														<input type="checkbox" checked="checked" readonly="readonly">
													</c:when>
													<c:otherwise>
														<input type="checkbox" readonly="readonly">
													</c:otherwise>
												</c:choose>
											</span>
								</td>
								
								<td class="border-0 align-middle">
								
									<fmt:setLocale value="vi_VN" scope="session"/>
										<fmt:formatNumber value="${ci.priceUnit}" type="currency"/>
								</td>
								<td class="border-0 align-middle">
								<c:forEach items="${product}" var="pro">
								
								<c:if test="${pro.id == ci.productId }">
								<c:if test="${ci.quanlity < pro.amount  }">
								
								
								<c:if test="${ci.quanlity >1}">
									<button onclick="UpdateQuanlityCart('${base }', ${ci.productId}, -1)" value="-" >-</button>
									</c:if>
									<c:if test="${ci.quanlity <=1}">
									<button role="button" onclick="DeleteProduct( ${ci.productId} )" value="-" >-</button>
									</c:if>
									<strong><span id="quanlity_${ci.productId}">${ci.quanlity }</span></strong>
									
									<button onclick="UpdateQuanlityCart('${base }', ${ci.productId}, 1)" value="+">+</button>
									</c:if>
									
									<c:if test="${ci.quanlity == pro.amount }">
									<button onclick="UpdateQuanlityCart('${base }', ${ci.productId}, -1)" value="-" >-</button>
									
									<strong><span id="quanlity_${ci.productId}">${ci.quanlity } </span></strong>
									</c:if>
									</c:if>
									</c:forEach>
								</td>
								<td class="border-0 align-middle">
								<button class="btn btn-danger"  onclick="DeleteProduct( ${ci.productId} )">Delete</button>
								
							</tr>
							</c:if>
							
						</c:forEach>
						
					</tbody>
				</table>
			</div>
			<!-- End -->
			<div style="width: 300px; margin: auto; display: flex;">
			<a style="margin-top: 20px">Tổng Tiền :</a>
			
			<h1 id="totalPrice">
			<fmt:setLocale value="vi_VN" scope="session"/>
			<fmt:formatNumber value="${cart.totalPrice }" type="currency" />
			<fmt:setLocale value="vi_VN" scope="session"/>
            </h1>
            </div>
           <form action="${base }/cart/checkout" method="post">
           
           <div class="p-4" style="width: 300px">
							<div class="form-group">
								<label for="customerPhone">Name</label>
								<input type="tel" class="form-control" id="customerFullName" name="customerFullName" value="${userLogined.name}" placeholder="Full name">
							</div>
							<div class="form-group">
								<label for="customerAddress">Address</label>
								<input type="text" class="form-control" id="customerAddress" name="customerAddress" value="${ userLogined.adress}" placeholder="Address">
							</div>
							<div class="form-group">
								<label for="customerEmail">Email adress</label>
								<input type="email" class="form-control" id="customerEmail" name="customerEmail" value="${userLogined.email }" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="customerPhone">Phone</label>
								<input type="tel" class="form-control" id="customerPhone" name="customerPhone" value="${userLogined.phone }" placeholder="Phone">
							</div>
							
						</div>
						
						<button type="submit"  class="btn btn-dark rounded-pill py-2 btn-block">Mua Hàng</button>
						</form>
            
			</div>
	</section>
<	</c:if> 
<jsp:include page="/WEB-INF/views/customer/jsAddtoCart.jsp"></jsp:include>
	<script type="text/javascript">
	function DeleteProduct(productId){
		
    	var data={
    			productId:productId,
    			
    	};
    	jQuery.ajax({
    		url:'${base}'+ "/ajax/cartdelete",
    		type:"post",
    		contentType:"application/json",
    		data: JSON.stringify(data),
    		
    		dataType:"json",//kieu du lieu tra ve tu Controller
    		success: function(jsonResult) {
    			window.location.reload();
    			$("#quanlity_" + productId).html(jsonResult.currentProductQuality);
    		},
    		error: function(jqXhr, textStatus,errorMessage) {
    			
    			
    		}
    	});
    	
    }
	</script>
		

	<!-- Footer-->
	<%-- <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include> --%>

	<!-- JS -->
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>

</body>
</html>
