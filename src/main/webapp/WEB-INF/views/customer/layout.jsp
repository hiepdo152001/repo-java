<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Trang Chủ</title>
	<jsp:include page="/WEB-INF/views/comon/variables.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
	
</head>
<body>
<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>  
<jsp:include page="/WEB-INF/views/customer/layout/bieutuong.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/sp_trangchu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/jsAddtoCart.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/gioithieuDrake.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/dangki.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/menuend.jsp"></jsp:include>


</body>

</html>
