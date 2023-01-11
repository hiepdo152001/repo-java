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
                                <li><span>Thêm mặt hàng</span></li>
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
                                        <h4 class="header-title">Thêm sản phẩm</h4>
                                        
                                       <sf:form modelAttribute="product" action="${base}/admin"  method="post" enctype="multipart/form-data" >
                                       <sf:hidden path="id"/>
                                            <div class="input-group mb-3">
                                                <div class="custom-file">
                                                 <label  for="avatar">Avatar</label>
                                                    <img src="" id="image" width="70px">
                                                    <input path="avatar" type="file" name="productAvatar" id="avatar" onchange="chooseFile(this)" ></input>
                                                </div>
                                            </div>
                                             <div class="input-group mb-3">
                                                <div class="custom-file">
                                                 <label  for="avatar">Pictures</label>
                                                    <input  path="pictures" type="file" name="productPictures" id="pictures" class="form-control" multiple="multiple"></input>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Danh mục</label>
                                                <sf:select path="categories.id" class="form-control" id="category">
									            <sf:options items="${categories }" itemValue="id" itemLabel="name" />
								                </sf:select>
                                               
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Tên sản phẩm</label>
                                                <sf:input path="title" type="text" class="form-control" name="title" id="title" aria-describedby="emailHelp" placeholder="VD: vans OLD"></sf:input>
                                            </div>
                                          
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Giá sản phẩm</label>
                                                <sf:input path="price" type="number" class="form-control" name="price" id="price" placeholder="VD: 1000 vnđ"></sf:input>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Giá Sale</label>
                                                <sf:input path="priceSale" type="number" class="form-control" name="priceSale" id="priceSale" placeholder="VD: 1000 vnđ"></sf:input>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">số lượng trong kho</label>
                                                <sf:input path="amount" type="number" class="form-control" name="amount" id="amount" placeholder=""></sf:input>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Mô tả sản phẩm</label>
                                                <sf:input path="details" type="text" class="form-control" name="details" id="details" ></sf:input>
                                                <textarea id="summernote" name="editordata"></textarea>
                                             
                                                
                                            </div>
                                            <div class="form-group">
                                            <sf:checkbox path="isHot"  class="form-check-input" id="isHot" ></sf:checkbox>
                                                <label class="form- check -lable" for="isHot">is Hot ?</label>
                                                
                                            </div>
                                            
                                            <button type="submit"  class="btn btn-primary mt-4 pr-4 pl-4">Thêm</button>
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

<script type="text/javascript">
$(document).ready(function() {
	  $('#summernote').summernote();
	});
</script>
</html>
