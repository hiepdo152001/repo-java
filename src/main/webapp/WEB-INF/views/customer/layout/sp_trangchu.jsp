<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- converse -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<section class="py-5" style="margin-top: -10px">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">               
                  <input type="hidden" id="page" name="page" class="form-control">
	 <c:forEach items="${sanpham.data }" var="products">
	 <c:if test="${products.amount > 0 }">
<!--                           <input type="hidden" id="page" name="page" class="form-control"> -->
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
        <div class="row" style="width: 500px; margin: auto;margin-bottom: 20px">
      <div id="paging" >
            </div>
</div>
  
<jsp:include page="/WEB-INF/views/administrator/layout/jsAdmin.jsp"></jsp:include>
 <jsp:include page="/WEB-INF/views/customer/jsAddtoCart.jsp"></jsp:include>
       
<script type="text/javascript">
  $(document).ready(function() {
	 
	 	$("#categoryId").val(${searchModel.category});
		$("#paging").pagination({
			
			currentPage: ${sanpham.currentPage},
	        items: ${sanpham.totalItems},
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
</script>
		

<!-- /converse -->

