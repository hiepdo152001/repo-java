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
<title>Profile</title>

<!-- COMMON -->
<jsp:include page="/WEB-INF/views/comon/variables.jsp"></jsp:include>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.icon" />

<!-- CSS -->
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
</head>
<body>

<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
<div class="wrapper" style="width:500px;margin: auto;border: 1px solid black;background:#F5F3DC; margin-top: 50px " >

<sf:form modelAttribute="user" action="${base}/profileUser" id="form-login" method="post"  enctype="multipart/form-data">
<sf:hidden path="id"/>
                     <div class="input-group mb-3">
                         <div class="custom-file" style="margin-top: 20px">
                         
                         <img src="${base}/upload/${ user.avatar}" id="image" width="70px" height="70px" style="margin-left: 200px">
                             <input  type="file" name="userAvatar" id="userAvatar" onchange="chooseFile(this)" style="margin-left: 200px;margin-top: 20px"></input>
                                 </div>
                                            </div>

							<div class="form-group">
								<label for="customerPhone">Name</label>
								<sf:input path="name" type="tel" class="form-control" id="name" name="name" value="${ userLogined.name}" placeholder="Full name"></sf:input>
							</div>
							<div class="form-group">
								<label for="customerAddress">Address</label>
								<sf:input path="adress" type="text" class="form-control" id="customerAddress" name="customerAddress" value="${ userLogined.adress}" placeholder="Address"></sf:input>
							</div>
							<div class="form-group">
								<label for="customerEmail">Email adress</label>
								<sf:input path="email" type="email" class="form-control" id="customerEmail" name="customerEmail" value="${userLogined.email }" placeholder="Enter email"></sf:input>
								<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="customerPhone">Phone</label>
								<sf:input path="phone" type="tel" class="form-control" id="customerPhone" name="customerPhone" value="${userLogined.phone }" placeholder="Phone"></sf:input>
							</div>
							
						
						
						<button type="submit"  class="btn btn-dark rounded-pill py-2 btn-block" style="margin-left:220px;margin-top: 20px;">Save</button>
</sf:form>
</div>

 <jsp:include page="/WEB-INF/views/administrator/layout/jsAdmin.jsp"></jsp:include>
<!-- </style> -->
</body>
</html>