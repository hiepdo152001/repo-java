<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <c:set var="base" value="${pageContext.servletContext.contextPath}"></c:set>
<!-- menu1 -->
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
<div class="header" style="width: 1300px; height: 30px; margin: auto ;margin-top: 30px; margin-bottom: 30px;" >
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
                
                    <form class="form-inline" id="keyword" action="/trangchu" method="get">
                   
                    <div class="d-flex flex-row">
                     <input type="hidden" id="page" name="page" class="form-control">
            <input id="keyword" name="keyword" class="form-control" placeholder="Search" value="${searchModel.keyword }" style="margin-right: 15px;">
            <button type="submit" id="btnSearch" name="btnSearch" value="Search"  class="btn btn-primary" style="margin-right: 25px;">Seach</button>
               </div> </form>
                <li>
			   
                <li>
                <c:if test="${isLogined }">
	
					<a style="font-size: 16px;margin-top: 0px" href="${base}/history">lịch sử mua hàng</a>
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

			</style>


