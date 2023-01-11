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
	<div style="width:500px;margin: auto;margin-top:50px;border: 1px solid black;background: #EBDCB7">
	<div style="width: 200px; margin: auto;">
	<form action="${base }/changePassWord" method="post">
	
	
	<fieldset>
	<legend>Đổi mật khẩu</legend>
	<span>User Name :</span>
	<input type="text" id="Username" name="Username" placeholder="User name ">
	<p></p>
	<span>Mật Khẩu Cũ :</span>
	<input type="password" id="PassWord" name="PassWord" placeholder="Mật Khẩu cũ ">
	<p></p>
	<span>Mật Khẩu Mới :</span>
	<input type="password" id="password" name="password" placeholder="Mật Khẩu mới ">
	
	<p></p>
	<c:if test="${not empty message}">
	<h5 class="alertSigup">${message }</h5>
	</c:if>
	<button type="submit" class="button">xác nhận</button>
	</fieldset>
	</form>
	</div>
	</div>
</body>