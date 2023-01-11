<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<c:set var="base" value="${pageContext.servletContext.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>registration</title>

<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>

<body>
<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
        <main>
            <div id="wrapper" class="container">
                <div class="register-form">
                    <sf:form modelAttribute="user"  action="${base }/registration" method="post">
                        <h1>Đăng ký </h1>
                        <div class="input-box">

                            <sf:input path="username" type="text" id="username" name="username" placeholder="Nhập username"></sf:input>
                        </div>
                        <c:if test="${not empty userFalse}">
		            <h5 class="alertSignup">${userFalse}</h5>
                        </c:if>   
                        <div class="input-box">

                            <sf:input path="password"  name="password" id="pass1" type="password" placeholder="Nhập mật khẩu"></sf:input>
                        </div>
                        <div class="input-box">

                            <sf:input path="email"  name="email" type="email" placeholder="email"></sf:input>
                        </div>
                       <c:if test="${not empty emailFalse}">
		                   <h5 class="alertSignup">${emailFalse}</h5>
                        </c:if>
                        <div class="input-box">
                        <sf:input path="adress" name="adress" type="adress" placeholder="adress"/>
                        </div>
                        <div class="input-box">
                        <sf:input path="phone" name="phone" type="number" placeholder="phone number"/>
                        </div>
                        <div class="btn-box" style=" width:70px; margin:  auto;">
                        
                        
                        <input type="submit"  value="Đăng ký" > 
                    </div>
                        
                    </sf:form>
                </div>
            </div>
            </main>

 <style> 
        {
    padding: 0px;
    margin: 0px;
    font-family: sans-serif;
    box-sizing: border-box;
}
.container{
    width: 100%;
    max-width: 1200px;
    margin-left: auto;
    margin-right: auto;
}
.col-6{
    float: left;
    width: 50%;
}
.margin_b{
    margin-bottom: 7.5px;
}
.clear{
    clear: both;
}
header{
    background-color: #cccccc;
    min-height: 70px;
    padding: 15px;
}
main{
    background-color: #dddddd;
    min-height: 300px;
    padding: 7.5px 15px;
}
footer{
    background-color: #cccccc;
    min-height: 70px;
    padding: 15px;
}
h1{
    color: #009999;
    font-size: 20px;
    margin-bottom: 30px;
}

.register-form{
    width: 100%;
    max-width: 400px;
    margin: 20px auto;
    background-color: #ffffff;
    padding: 15px;
    border: 2px dotted #cccccc;
    border-radius: 10px;
}

.input-box{
    margin-bottom: 10px;
}
.input-box input[type='text'],
.input-box input[type='password'],
.input-box input[type='date']{
    padding: 7.5px 15px;
    width: 100%;
    border: 1px solid #cccccc;
    outline: none;
    font-size: 16px;
    display: inline-block;
    height: 40px;
    color: #666666;
}
.input-box select{
    padding: 7.5px 15px;
    width: 100%;
    border: 1px solid #cccccc;
    outline: none;
    font-size: 16px;
    display: inline-block;
    height: 40px;
    color: #666666;
}
.input-box option{
    font-size: 16px;
}
.input-box input[type='checkbox']{
    height: 1.5em;
    width: 1.5em;
    vertical-align: middle;
    line-height: 2em;
}
.input-box textarea{
    padding: 7.5px 15px;
    width: 100%;
    border: 1px solid #cccccc;
    outline: none;
    font-size: 16px;
    min-height: 120px;
    color: #666666;
}
.btn-box{
    text-align: right;
    margin-top: 30px;
}
        </style>
</body>

</head>