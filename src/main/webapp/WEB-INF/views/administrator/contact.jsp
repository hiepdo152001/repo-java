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
<title>Contact</title>

<!-- COMMON -->
<jsp:include page="/WEB-INF/views/comon/variables.jsp"></jsp:include>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.icon" />

<!-- CSS -->
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
</head>
<body>

<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
<div class="wrapper" style="margin-left: 500px; margin-top: 50px" >

<sf:form modelAttribute="contacts" action="${base}/trangchu/contact" id="form-login" method="post" >
<h1 class="form-heading">Contact</h1>
   
            <div class="form-group">
               
                <sf:input path="name" type="text" name="name" class="form-input" placeholder=" Name"></sf:input>
            </div>
            <div class="form-group">
                
                <sf:input path="email" type="email" name="email" class="form-input" placeholder=" email"></sf:input>
                
            </div>
            <div class="form-group">
               
                <sf:input path="message" type="text" name="message" class="form-input" placeholder=" message"></sf:input>
            </div>
            <input type="submit" value="Submit" class="form-submit">
</sf:form>
</div>
<style>
body{
    background: url('../images/bg.jpeg');
    background-size: cover;
    background-position-y: -80px;
    font-size: 16px;
}
#wrapper{
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}
#form-login{
    max-width: 400px;
    background: rgba(0, 0, 0 , 0.8);
    flex-grow: 1;
    padding: 30px 30px 40px;
    box-shadow: 0px 0px 17px 2px rgba(255, 255, 255, 0.8);
}
.form-heading{
    font-size: 25px;
    color: #f5f5f5;
    text-align: center;
    margin-bottom: 30px;
}
.form-group{
    border-bottom: 1px solid #fff;
    margin-top: 15px;
    margin-bottom: 20px;
    display: flex;
}
.form-group i{
    color: #fff;
    font-size: 14px;
    padding-top: 5px;
    padding-right: 10px;
}
.form-input{
    background: transparent;
    border: 0;
    outline: 0;
    color: #f5f5f5;
    flex-grow: 1;
}
.form-input::placeholder{
    color: #f5f5f5;
}
#eye i{
    padding-right: 0;
    cursor: pointer;
}
.form-submit{
    background: transparent;
    border: 1px solid #f5f5f5;
    color: #fff;
    width: 100%;
    text-transform: uppercase;
    padding: 6px 10px;
    transition: 0.25s ease-in-out;
    margin-top: 30px;
}
.form-submit:hover{
    border: 1px solid #54a0ff;
}
</style>

<!-- </style> -->
</body>
</html>