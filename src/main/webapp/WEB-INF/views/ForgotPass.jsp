<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="base" value="${pageContext.servletContext.contextPath}"></c:set>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Lấy lại mật khẩu</title>
	<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>  
	<div style="width:500px;margin: auto;border: 1px solid black;">
	<div style="width: 200px; margin: auto">
	<form action="${base }/forgotPassWord" method="post">
	
	
	<fieldset>
	<legend>Lấy lại mật khẩu</legend>
	<p>Username:</p>
	<input type="text" id="username" name="username" placeholder="Username ">
	<p>Email:</p>
	<input type="text" id="email" name="email" placeholder="Email đăng ký ">
	
	<c:if test="${not empty message }">
	<h5 class="alertSignup">${message }</h5>
	</c:if>
	<button type="submit">xác nhận</button>
	</fieldset>
	</form>
	</div>
	</div>
</body>
