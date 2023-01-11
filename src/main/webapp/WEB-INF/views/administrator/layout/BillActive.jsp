<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="base" value="${pageContext.servletContext.contextPath}"></c:set>
    
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Admin</title>
<jsp:include page="/WEB-INF/views/comon/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/administrator/layout/cssAdmin.jsp"></jsp:include>
    
</head>

<body>
<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- page container area start -->
    <div class="page-container">
<jsp:include page="/WEB-INF/views/administrator/menuAdmin.jsp"></jsp:include>
        <!-- main content area start -->
        <div class="main-content" >
            <!-- header area start -->
            <div class="header-area">
                <div class="row align-items-center">
                    <!-- nav and search button -->
                    <div class="col-md-6 col-sm-8 clearfix">
                        <div class="nav-btn pull-left">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                        <div class="search-box pull-left">
                            <form action="#">
                                <input type="text" name="search" placeholder="Search..." required>
                                <i class="ti-search"></i>
                            </form>
                        </div>
                        
                    </div>
                    <!-- profile info & task notification -->
                    <div class="col-md-6 col-sm-4 clearfix">
                        
                    </div>
                </div>
            </div>
            <!-- header area end -->
            <!-- page title area start -->
            <div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <h4 class="page-title pull-left">Hàng hóa</h4>
                            
                            <ul class="breadcrumbs pull-left">
                                <li><a href="http://localhost:8080/trangchu">Trang chủ</a></li>
                                <li><span>Bill</span></li>
                            </ul>
                            
                        </div>
                        
                    </div>
                    <div class="col-sm-6 clearfix">
                        
                    </div>
                </div>
            </div>
            <!-- page title area end -->
        <!-- page title area end -->
            <div class="main-content-inner">
                <div class="row">
                    <div class="col-lg-12 col-ml-12">
                        <div class="row">
                            <div class="col-12 mt-5">
                                <div class="card">
                                  <div class="card-body">
                                        <h4 class="header-title">Bill</h4>
                                       <div class="row">
        <div class="col-md-12">
            <table  class="table">
                <tr>
                     <th>Tên</th>
                     <th>Địa Chỉ</th>
                    <th>Số Điện Thoại</th>
                    <th>Email</th>
                    <th>sản Phẩm</th>
                    <th>Số Lượng</th> 
                    <th>đơn Giá</th>            
                    <th>status</th>
                    
                    
                </tr>
                <c:forEach items="${saleOder}" var="bill" >
                <c:if test="${bill.status == true}">
                <c:if test="${bill.trang_thai ==null}">
              <tr>
                    <td>${bill.customerName}</td>
                    <td>${bill.customerAddress}</td>
                    <td>${bill.customerPhone}</td>
                    <td>${bill.customerEmail}</td>
                    
                    <c:forEach items="${saleOderProduct }" var="product">
                    <c:if test="${product.saleOrder.id == bill.id }">
                    <td><img src="${base}/upload/${product.product.avatar}" width="50" height="50"></td>
                    
                    <td>${product.quality}</td>
                    <td>
                    <fmt:setLocale value="vi_VN" scope="session"/>
					<fmt:formatNumber value="${product.product.price} " type="currency"/>
                   </td>
                    
                    
                    <c:if test="${bill.trang_thai  ==null }">
                    <td>Đang giao hàng</td>
                    </c:if>
                   
                    <c:if test="${bill.trang_thai !=null }">
                    <td>Đã giao hàng</td>
                    </c:if>                 
                    <td>
                    <a class="btn btn-primary" onclick="EditSaleOder(${product.saleOrder.id})">Hoà tất Giao Hàng</a>
                    </td>
                    </c:if>                
                    </c:forEach>
                     
                    </tr>
                    </c:if>
                    </c:if>
                    </c:forEach>
                </table>
                </div>
                </div>
                
                
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          </div>      
        <!-- main content area end -->
        <!-- footer area start-->
        
        <!-- footer area end-->
    </div>
    
    
    <script type="text/javascript">
    function EditSaleOder(productId){
    	var data={
    			id:productId,
    			
    	};
    	jQuery.ajax({
    		
    		url:'${base}' + "/editBill",
    		type:"post",
    		contentType:"application/json",
    		data: JSON.stringify(data),
    		dataType:"json",//kieu du lieu tra ve tu Controller
    		success: function(jsonResult) {
    			
    		alert(jsonResult.message),
    		window.location.reload();
    		},
    		error: function(jqXhr, textStatus,errorMessage) {
    			alert("lỗi");
    			
    		}
    	});
    	
    }
    
    function DeleteBill(productId){
    	
    	var data={
    			id:productId,
    			
    	};
    	jQuery.ajax({
    		
    		url:'${base}' + "/DeleteBill",
    		type:"post",
    		contentType:"application/json",
    		data: JSON.stringify(data),
    		dataType:"json",//kieu du lieu tra ve tu Controller
    		success: function(jsonResult) {
    			
    		alert(jsonResult.message),
    		window.location.reload();
    		},
    		error: function(jqXhr, textStatus,errorMessage) {
    			alert("lỗi");
    			
    		}
    	});
    	
    }
	</script>
    <!-- page container area end -->
      <jsp:include page="/WEB-INF/views/administrator/layout/jsAdmin.jsp"></jsp:include>
</body>

</html>
