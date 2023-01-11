<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>login</title>

<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/comon/variables.jsp"></jsp:include>


</head>
<body>
<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
<div id="wrapper" style="background: #95E6E6">
        <form action="${base }/perform_login" id="form-login" method="POST">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <h1 class="form-heading">Login</h1>
            
            
            <div class="form-group">
               
                <input type="text" name="username" class="form-input" placeholder="user Name">
            </div>
            <div class="form-group">
                
                <input type="password" name="password" class="form-input" placeholder=" pass">
                
            </div>
            <div style="color: white;">
               
                <input type="checkbox" name="remember-me" >&nbsp;remember me
            </div>
            <input type="submit" value="Đăng nhập" class="form-submit">
            <c:if test="${not empty param.login_error}">
						<div class="alert alert-danger" role="alert">
							tài khoản hoặc mật khẩu không chính xác!
						</div>
					</c:if>
					<div class="" style=" width:4-0px; margin:  auto;margin-top: 20px ; display: flex;">
                       <div class="icon" style=" width:120px; margin:  auto;margin-top: 20px ;">
                       <a href="${base}/changePassWord" style="color: white;">Đổi Mật Khẩu</a>
                        </div>
                     <div class="icon" style=" width:120px; margin:  auto;margin-top: 20px ; ">
                       <a href="${base}/forgotPassWord" style="color: white; ">Quên Mật Khẩu</a>
                        </div>
                        </div>
        </form>
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
<script type="text/javascript">
$(document).ready(function(){
    $('#eye').click(function(){
        $(this).toggleClass('open');
        $(this).children('i').toggleClass('fa-eye-slash fa-eye');
        if($(this).hasClass('open')){
            $(this).prev().attr('type', 'text');
        }else{
            $(this).prev().attr('type', 'password');
        }
    });
});
</script>
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</body>
</html>