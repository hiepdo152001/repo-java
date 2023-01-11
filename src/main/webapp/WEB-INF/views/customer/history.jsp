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
<title>History</title>

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
<%--  	<c:if test="${totalItems == 0}"> --%>
<!-- 	<div class="wrapper" style="width: 1000px;height:500px; margin: auto;margin-top:200px" >  -->
<!-- 	<div style="; margin: auto;margin-left: 100px">  -->
<!-- 	<h2 ">Không có sản phẩm nào trong giỏ hàng</h2>  -->
<%-- 	<a style="margin-left: 250px"  class="btn btn-danger" href="${base }/trangchu">Mua Thêm  --%>
<!-- 	</a> -->
<!-- 	</div>  -->
<!-- 	</div>  -->
<%-- 	</c:if>  --%>
<%--  	<c:if test="${totalItems > 0}"> --%>
<div style="width: 500px; margin:  auto;margin-top: 80px;margin-bottom: -50px">
<h1>LICH SỬ MUA HÀNG</h1>
</div>
<form class="form-inline" action="${base }/history" method="get">
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
						<c:forEach items="${saleOder}" var="saleoder">
						<c:forEach items="${product}" var="ci">
						<c:if test="${ userLogined.id==saleoder.user.id}">
						<c:forEach items="${saleOderProduct }" var="saleoderproduct">
						
						<c:if test="${ci.id==saleoderproduct.product.id }">
						<c:if test="${saleoder.id==saleoderproduct.saleOrder.id }">
						<c:if test="${ saleoderproduct.status==true}">
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
													${ci.title }
												</a>
											</h5>
											
										</div>
								</th>
							
								
								<td class="border-0 align-middle">
								
									<fmt:setLocale value="vi_VN" scope="session"/>
										<fmt:formatNumber value="${ci.price}" type="currency"/>
								</td>
								<td class="border-0 align-middle">
								<c:if test="${ci.id >1}">
									<button onclick="UpdateQuanlityCart('${base }', ${ci.id}, -1)" value="-" >-</button>
									</c:if>
									<c:if test="${ci.id <=1}">
									<button role="button" onclick="DeleteProduct( ${ci.id} )" value="-" >-</button>
									</c:if>
									<strong><span id="quanlity_${ci.id}">${saleoderproduct.quality }</span></strong>
									
									<button onclick="UpdateQuanlityCart('${base }', ${ci.id}, 1)" value="+">+</button>
								</td>
								<td class="border-0 align-middle">
								<button class="btn btn-danger"  onclick="DeleteSaleOderProduct(${saleoderproduct.id} )">Delete</button>
								<button class="btn btn-danger" style="background: #5CDBDB"  onclick="AddToCart('${base }', ${ci.id},1 )">Thêm vào giỏ hàng</button>
							</tr>
							</c:if>
							</c:if>
							</c:if>
						</c:forEach>
						</c:if>
						</c:forEach>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- End -->
          </div>
	</section>
	</form>
<%-- 	</c:if>  --%>
<jsp:include page="/WEB-INF/views/customer/jsAddtoCart.jsp"></jsp:include>
	<script type="text/javascript">
	function DeleteSaleOderProduct(productId){
		
    	var data={
    			id:productId,
    			
    	};
    	jQuery.ajax({
    		url:'${base}'+ "/deleteSaleOderProduct",
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
