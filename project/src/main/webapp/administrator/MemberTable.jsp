<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<!-- calendar start -->
<script type="text/javascript"
	src="https://yui-s.yahooapis.com/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript"
	src="https://yui-s.yahooapis.com/2.9.0/build/calendar/calendar-min.js"></script>
<!-- calendar end -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/admin_member.js"></script>
<script type="text/javascript" src="../js/jquery.number.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/JavaScript">
	window.onload = function() {
		$.ajaxSetup({dataType:"text"}); 
	};
	$(document).ready(function(){
		var mnoIndex=$("input[id='listmno']");
		var result = '${msg}';
		if (result == 'SUCCESS') {
		  alert("요청이 정상적으로 처리되었습니다.");
		}		
		$("#membersubmit").on("click",function(){
			if(check()==true){
				$("#frm").submit();
			}	
		});
		
		$("#AddItem").on("click",function(){
			$("form[id='frm']")[0].reset();
			$("#frm").attr("action","./Member/Create")
			CKEDITOR.instances.content.setData();
		});
		
		$("select[id='mlevel']").on("change",function(){
			var index=$("select[id='mlevel']").index(this);
			var mlevel=this.value;
			var mno=mnoIndex[index].value;		
			$.ajax({
				type:'put',
				url:'/administrator/Member/Level/Update/'+mno,
				headers :{
					"Content-type":"application/json",
					"X-HTTP-Method-Override":"PUT"
				},
				data : JSON.stringify({mlevel:mlevel}),
				dataType:'text',
				success:function(result){
					console.log("result: "+result);
					if(result== 'SUCCESS'){
						alert(mno+" 회원의 등급을 "+mlevel+"로 변경완료 하였습니다.");
					}
				}
			});
		});
		
		$("select[id='mdrop']").on("change",function(){
			var index=$("select[id='mdrop']").index(this);
			var mdrop=this.value;
			var mno=mnoIndex[index].value;		
			$.ajax({
				type:'put',
				url:'/administrator/Member/Drop/Update/'+mno,
				headers :{
					"Content-type":"application/json",
					"X-HTTP-Method-Override":"PUT"
				},
				data : JSON.stringify({mdrop:mdrop}),
				dataType:'text',
				success:function(result){
					console.log("result: "+result);
					if(result== 'SUCCESS'){
						alert(mno+" 회원의 탈퇴여부를 "+mdrop+"로 변경완료 하였습니다.");
					}
				}
			});
		});
		
		$("select[id='confirm']").on("change",function(){
			var index=$("select[id='confirm']").index(this);
			var confirm=this.value;
			var mno=mnoIndex[index].value;		
			$.ajax({
				type:'put',
				url:'/administrator/Member/Confirm/Update/'+mno,
				headers :{
					"Content-type":"application/json",
					"X-HTTP-Method-Override":"PUT"
				},
				data : JSON.stringify({confirm:confirm}),
				dataType:'text',
				success:function(result){
					console.log("result: "+result);
					if(result== 'SUCCESS'){
						alert(mno+" 회원의 인증 여부를 "+confirm+"로 변경완료 하였습니다.");
					}
				}
			});
		});
	});
</script>
<style type="text/css">
.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s
}

.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
/*Panel tabs*/
.panel-tabs {
	position: relative;
	bottom: 30px;
	clear: both;
	border-bottom: 1px solid transparent;
}

.panel-tabs>li {
	float: left;
	margin-bottom: -1px;
}

.panel-tabs>li>a {
	margin-right: 2px;
	margin-top: 4px;
	line-height: .85;
	border: 1px solid transparent;
	border-radius: 4px 4px 0 0;
	color: #E0E0E0;
}

.panel-tabs>li>a:hover {
	border-color: transparent;
	color: #ffffff;
	background-color: transparent;
}

.panel-tabs>li.active>a, .panel-tabs>li.active>a:hover, .panel-tabs>li.active>a:focus
	{
	color: #fff;
	cursor: default;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
	background-color: rgba(255, 255, 255, .23);
	border-bottom-color: transparent;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Happy Recipe K</title>
</head>
<body>
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  		<a href="http://happyrecipek.iptime.org:9090">HOME</a>
  		<a href="http://happyrecipek.iptime.org:9090/administrator/CookBox?page=1&perPageNum=12">Cooking Class</a>
  		<a href="http://happyrecipek.iptime.org:9090/administrator/ShopBox?page=1&perPageNum=12">Shop</a>
  		<a href="http://happyrecipek.iptime.org:9090/administrator/ThingBox?page=1&perPageNum=12">Thing</a>
  		<a href="http://happyrecipek.iptime.org:9090/administrator/EventBox?page=1&perPageNum=12">Event</a>
  		<a href="http://happyrecipek.iptime.org:9090/administrator/NoticeTable?page=1&perPageNum=12">Notice</a>
  		<a href="http://happyrecipek.iptime.org:9090/administrator/MemberTable?page=1&perPageNum=12">Member</a>
	</div>
	<section class="body-sec">
		<div class="container">
			<div class="row">
				<div class="col-md-12" style="margin: 0 0 0 0; padding: 0 0 0 0">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">Administrator Page</h3>
							<h3><span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span></h3>
						</div>
						<div class="panel-body">
							<div class="tab-content">
								<div class="container" style="width: 100%;">
									<div class="row">
										<div class="col-md-12">
											<ul class="nav nav-tabs" style="float: left;">
												<li class="active">
													<a href="http://happyrecipek.iptime.org:9090/administrator/MemberTable?page=1&perPageNum=12"> 
														<span class="glyphicon glyphicon-list"></span>
													</a>
												</li>
											</ul>											
										</div>
									</div>
									<div class="row">
										<div class="tab-content">
											<div id="memberboxlist" class="tab-pane fade in active">
												<table class="table table-striped" id="memberTlist">
													<thead>
														<tr>
															<th>No.</th>
															<th>Name</th>
															<th>Id</th>
															<th>Nick</th>
															<th>RegDate</th>
															<th>Confirm</th>
															<th>Level</th>															
															<th>Drop Out</th>
															<th>Point</th>
															<th>Modify</th>
															<th>Delete</th>															
															</tr>
													</thead>
													<tbody>
														<c:forEach items="${member }" var="tlist">
														<tr>
															<td>${tlist.mno }<input type="hidden" value=${tlist.mno } id="listmno"></td>
															<td>${tlist.name}</td>
															<td>${tlist.id}</td>
															<th>${tlist.nickname }</th>
															<td>${tlist.regdate }</td>
															<td>
																<select name="confirm" class="form-control" id="confirm">
																	<option value='N' 
																	<c:out value="${tlist.confirm eq 'N'.charAt(0)?'selected=selected':'' }"/>>
																	N</option>																	
																	<option value='Y'
																	<c:out value="${tlist.confirm eq 'Y'.charAt(0)?'selected=selected':'' }"/>>
																	Y</option>
																</select>
															</td>
															<td>
																<select name="mlevel" class="form-control" id="mlevel">
																	<option value='N' 
																	<c:out value="${tlist.mlevel eq 'N'.charAt(0)?'selected=selected':'' }"/>>
																	Normal</option>
																	<option value='C' 
																	<c:out value="${tlist.mlevel eq 'C'.charAt(0)?'selected=selected':'' }"/>>
																	Center</option>
																	<option value='M'
																	<c:out value="${tlist.mlevel eq 'M'.charAt(0)?'selected=selected':'' }"/>>
																	Master</option>
																</select>
															</td>															
															<td>
																<select name="mdrop" class="form-control" id="mdrop">
																	<option value='Y' 
																	<c:out value="${tlist.mdrop eq 'Y'.charAt(0)?'selected=selected':'' }"/>>
																	Y</option>
																	<option value='N'
																	<c:out value="${tlist.mdrop eq 'N'.charAt(0)?'selected=selected':'' }"/>>
																	N</option>
																</select>
															</td>
															<td>${tlist.point }</td>
															<td>
																<input type="button" value="M" class="btn btn-default"
																		onclick="getAjax(${tlist.mno})" data-toggle="modal" data-target="#memberadd">
															</td>
															<td>
																<input type="button" value="D" class="btn btn-default"
																		onclick="deleteItem(${tlist.mno},${pageMaker.cri.page },${pageMaker.cri.perPageNum })">
															</td>
														</tr>
														</c:forEach>														
													</tbody>
													<tfoot>
														<tr>
															<td colspan="17">
																<div class="text-center">
																<ul class="pagination">
																	<c:if test="${pageMaker.prev }">
																		<li>
																			<a href="MemberTable?page=${pageMaker.startPage-1 }">&laquo;</a>
																		</li>
																	</c:if>
																	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
																		<li
																			<c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
																			<a href="MemberTable?page=${idx }">${idx }</a>
																		</li>
																	</c:forEach>
																	<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
																		<li>
																			<a href="MemberTable?page=${pageMaker.startPage+1 }">&raquo;</a>
																		</li>
																	</c:if>
																</ul>
															</div>
															</td>
														</tr>
													</tfoot>
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
	</section>
</body>
</html>