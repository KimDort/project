<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- calendar start -->
<script type="text/javascript"
	src="https://yui-s.yahooapis.com/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript"
	src="https://yui-s.yahooapis.com/2.9.0/build/calendar/calendar-min.js"></script>
<!-- calendar end -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
<script type="text/javascript" src="../js/jquery.number.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<script>
var result = '${msg}';
if (result == 'SUCCESS') {
  alert("처리가 정상적으로 완료되었습니다.");
}if(result=='CONFIRM'){
  alert("귀하의 메일로 인증코드가 발송되었습니다.");
}if(result=='CONFIRM_ERROR'){
  alert("인증이 실패하였습니다.");
}if(result=="FAILED"){
  alert('아이디 또는 암호가 틀렸습니다.');
}if(result=="SEND"){
  alert("이메일 인증을 받지 않으셨습니다. 귀하의 이메일에 인증코드를 발송하였습니다.");
}if(result=='noadmin'){
	alert("접근 권한이 없습니다.");
}
$(document).ready(function(){
	var fromObj=$("#joinFrm");
	var topHeight=$("#topnav").height();	
	$(".body-sec").css("margin-top",topHeight+10);
	
	$(window).resize(function(){
		var topHeight=$("#topnav").height();
		$(".body-sec").css("margin-top",topHeight+10);	
	});
	$("#signup").on("click",function(){
		if($("#email1").val().length<4){
			alert("아이디를 4자 이상 입력해 주십시오.");
		}else if($("#pwd1").val().length < 6){
			alert("암호를 6자 이상 입력해 주십시오.");
		}else if($("#pwd2").val().length < 6){
			alert("확인 암호를 6자 이상 입력해 주십시오.");
		}else if($("#pwd1").val() != $("#pwd2").val()){
			alert("암호와 확인 암호가 틀립니다.");
		}else if($("#name").val().length == 0 ){
			alert("이름을 입력해 주십시오.");
		}else if($("#nickname").val().length==0){
			alert("닉네임을 입력해 주십시오.");
		}else if(($("#phone2").val().length==0 || $("#phone2").val().length <4) || 
				($("#phone3").val().length==0 || $("#phone3").val().length <4)){
			alert("전화번호를 입력해 주십시오.");
		}else{
			
			fromObj.submit();
		}
	});	
});
</script>

<!-- 로그인 창 모달 띄우기 -->
<div id="loginModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Login</h4>
      </div>
      <div class="modal-body">
         <form method="post" action="/member/signin">
    <div class="form-group">
      <label for="email">ID(Email):</label>
      <input type="email" class="form-control" id="email" name="id" placeholder="Enter email">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="password" placeholder="Enter password">
    </div>
    <div class="checkbox">
      <label><input type="checkbox"> Remember me</label>
    </div>
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    <button type="submit" class="btn btn-default">Login</button>
  </form>
      </div>
    </div>
  </div>
</div>
<!-- 로그인 창 모달 끝 -->
<!-- 회원가입 창 모달 띄우기 -->
<div id="signupModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Sign Up</h4>
      </div>
      <div class="modal-body">
    <form method="post" action="/member/create"  enctype="multipart/form-data" id="joinFrm">
    <div class="form-group">
      <label for="email" style="display: block;">ID(Email):</label>
      <div class="col-sm-9" style="margin: 0 0 0 0; padding: 0 0 0 0;">
      <input type="text" class="form-control" id="email1" name="email1" placeholder="Enter email" style="width: 80%;display: inline;">
      <span class="glyphicon glyphicon-ok form-control-feedback"></span>
      <span class="glyphicon glyphicon-remove form-control-feedback"></span>
      </div>
      <input type="button" class="form-control" id="checkId" value="Check" style="display: inline;width: 25%">
      <label for="email">Email Service:</label>
      <select name="email2" class="form-control" id="email2">
      <option value="gmail.com">gmail.com</option>
      <option value="hanmail.net">hanmail.net</option>
      <option value="hotmail.com">hotmail.com</option>
      <option value="yahoo.com">yahoo.com</option>
      <option value="naver.com">naver.com</option>
      </select>
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd1" name="password" placeholder="Enter password">
      <label for="pwd">Password Confirm:</label>
      <input type="password" class="form-control" id="pwd2" name="password1" placeholder="Enter password Confirm">
    </div>
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name">
    </div>
    <div class="form-group">
      <label for="nickname">Nick Name:</label>
      <input type="text" class="form-control" id="nickname" name="nickname" placeholder="Enter NickName">
    </div>
    <div class="form-group" >
      <label for="phone" style="display: block;">Phone:</label>
      <select name="phone1" class="form-control" style="width: 20%;display: inline;" id="phone1">
      <option value="010">010</option>
      <option value="011">011</option>
      <option value="012">012</option>
      <option value="013">013</option>
      <option value="014">014</option>
      <option value="017">017</option>
      <option value="018">018</option>
      <option value="019">019</option>
      <option value="090">019</option>
      </select>
      <input type="text" class="form-control" id="phone2" name="phone2" 
      placeholder="Enter First Number" style="width: 40%; display: inline;" maxlength="4">
      <input type="text" class="form-control" id="phone3" name="phone3" 
      placeholder="Enter Last Number" style="width: 37%; display: inline;" maxlength="4">
    </div>
    <div class="form-group" >
    <label for="photo" style="display: block;">Profile Photo:</label>
    <input type="file" name="file1MF" class="form-control">
    </div>
    <div class="form-group">
    	<label for="addressSearch" style="display: block;">Search Address</label>
    	<input type="text" class="form-control" id="SearchAddress" name="eupmyeon" 
    	placeholder="예)서울특별시 서대문구 대현동  / (대현동) 입력" style="width: 80%; display: inline;">
    	<input type="button" class="btn btn-default" value="Search" id="BtSearchAddress" style="display: inline; width: 19%;">
    	<label for="addressList">Address List</label>
    	<select class="form-control" id="addressist"></select>
      <label for="address">Zipcode:</label>
      <input type="text" class="form-control" id="zipcode" name="zipcode" maxlength="5" readonly="readonly">
      <label for="address">Address:</label>
      <input type="text" class="form-control" id="address1" name="address1" readonly="readonly">
      <label for="address">Address:</label>
      <input type="text" class="form-control" id="address2" name="address2" placeholder="Enter Detail Address">
    </div>
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    <button type="button" class="btn btn-default" id="signup">Sign Up</button>
  </form>
      </div>
    </div>
  </div>
</div>
<!-- 회원가입 창 모달 끝 -->
<header>
<nav class="navbar navbar-default navbar-fixed-top" id="topnav">
  <div class="container" >
    <div class="navbar-header " >
      <a class="navbar-brand" href="http://happyrecipek.iptime.org:9090">Happy Recipe K</a>
    </div>
    
    <ul class="nav navbar-nav" style="width: 55%; overflow: hidden; height: 44px">
      <li><a href="http://happyrecipek.iptime.org:9090/notice/list">Notice</a></li>
      <li><a href="http://happyrecipek.iptime.org:9090">Event</a></li>
      <li><a href="http://happyrecipek.iptime.org:9090">Cook</a></li>
      <li><a href="http://happyrecipek.iptime.org:9090">Shop</a></li>
      <li><a href="http://happyrecipek.iptime.org:9090/administrator/CookBox?page=1&perPageNum=12">Administrator</a></li>
    </ul>
    <c:set var="userid" value="${sessionScope.MemberVO.id}" />
    <c:set var="usernick" value="${sessionScope.MemberVO.nickname }" />
    <c:if test="${empty userid}">
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#signupModal"data-toggle="modal" data-target="#signupModal"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#loginModal" data-toggle="modal" data-target="#loginModal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
    </c:if>
    <c:if test="${!empty userid}">
     <ul class="nav navbar-nav navbar-right">
     <li style="margin-top: 5px"><img src='/photo_upload/member/<c:out value="${userphoto }"/>' style="float: left" class="img-circle"></li>
      <li>
      <a href="/member/userinfo" class="nav-link">
       <c:out value="${userid}" />(<c:out value="${usernick }"  />)</a></li>
      <li><a href="/member/logout" class="nav-link"><span class="glyphicon glyphicon-log-in"></span> logout</a></li>
    </ul>
    </c:if>    
  </div>
</nav>
</header>