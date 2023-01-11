<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
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
                                <li><span>Liên Hệ</span></li>
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
                                  
                                  
          <form class="form-inline" action="${base }/trangchu/List_contact" method="get">
                                <div class="d-flex flex-row">
    <!-- <input type="hidden" id="page" name="page" class="form-control"> -->
    <!-- search -->
    <input type="hidden" id="page" name="page" class="form-control">
           
            <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search" value="${searchModelContact.keyword }" style="margin-right: 15px;">
      <button type="submit" id="btnSearch" name="btnSearch" value="Search"  class="btn btn-primary" style="margin-right: 25px;">Seach</button>
       </div>
    
     

<!-- list -->
    
 
    <div class="row">
        <div class="col-md-12">
            <table  class="table">
                <tr>
                     <th>#</th>
                    <th>name</th>
                     <th>email</th>
                    <th>message</th>
                    
                </tr>
            <c:forEach items="${search_contact.data}" var="list_Ct" >
              <tr>
                    <td>${list_Ct.id}</td>
                    <td>${list_Ct.name}</td>
                    <td>${list_Ct.email}</td>
                    <td>${list_Ct.message}</td>
                    
                  
				   <td>
						<button class="btn btn-danger" role="button" onclick="/trangchu/List_contact/{keyword}">Delete</button>
                        
                    </td>
                </tr>
                  

                     </c:forEach>
               </table>     
                </div>    
               </div>
               
                               
                                  </form>
                                  <!-- Paging -->
						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<div id="paging"></div>
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
        
    </div>
    <div id="paging"></div>
    <footer>
            <div class="footer-area">
                <p>© Copyright 2022. All right reserved. Template by <a href="">HP</a>.</p>
            </div>
        </footer>
        <!-- footer area end-->
    <!-- page container area end -->
    <jsp:include page="/WEB-INF/views/administrator/layout/jsAdmin.jsp"></jsp:include>
    <script type="text/javascript" >
    function deleteproduct(productId) {
    	
	}

    $( document ).ready(function() {
		$("#Id").val(${searchModel.Id});
		
		$("#paging").pagination({
			currentPage: ${search_contact.currentPage},
	        items: ${search_contact.totalItems},
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
