<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=10">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Happy Recipe K</title>
<style>
.button{
	margin-top:5px;
	color:#ffffff;
	background-color:#e4e4e4;	
    cursor: pointer;	
    text-decoration: none;
	width: 300px;
	height: 50px;
	text-align: center;
	line-height: 40px;
	font-size: 10pt;font-weight: bold;
	-webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    border: 1px solid #000000;
}
.submit{
	border: 1px solid #000000;
	margin-top:5px;
	color:#ffffff;
	background-color:#424242;	
    cursor: pointer;	
    text-decoration: none;
	width: 300px;
	height: 50px;
	text-align: center;
	line-height: 40px;
	font-size: 10pt;font-weight: bold;
	-webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}
#buynow:hover{
	background: #ffffff;
	color: #424242;
}
.member-box{
	border-radius: 10px 10px 10px 10px;
}
input:hover{
	border: 1px solid #000000;
}
</style>
</head>
<!-- ----------------------------------------- -->
<body>
	<jsp:include page="../menu/top.jsp" flush='false' />
	<section class="body-sec">
	<div class="container">
		<div class="row">
			<div class="col-md-12" style="width: 100%;height:auto; padding: 15% 0 15% 35%">
				<div class="col-md-4 member-box" style="width: 400px; height: 400px;
		border: 1px solid #e4e4e4;text-align: center;padding: 20px 20px 20px 20px;float: left;">
			<h4><label>MEMBER LOGIN</label></h4>
			<form action="./signin" method="post">
				<div class="form-group" style="margin-top: 40px; padding: 0 30px 0 30px;">
				<input type="email" name="id" class="form-control" placeholder="ID">
				<input type="password" name="password" class="form-control" placeholder="PASSWORD" style="margin-top: 10px;">
				</div>
				<div class="form-group" style="margin-top: 20px; padding: 0 30px 0 30px">
				 <div class="row">
				 	<input class="submit" id="buynow" value="LOGIN" type="submit">
				 </div>
				 <div class="row" style="height: 40px;text-align: left;padding: 10px 10px 0px 0px;width:300px;margin-left:0px;
				 border-bottom: 1px solid #e4e4e4">아이디찾기 / 비밀번호찾기</div>
				 <div class="row" style="margin-top: 10px;">
				 	<input class="button" id="buynow" value="MAIN" onclick="location.href='http://localhost:9090/'">
				 </div>				 
				 </div>
			</form>
		</div>
			</div>
		</div>
	</div>
	</section>		
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>
