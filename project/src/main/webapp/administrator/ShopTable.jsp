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
<script type="text/javascript" src="../js/jquery.number.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/JavaScript">
	window.onload = function() {
		$.ajaxSetup({dataType:"text"});
		CKEDITOR.replace('content'); // Shop<TEXTAREA>태그 id 값 
	};
	
	$(document).ready(function(){
		var snoIndex=$("input[id='listsno']");
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
			CKEDITOR.instances.content.setData();
		});
		
		$("select[id='strong']").on("change",function(){
			var index=$("select[id='strong']").index(this);
			var strong=this.value;
			var sno=snoIndex[index].value;		
			$.ajax({
				type:'put',
				url:'/administrator/Shop/Strong/Update/'+sno,
				headers :{
					"Content-type":"application/json",
					"X-HTTP-Method-Override":"PUT"
				},
				data : JSON.stringify({strong:strong}),
				dataType:'text',
				success:function(result){
					console.log("result: "+result);
					if(result== 'SUCCESS'){
						alert(sno+" 번째 게시물의 강조 여부를 "+strong+"로 변경완료 하였습니다.");
					}
				}
			});
		});
		
		$("select[id='closed']").on("change",function(){
			var index=$("select[id='closed']").index(this);
			var closed=this.value;
			var sno=snoIndex[index].value;		
			$.ajax({
				type:'put',
				url:'/administrator/Shop/Closed/Update/'+sno,
				headers :{
					"Content-type":"application/json",
					"X-HTTP-Method-Override":"PUT"
				},
				data : JSON.stringify({closed:closed}),
				dataType:'text',
				success:function(result){
					console.log("result: "+result);
					if(result== 'SUCCESS'){
						alert(sno+" 번째 게시물의 강조 여부를 "+closed+"로 변경완료 하였습니다.");
					}
				}
			});
		});
		
		$("select[id='deleted']").on("change",function(){
			var index=$("select[id='deleted']").index(this);
			var deleted=this.value;
			var sno=snoIndex[index].value;		
			$.ajax({
				type:'put',
				url:'/administrator/Shop/Deleted/Update/'+sno,
				headers :{
					"Content-type":"application/json",
					"X-HTTP-Method-Override":"PUT"
				},
				data : JSON.stringify({deleted:deleted}),
				dataType:'text',
				success:function(result){
					console.log("result: "+result);
					if(result== 'SUCCESS'){
						alert(sno+" 번째 게시물의 강조 여부를 "+deleted+"로 변경완료 하였습니다.");
					}
				}
			});
		});
		
		$("select[id='sale']").on("change",function(){
			var index=$("select[id='sale']").index(this);
			var sale=this.value;
			var sno=snoIndex[index].value;		
			$.ajax({
				type:'put',
				url:'/administrator/Shop/Sale/Update/'+sno,
				headers :{
					"Content-type":"application/json",
					"X-HTTP-Method-Override":"PUT"
				},
				data : JSON.stringify({sale:sale}),
				dataType:'text',
				success:function(result){
					console.log("result: "+result);
					if(result== 'SUCCESS'){
						alert(sno+" 번째 게시물의 강조 여부를 "+sale+"로 변경완료 하였습니다.");
					}
				}
			});
		});
		
		$("select[id='display']").on("change",function(){
			var index=$("select[id='display']").index(this);
			var display=this.value;
			var sno=snoIndex[index].value;		
			$.ajax({
				type:'put',
				url:'/administrator/Shop/Display/Update/'+sno,
				headers :{
					"Content-type":"application/json",
					"X-HTTP-Method-Override":"PUT"
				},
				data : JSON.stringify({display:display}),
				dataType:'text',
				success:function(result){
					console.log("result: "+result);
					if(result== 'SUCCESS'){
						alert(sno+" 번째 게시물의 강조 여부를 "+display+"로 변경완료 하였습니다.");
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
												<li>
													<a href="http://happyrecipek.iptime.org:9090/administrator/ShopBox?page=1&perPageNum=12">
														<span class="glyphicon glyphicon-th-large"></span>
													</a>
												</li>
												<li class="active">
													<a href="http://happyrecipek.iptime.org:9090/administrator/ShopTable?page=1&perPageNum=12"> 
														<span class="glyphicon glyphicon-list"></span>
													</a>
												</li>
											</ul>
											<input type="button" class="form-control"
												style="width: 30%; display: inline; float: right;"
												value="Add Shop" id="AddItem" data-toggle="modal"
												data-target="#shopadd">
										</div>
										<form id="frm" enctype="multipart/form-data" method="post" action="./Shop/Create">
										<c:if test="${pageMaker.cri.ctgroup ne 0 }">
											<input type="hidden" name="ctgroup" value="${pageMaker.cri.ctgroup}">
										</c:if>
										<c:if test="${pageMaker.cri.category ne 0 }">
											<input type="hidden" name="category" value="${pageMaker.cri.category}">
										</c:if>									
										<input type="hidden" name="page" value="${pageMaker.cri.page }">
										<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }">
										<input type="hidden" name="url" value="ShopTable">
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
																		<label>CATEGORY GROUP</label>
																		<select id="ctgroup" class="form-control">
																		<c:forEach items="${ctgroup }" var="list">
																			<option value="${list.ctgroup }">${list.name }</option>
																		</c:forEach>
																		</select>
																	</div>																	
																	<div class="form-group">
																		<label>CATEGORY</label>
																		<select id="categorylist" class="form-control">																			
																		</select>
																	</div>
																	<div class="form-group">
																		<label>THING</label>
																		<select id="thinglist" class="form-control" name="tno">
																		</select>
																	</div>
																	<div class="form-group">
																		<label for="writer">WRITER : </label>
																		<input type="text" value="${sessionScope.MemberVO.id }"	name="writer" readonly="readonly"
																			class="form-control">
																		<input type="hidden" id="sno">
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
																		<label for="file">COVER IMAGE :</label>
																		<div id="coverimage"></div>
																		<input type="hidden" id="file" name="file1" class="form-control">
																	</div>																	
																	<div class="form-group">
																		<label>COST</label> 
																		<input type="text" name="cost"	class="form-control" id="cost">
																	</div>
																	<div class="form-group">
																		<label>SALE COST</label> 
																		<input type="text" name="salecost"	class="form-control" id="salecost">
																	</div>
																	<div class="form-group">
																	<label>ADD MORE SHOP</label>
																	<label>CATEGORY GROUP</label>
																		<select id="ctgroup" class="form-control">
																		<c:forEach items="${ctgroup }" var="list">
																			<option value="${list.ctgroup }">${list.name }</option>
																		</c:forEach>
																		</select>
																	</div>																	
																	<div class="form-group">
																		<label>CATEGORY</label>
																		<select id="categorylist" class="form-control">																			
																		</select>
																	</div>
																	<div class="form-group">
																		<label>THING LIST </label>																		
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
										<div class="tab-content">
											<div id="shopboxlist" class="tab-pane fade in active">
												<table class="table table-striped" id="shopTlist">
													<thead>
														<tr>
															<th>No.</th>
															<th>Title</th>
															<th>RegDate</th>															
															<th>Cost</th>
															<th>Sale Cost</th>
															<th>Total Cost</th>
															<th>Strong</th>
															<th>Closed</th>
															<th>Deleted</th>
															<th>Sale</th>
															<th>Display</th>
															<th>Modify</th>
															<th>Delete</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${shop }" var="tlist">
														<tr>
															<td>${tlist.sno }<input type="hidden" value=${tlist.sno } id="listsno"></td>
															<td>${tlist.title }</td>
															<td>${tlist.regdate }</td>
															<td>${tlist.cost }</td>
															<td>${tlist.salecost }</td>
															<td>${tlist.cost - tlist.salecost }</td>
															<td>
																<select name="strong" class="form-control" id="strong">
																	<option value='Y' 
																	<c:out value="${tlist.strong eq 'Y'.charAt(0)?'selected=selected':'' }"/>>
																	Y</option>
																	<option value='N'
																	<c:out value="${tlist.strong eq 'N'.charAt(0)?'selected=selected':'' }"/>>
																	N</option>
																</select>
															</td>
															<td>
																<select name="closed" class="form-control" id="closed">
																	<option value='Y' 
																	<c:out value="${tlist.closed eq 'Y'.charAt(0)?'selected=selected':'' }"/>>
																	Y</option>
																	<option value='N'
																	<c:out value="${tlist.closed eq 'N'.charAt(0)?'selected=selected':'' }"/>>
																	N</option>
																</select>
															</td>
															<td>
																<select name="deleted" class="form-control" id="deleted">
																	<option value='Y' 
																	<c:out value="${tlist.deleted eq 'Y'.charAt(0)?'selected=selected':'' }"/>>
																	Y</option>
																	<option value='N'
																	<c:out value="${tlist.deleted eq 'N'.charAt(0)?'selected=selected':'' }"/>>
																	N</option>
																</select>
															</td>
															<td>
																<select name="sale" class="form-control" id="sale">
																	<option value='Y' 
																	<c:out value="${tlist.sale eq 'Y'.charAt(0)?'selected=selected':'' }"/>>
																	Y</option>
																	<option value='N'
																	<c:out value="${tlist.sale eq 'N'.charAt(0)?'selected=selected':'' }"/>>
																	N</option>
																</select>
															</td>
															<td>
																<select name="display" class="form-control" id="display">
																	<option value='Y' 
																	<c:out value="${tlist.display eq 'Y'.charAt(0)?'selected=selected':'' }"/>>
																	Y</option>
																	<option value='N'
																	<c:out value="${tlist.display eq 'N'.charAt(0)?'selected=selected':'' }"/>>
																	N</option>
																</select>
															</td>
															<td>
																<input type="button" value="M" class="btn btn-default"
																		onclick="getAjax(${tlist.sno})" data-toggle="modal" data-target="#shopadd">
															</td>
															<td>
																<input type="button" value="D" class="btn btn-default"
																		onclick="deleteItem(${tlist.sno}, ${pageMaker.cri.page }, ${pageMaker.cri.perPageNum },'ShopTable')">
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
																			<a href="ShopTable?page=${pageMaker.startPage-1 }">&laquo;</a>
																		</li>
																	</c:if>
																	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
																		<li
																			<c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
																			<a href="ShopTable?page=${idx }">${idx }</a>
																		</li>
																	</c:forEach>
																	<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
																		<li>
																			<a href="ShopTable?page=${pageMaker.startPage+1 }">&raquo;</a>
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