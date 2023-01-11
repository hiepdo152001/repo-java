<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
                                <li><span>category</span></li>
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
                                        <h4 class="header-title">CateGory</h4>
                                        
                                       <sf:form modelAttribute="category" action="${base}/admin/category"  method="post" enctype="multipart/form-data" >
                                       <sf:hidden path="id"/>
                                            
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Tên </label>
                                                <sf:input path="name" type="text" class="form-control" name="name" id="name" aria-describedby="emailHelp" placeholder="VD: vans OLD"></sf:input>
                                            </div>
                                          
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Mô tả sản phẩm</label>
                                                <sf:input path="description" type="text" class="form-control" name="details" id="details" ></sf:input>
                                            </div>
                                            
                                            
                                            <button type="submit"  class="btn btn-primary mt-4 pr-4 pl-4" >Thêm</button>
                                            <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4" style="background-color: ">Hủy</button>
                                        </sf:form>
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
        <footer>
            <div class="footer-area">
                <p>© Copyright 2022. All right reserved. Template by <a href="">HP</a>.</p>
            </div>
        </footer>
        <!-- footer area end-->
    </div>
    <!-- page container area end -->
      <jsp:include page="/WEB-INF/views/administrator/layout/jsAdmin.jsp"></jsp:include>
</body>

</html>
