 
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
<script type="text/javascript" src="../js/admin_shop.js"></script>
<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/jquery.number.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/JavaScript">
	window.onload = function() {
		
	};
	
	$(document).ready(function(){		
		var result = '${msg}';
		if (result == 'SUCCESS') {
		  alert("요청이 정상적으로 처리되었습니다.");
		}		
		$("#shopsubmit").on("click",function(){
			if(check()==true){
				$("#frm").submit();
			}	
		});
		$("#AddItem").on("click",function(){
			$("form[id='frm']")[0].reset();
			$("#frm").attr("action","./Shop/Create")
		});
		
		$("#ctgroup").on("click change",function(){
			var ctgroup=$("#ctgroup option:selected").val();
			$.getJSON("./Thing/CategoryList/"+ctgroup, function(data){
				var str="";
				$("#categorylist").empty();			
				$(data).each(
					function(){
						str="<option value='"+this.ctno+"'>"+this.ctname+"</option>";
						$("#categorylist").append(str);		
					});
			});
		});
		
		$("#categorylist").on("click change",function(){
			var ctgroup=$("#ctgroup option:selected").val();
			var ctno=$("#categorylist option:selected").val();
			var url="/administrator/Thing/Categorylist?ctgroup="+ctgroup+"&ctno="+ctno;
			$.getJSON(url,function(data){
				$("#thinglist").empty();
				$(data.thingCategoryList).each(function(key, value){
					$("#thinglist").append("<option value='"+value.tno+"'>"+value.name+"</option>");
				});
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
.btn-default{
	font-size: 9pt;
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
#cal2Container_t_0 {
	border:1px solid #e4e4e4;
	width: 50%;
	float: left;
}
#cal2Container_t_0 th{
	background-color: #e4e4e4;
	border-bottom: 1px solid #4c4c4c;
}
#cal2Container_t_0 tr{
	border:1px solid #e4e4e4;
	text-align: center;
}
#cal2Container_t_1 {
	border:1px solid #e4e4e4;
	width: 50%;
	float: left;
}
#cal2Container_t_1 th{
	background-color: #909090;
	border-bottom: 1px solid #4c4c4c;
}
#cal2Container_t_1 tr{
	border:1px solid #e4e4e4;
	text-align: center;
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
  		<a href="#">Event</a>
  		<a href="#">Notice</a>
  		<a href="#">Member</a>
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
												<li class="active"><a
													href="http://happyrecipek.iptime.org:9090/administrator/ShopBox?page=1&perPageNum=12">
														<span class="glyphicon glyphicon-th-large"></span>
												</a></li>
												<li>
													<a href="http://happyrecipek.iptime.org:9090/administrator/ShopTable?page=1&perPageNum=12">
														<span class="glyphicon glyphicon-list"></span>
													</a>
												</li>
											</ul>
												<input type="button" class="form-control" style="width: 30%; display: inline; float: right;" 
												value="Add Shop" id="AddItem" data-toggle="modal" data-target="#shopadd">
										</div>
										
									</div>
									<div class="row">
										<form id="frm" enctype="multipart/form-data" method="post" action="./Shop/Create">
										<c:if test="${pageMaker.cri.ctgroup ne 0 }">
											<input type="hidden" name="ctgroup" value="${pageMaker.cri.ctgroup}">
										</c:if>
										<c:if test="${pageMaker.cri.category ne 0 }">
											<input type="hidden" name="category" value="${pageMaker.cri.category}">
										</c:if>									
										<input type="hidden" name="page" value="${pageMaker.cri.page }">
										<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }">
										<input type="hidden" name="url" value="ShopBox">
											<!-- 모달 시작 -->
											<div class="modal fade" id="shopadd" role="dialog">
												<div class="modal-dialog modal-lg">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4 class="modal-title">Add Shop</h4>
														</div>
														<!-- 모달 바디 -->
														<div class="modal-body">
															<div class="container" style="width: 100%;">
																<div class="row">
																	<div class="form-group">
																		<label for="writer">WRITER : </label>
																		<input type="text" value="${sessionScope.MemberVO.id }"	name="writer" readonly="readonly"
																			class="form-control">
																		<input type="hidden" id="cno">
																	</div>
																	<div class="form-group">
																		<label for="title">TITLE :</label> 
																		<input type="text" name="title" placeholder="Enter Title" class="form-control" id="title">
																	</div>
																	<div class="form-group">
																		<label for="content">CONTENT :</label>
																		<textarea name="content" id="content" class="form-control" rows="20"></textarea>
																	</div>
																	<div class="form-group">
																		<select id="ctgroup" class="form-control">
																		<c:forEach items="${ctgroup }" var="list">
																			<option value="${list.ctgroup }">${list.name }</option>
																		</c:forEach>
																		</select>
																	</div>																	
																	<div class="form-group">
																		<select id="categorylist" class="form-control">																			
																		</select>
																	</div>
																	<div class="form-group">
																		<select id="thinglist" class="form-control">
																		</select>
																	</div>
																	<div class="form-group">
																		<label for="file">COVER IMAGE :</label>
																		<div class="col-md-4" id="coverimage" style="width: 400px;height: 400px;"></div>
																		<input type="hidden" id="file" name="file1">
																	</div>
																	<div class="form-group">
																		<div id="cal1Container"></div>
																	</div>
																	<div class="form-group">
																		<div id="dates">
																			<label for="startday">STARTDAY:</label> 
																			<input type="text" name="startday" id="ask_in"
																					class="form-control" readonly="readonly">
																			<label for="endday">ENDDAY:</label> 
																			<input type="text" name="endday" id="ask_out"
																					class="form-control" readonly="readonly">
																		</div>
																	</div>																	
																	<div class="form-group">
																		<label>COST</label> 
																		<input type="text" name="cost"	class="form-control" id="cost" readonly="readonly">
																	</div>
																	<div class="form-group">
																		<label>SALE COST</label>
																		<input type="text"	name="salecost" class="form-control" id="salecost">
																	</div>
																	<div class="form-group">
																		<label>ADD MORE SHOP</label> 
																		<select	class="form-control" id="shopmore" multiple="multiple" name="shopmore">
																		<option value="0" selected="selected">없음</option>
																		<c:forEach items="${shop }" var="slist">
																			<option value="${slist.sno }">${slist.title }</option>
																		</c:forEach>
																		</select>
																	</div>
																</div>
																<div class="form-group" style="width: 100%;">
																	<table class="table">
																		<thead>
																			<tr>
																				<th width="30px">TYPE</th>
																				<th width="10px">CHECK</th>
																				<th>START</th>
																				<th>END</th>
																				<th>LATER DAY</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr class="success">
																				<th colspan="5">메인 페이지 및 쿠킹클래스 페이지 노출 여부 결정</th>
																			</tr>
																			<tr class="success">
																				<th>DISPLAY</th>
																				<td colspan="4">
																					<input type="checkbox" name="display" value='Y' class="checkbox" checked="checked" id="display">
																				</td>
																			</tr>
																			<tr class="danger">
																				<th colspan="5">DISPLAY=YES 라면 메인페이지 강조 영역에 노출
																					여부 체크, 기간 설정 가능, 등록일 이후 몇일까지 노출 여부 설정가능</th>
																			</tr>
																			<tr class="danger">
																				<th>STRONG</th>
																				<td>
																					<input type="checkbox" name="strong" value='Y' class="checkbox" id="strong">
																				</td>
																				<td>
																					<input type="text" class="form-control"	name="st_begin" placeholder="ex) 12/16 = MONTH/DAY"
																					maxlength="5" id="st_begin">
																				</td>
																				<td>
																					<input type="text" class="form-control"	name="st_end" placeholder="ex) 12/16 = MONTH/DAY"
																					maxlength="5" id="st_end">
																				</td>
																				<td>
																					<input type="text" class="form-control"	name="st_day" placeholder="Register Day later Day Only Number" 
																					maxlength="5" id="st_day">
																				</td>
																			</tr>
																			<tr class="info">
																				<th colspan="5">비공개 여부 결정 YES 라면 DISPLAY=NO 로
																					변경 / 기간설정가능/등록일 이후의 날짜까지만 노출, 이후 비공개로 변경</th>
																			</tr>
																			<tr class="info">
																				<th>CLOSE</th>
																				<td>
																					<input type="checkbox" name="closed" value='Y' class="checkbox" id="closed">
																				</td>
																				<td>
																					<input type="text" class="form-control"	name="clo_begin" placeholder="ex) 12/16 = MONTH/DAY" 
																					maxlength="5" id="clo_begin">
																				</td>
																				<td>
																					<input type="text" class="form-control"	name="clo_end" placeholder="ex) 12/16 = MONTH/DAY"
																					maxlength="5" id="clo_end">
																				</td>
																				<td>
																					<input type="text" class="form-control" name="clo_day" placeholder="Register Day later Day Only Number" 
																					maxlength="5" id="clo_day">
																				</td>
																			</tr>
																			<tr class="warning">
																				<th colspan="5">삭제 여부 결정 YES 라면 반드시 기간 또는 날짜 기입
																					/ 기간 설정 가능/등록일에서 등록 날짜가 지난 후 삭제
																				</th>
																			</tr>
																			<tr class="warning">
																				<th>DELETE</th>
																				<td>
																					<input type="checkbox" name="deleted" value='Y' class="checkbox" id="deleted">
																				</td>
																				<td>
																					<input type="text" class="form-control"	name="del_begin" placeholder="ex) 12/16 = MONTH/DAY" 
																					maxlength="5" id="del_begin">
																				</td>
																				<td>
																					<input type="text" class="form-control"	name="del_end" placeholder="ex) 12/16 = MONTH/DAY"
																					maxlength="5" id="del_end">
																				</td>
																				<td>
																					<input type="text" class="form-control"	name="del_day" placeholder="Register Day later Day Only Number"
																					maxlength="5" id="del_day">
																				</td>
																			</tr>
																			<tr class="success">
																				<th colspan="5">세일 여부 결정 YES /기간 설정 가능 / 등록일로부터
																					몇일까지만 세일 설정 가능
																				</th>
																			</tr>
																			<tr class="success">
																				<th>SALE</th>
																				<td>
																					<input type="checkbox" name="sale" value='Y' class="checkbox" id="sale">
																				</td>
																				<td>
																					<input type="text" class="form-control"	name="sale_begin" placeholder="ex) 12/16 = MONTH/DAY" 
																					maxlength="5" id="sale_begin">
																				</td>
																				<td>
																					<input type="text" class="form-control" name="sale_end" placeholder="ex) 12/16 = MONTH/DAY"
																					maxlength="5" id="sale_end">
																				</td>
																				<td>
																					<input type="text" class="form-control"	name="sale_day"	placeholder="Register Day later Day Only Number"
																					maxlength="5" id="sale_day">
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<input type="button" value="Add" class="btn btn-default" id="shopsubmit">
															<button type="button" class="btn btn-default" data-dismiss="modal" id="close">Close</button>
														</div>
													</div>
												</div>
											</div>
											<!-- 모달 끝 -->
										</form>
									</div>
									<div class="row">
										<div class="row">
											<div class="tab-content">
												<div id="shopboxlist" class="tab-pane fade in active">
													<div class="col-md-12" id="shoplist">
														<div class="container">
															<div class="row">
																<c:forEach items="${shop }" var="list">
																	<div class="col-sm-3" style="margin-top: 10px;">
																		<div class="row">
																			<label>No.${list.tno } ${list.title }</label>
																		</div>
																		<img src="/photo_upload/thing/${list.thumb }"
																			style="width: 227px; height: 227px;">
																		<div class="row">
																			<input type="button" value="DELETE"
																				class="btn btn-default"
																				onclick="deleteItem(${list.tno})"> <input
																				type="button" value="MODIFY" class="btn btn-default"
																				onclick="getAjax(${list.tno})" data-toggle="modal"
																				data-target="#shopadd">
																		</div>
																	</div>
																</c:forEach>
															</div>
															<div class="row">
																<div class="text-center">
																	<ul class="pagination">
																		<c:if test="${pageMaker.prev }">
																			<li><a
																				href="ShopBox?page=${pageMaker.startPage-1 }">&laquo;</a>
																			</li>
																		</c:if>
																		<c:forEach begin="${pageMaker.startPage }"
																			end="${pageMaker.endPage }" var="idx">
																			<li
																				<c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
																				<a href="ShopBox?page=${idx }">${idx }</a>
																			</li>
																		</c:forEach>
																		<c:if
																			test="${pageMaker.next && pageMaker.endPage > 0 }">
																			<li><a
																				href="ShopBox?page=${pageMaker.startPage+1 }">&raquo;</a>
																			</li>
																		</c:if>
																	</ul>
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>