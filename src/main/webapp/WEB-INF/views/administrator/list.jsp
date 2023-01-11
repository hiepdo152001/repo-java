<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
    
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

   
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
        <div class="main-content-inner" >
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
                                <li><span>Danh sách sản Phẩm</span></li>
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
                                  <div class="container">
                                  
                                  
          <form class="form-inline" action="${base }/admin/product/list" method="get">
                                <div class="d-flex flex-row">
    <!-- <input type="hidden" id="page" name="page" class="form-control"> -->
    <!-- search -->
            <input type="hidden" id="page" name="page" class="form-control">
            <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search" value="${searchModel.keyword }" style="margin-right: 15px;">
            <select class="form-control" name="categoryId" id="categoryId" style="margin-right: 25px;">
            
              <option value="0">All</option>
             
             <c:forEach items="${categories}" var="category">
             <option value="${category.id }"  >${category.name}</option>
            </c:forEach>
         </select>
      <button type="submit" id="btnSearch" name="btnSearch" value="Search"  class="btn btn-primary" style="margin-right: 25px;">Seach</button>
       </div>
    <div>
       <a class="btn btn-outline-primary mb-1" href="${base}/admin/addproduct" role="button" >Add New</a>

<!-- list -->

 </div>
 
    <div class="row">
        <div class="col-md-12">
            <table  class="table" style="background: #B5E5EB">
                <tr>
                     <th>#</th>
                    <th>Title</th>
                     <th>Loại Sản Phẩm</th>
                    <th>Giá</th>
                    <th>Giá Sale</th>
                    <th>Số Lượng trong kho</th>
                    <th>Mô tả</th>
                    <th>Is hot</th>
                    <th>status</th>
                    <th>ảnh</th>
                </tr>
            <c:forEach items="${listPro.data}" var="product_list" >
              <tr>
                    <td>${product_list.id}</td>
                    <td>${product_list.title}</td>
                    <td>${product_list.categories.name}</td>
                    <td>${product_list.price}</td>
                    <td>${product_list.priceSale}</td>
                    <td>${product_list.amount }</td>
                    <td>${product_list.details}</td>
                    <td>${product_list.isHot}</td>
                   <td>
											<span id="_product_status_${product_list.id} }">
												<c:choose>
													<c:when test="${product_list.status }">
														<input type="checkbox" checked="checked" readonly="readonly">
													</c:when>
													<c:otherwise>
														<input type="checkbox" readonly="readonly">
													</c:otherwise>
												</c:choose>
											</span>
										</td>
                    <td>
				     <img src="${base}/upload/${product_list.avatar}" width="50" height="50">
					</td>
                    <td>
                        <a class="btn btn-primary" href="${base }/admin/addproduct/${product_list.id}" role="button">Edit</a>
						<button class="btn btn-danger" role="button" onclick="Deleteproduct(${product_list.id})" >Delete</button>
                        
                    </td>
                </tr>
                  

                     </c:forEach>
               </table>     
                </div>    
               </div>
               
                              
                                 
                                  </form>
                                 </div>
                                  <!-- Paging -->
						<div class="row">
							
								<div id="paging"></div>
							
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
        
    </div>
   
    <footer>
            <div class="footer-area">
                <p>© Copyright 2022. All right reserved. Template by <a href="">HP</a>.</p>
            </div>
        </footer>
        <style>
      th{border-right: 1px solid white;}
      td{border-right: 1px solid white;}
</style>
        <!-- footer area end-->
    <!-- page container area end -->
    <jsp:include page="/WEB-INF/views/administrator/layout/jsAdmin.jsp"></jsp:include>
    <script type="text/javascript">
    
function Deleteproduct(productId){
    	
    	var data={
    			id:productId,
    			
    	};
    	jQuery.ajax({
    		
    		url:'${base}' + "/admin/product/delete",
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
    

    $( document ).ready(function() { 		
    	$("#categoryId").val(${searchModel.categoryId});
		
		$("#paging").pagination({
			currentPage: ${listPro.currentPage},
	        items: ${listPro.totalItems},
	        itemsOnPage: 5,
	        cssStyle: 'light-theme',
	        onPageClick: function(pageNumber, event) {
	        $('#page').val(pageNumber);
        	$('#btnSearch').trigger('click');
			},
	    });
		
	});
    </script>
    
</body>

</html>
