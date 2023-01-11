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
                            <h4 class="page-title pull-left">User</h4>
                            
                            <ul class="breadcrumbs pull-left">
                                <li><a href="http://localhost:8080/trangchu">Trang chủ</a></li>
                                <li><span>ListUser</span></li>
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
                                        <h4 class="header-title">User</h4>
                                        <a href="${base }/registration">List tài khoản</a>
                                       
      <div class="row">
        <div class="col-md-12">
            <table  class="table" style="background: #B5E5EB">
                <tr >
                   <th>#</th>
                   <th>username</th>
                   <th>name </th>
                   <th>email</th>  
                   <th>adress</th> 
                   <th>phone</th>
                   <th>roles</th>
                   <th>status</th>
                </tr>
            <c:forEach items="${user}" var="users" >
              <tr>
                    <td>${users.id}</td>
                    <td>${users.username }</td>
                    <td>${users.name}</td>
                    <td>${users.email}</td>
                   <td>${users.adress }</td>
                   <td>${users.phone }</td>
                    <c:forEach items="${users.roles}" var="user_role">
                    <td>${user_role.name}</td>
                    
                    </c:forEach>
                    
                    
                   <td>
											<span >
												<c:choose>
													<c:when test="${users.status == true }">
														<input type="checkbox" checked="checked" readonly="readonly">
													</c:when>
													<c:otherwise>
														<input type="checkbox" readonly="readonly">
													</c:otherwise>
												</c:choose>
											</span>
										</td>
                    
                    <td>
                        <button class="btn btn-primary" onclick="AddAdmin(${users.id})" role="button">Done ADMIN</button>
                        <button class="btn btn-primary" onclick="AddGuest(${users.id})" role="button">Done GUEST</button>
						<button class="btn btn-danger" role="button" onclick="DeleteUser(${users.id})" >Delete</button>
                        
                    </td>
                </tr>
                  

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
        <footer>
            <div class="footer-area">
                <p>© Copyright 2022. All right reserved. Template by <a href="">HP</a>.</p>
            </div>
        </footer>
        <!-- footer area end-->
    </div>
    <!-- page container area end -->
      <jsp:include page="/WEB-INF/views/administrator/layout/jsAdmin.jsp"></jsp:include>
      <style>
      th{border-right: 1px solid white;}
      td{border-right: 1px solid white;}
</style>
</body>

<script type="text/javascript">
function DeleteUser(user_id){
	
	var data={
			id:user_id,
			
	};
	jQuery.ajax({
		
		url:'${base}' + "/admin/deleteUser",
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
function AddAdmin(userId) {

	var data={
			id:userId,
	};
	jQuery.ajax({
		url:'${base}'+ "/admin/changeAdmin",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		dataType:"json",
		success:function(jsonResult){
			alert(jsonResult.success),
			window.location.reload();
		},
		error:function(jqXhr, textStatus,errorMessage)
		{
			alert("lỗi");
		}
	});
	
}
function AddGuest(userId) {

	var data={
			id:userId,
	};
	jQuery.ajax({
		url:'${base}'+ "/admin/changeGUEST",
		type:"post",
		contentType:"application/json",
		data:JSON.stringify(data),
		dataType:"json",
		success:function(jsonResult){
			alert(jsonResult.success),
			window.location.reload();
		},
		error:function(jqXhr, textStatus,errorMessage)
		{
			alert("lỗi");
		}
	});
	
}
$(document).ready(function() {
	  $('#summernote').summernote();
	});
</script>
</html>
