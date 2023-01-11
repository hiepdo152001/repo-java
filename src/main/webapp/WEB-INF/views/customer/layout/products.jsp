<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- converse -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class=" col mb-5 "   >
							<div class="card h-100" id="sanpham" style="width: 300px">
								<!-- Sale badge-->
								<c:if test="${products.priceSale ==null }">
								<div class="badge text-white position-absolute" style="top: 0.5rem; right: 0.5rem ;" >
								<img style="width: 35px; height: 40px" src="images/new.png">
								</div>
								</c:if>
								<c:if test="${products.priceSale !=null }">
								<div  class="badge text-white position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img style="width: 30px;height: 30px" src="images/ss.jpg">
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
										<div style="margin-top: 25px">
										<fmt:setLocale value="vi_VN" scope="session"/>
										<fmt:formatNumber value="${products.price} " type="currency" />
										</div >
										</c:if>
										<c:if test="${products.priceSale !=null }">
										<!-- Product price-->
										<div style="margin-top: 25px">
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
									<div class="icon">
									    
										<a onclick="AddToCart('${base }', ${products.id}, 1);" >add to cart</a>
									</div>
									<div class="icon">
		                          <a href="${base }/trangchu/converse/${products.seo}" >Đặt Hàng</a>
	                            </div>
								</div>
								
							</div>
						</div>