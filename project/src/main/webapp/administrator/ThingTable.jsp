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
<script type="text/javascript" src="../js/admin_thing.js"></script>
<script type="text/javascript" src="../js/jquery.number.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/JavaScript">
	window.onload = function() {
		getCategoryList(${pageMaker.cri.ctgroup},${pageMaker.cri.category});
	};
	
	$(document).ready(function(){		
		
		var result = '${msg}';
		if (result == 'SUCCESS') {
		  alert("요청이 정상적으로 처리되었습니다.");
		}		
		$("#thingsubmit").on("click",function(){
			if(check()==true){
				$("#frm").submit();
			}	
		});
		$("#AddItem").on("click",function(){
			$("form[id='frm']")[0].reset();
			$("#frm").attr("action","./Thing/Create")
		});
		
		//카테고리그룹 변경시 화면 리스트 출력
		$("select[id='ctgroup']").eq(2).on("change",function(){
			location.href="http://happyrecipek.iptime.org:9090/administrator/ThingBox?page="+${pageMaker.cri.page}+"&ctgroup="+
			$("select[id='ctgroup'] option:selected").eq(2).val();
		});
		
		//카테고리 변경시 화면 리스트 출력
		$("select[id='categorylist']").eq(2).on("change",function(){
			location.href="http://happyrecipek.iptime.org:9090/administrator/ThingBox?page="+${pageMaker.cri.page}+"&ctgroup="+
			$("select[id='ctgroup'] option:selected").eq(2).val()+"&category="+$("select[id='categorylist'] option:selected").eq(2).val();
		});
		
		
		$("#AddItem2").on("click",function(){
			$("form[id='frm']")[0].reset();
			$("#frm").attr("action","./Thing/Create")
			
			var ctgroup=$("select[id='ctgroup'] option:selected").eq(2).val();
			var category=$("select[id='categorylist'] option:selected").eq(2).val();
			
			$("select[id='categorylist'] option[value='"+category+"']").eq(0).prop("selected",true);
			$("select[id='ctgroup'] option[value='"+ctgroup+"']").eq(0).prop("selected",true);
		});		
		
		//카테고리 그룹 선택시 그룹에 속한 소그룹 출력
		$("select[id='ctgroup']").on("change",function(){
			var indexno=$("select[id='ctgroup']").index(this);		
			var ctgroup=this.value;
			$.getJSON("./Thing/CategoryList/"+ctgroup,function(data){
				$("select[id='categorylist']").eq(indexno).empty();
				$(data).each(
						function(index){
							//$("select[id='categorylist']").eq(indexno).append("<option value='"+this.ctno+"'>"+this.ctname+"</option>");
							if(${pageMaker.cri.category!=null}){
								str="<option value='"+this.ctno+"'";
								if(this.ctno==${pageMaker.cri.category}){
									str+="selected='selected'>"
								}else{
									str+=">"
								}
								str+=this.ctname+"</option>";
								$("select[id='categorylist']").eq(indexno).append(str);	
							}
						});
			});
		});
		//카테고리 그룹 선택시 그룹에 속한 소그룹 출력
		/* $("select[id='ctgroup']").on("click",function(){
			var indexno=$("select[id='ctgroup']").index(this);		
			var ctgroup=this.value;
			var str="";
			$.getJSON("./Thing/CategoryList/"+ctgroup,function(data){
				$("select[id='categorylist']").eq(indexno).empty();
				$(data).each(
						function(index){
							//$("select[id='categorylist']").eq(indexno).append("<option value='"+this.ctno+"'>"+this.ctname+"</option>");
							if(${pageMaker.cri.category!=null}){
								str="<option value='"+this.ctno+"'";
								if(this.ctno==${pageMaker.cri.category}){
									str+="selected='selected'>"
								}else{
									str+=">"
								}
								str+=this.ctname+"</option>";
								$("select[id='categorylist']").eq(indexno).append(str);	
							}
						});
			});
		}); */
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
												<li>
													<a href="http://happyrecipek.iptime.org:9090/administrator/ThingBox?page=1&perPageNum=12">
														<span class="glyphicon glyphicon-th-large"></span>
													</a>
												</li>
												<li  class="active">
													<a href="http://happyrecipek.iptime.org:9090/administrator/ThingTable?page=1&perPageNum=12">
														<span class="glyphicon glyphicon-list"></span>
													</a>
												</li>
											</ul>
												<input type="button" class="form-control" style="width: 30%; display: inline; float: right;" 
												value="Add Thing" id="AddItem" data-toggle="modal" data-target="#thingadd">
										</div>
										<form id="frm" enctype="multipart/form-data" method="post" action="./Thing/Create">
										<c:if test="${pageMaker.cri.ctgroup ne 0 }">
											<input type="hidden" name="ctgroup" value="${pageMaker.cri.ctgroup}">
										</c:if>
										<c:if test="${pageMaker.cri.category ne 0 }">
											<input type="hidden" name="category" value="${pageMaker.cri.category}">
										</c:if>									
										<input type="hidden" name="page" value="${pageMaker.cri.page }">
										<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }">
										<input type="hidden" name="url" value="ThingTable">
											<!-- 모달 시작 -->
											<div class="modal fade" id="thingadd" role="dialog">
												<div class="modal-dialog modal-lg">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4 class="modal-title">Add Thing Item</h4>
														</div>
														<!-- 모달 바디 -->
														<div class="modal-body">
															<div class="container" style="width: 100%;">
																<label for="categorygroup">CATEGORY GROUP:</label> 
																<select	class="form-control" name="ctgroup" id="ctgroup">
																	<c:forEach items="${ctgroup }" var="ctList">
																		<option value="${ctList.ctgroup }">${ctList.name }</option>
																	</c:forEach>
																</select>
																<div class="form-group">
																	<label for="category">CATEGORY: </label> 
																	<select	name="category" class="form-control" id="categorylist">
																	</select>
																</div>
																<div class="form-group">
																	<label for="title">NAME :</label> 
																	<input type="text" name="name" placeholder="Enter Title" class="form-control" id="name">
																	<input type="hidden" id="tno">
																</div>
																<div class="form-group">
																	<label for="file">COVER IMAGE :</label>
																	<input type="file" id="file" name="file1MF" class="form-control">
																</div>
																<div class="form-group">
																	<label>MADE COMPANY :</label>
																	<input type="text" id="company" name="company" class="form-control">
																</div>
																<div class="form-group">
																	<label>MADE COUNTRY :</label>
																	<input type="text" id="country" name="country" class="form-control">
																</div>
																<div class="form-group">
																	<label for="content">STOCK:</label>
																	<input type="number" name="stock" class="form-control"	id="stock">
																</div>
																<div class="form-group">
																	<label for="content">BUY COST :</label> 
																	<input type="number" name="buycost" class="form-control" id="buycost">
																</div>
																<div class="form-group">
																	<label for="content">SELL COST :</label>
																	<input type="number" name="sellcost" class="form-control" id="sellcost">
																</div>																
															</div>
														</div>
														<div class="modal-footer">
															<input type="button" value="Add" class="btn btn-default" id="thingsubmit">
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
											<div id="cookboxlist" class="tab-pane fade in active">
												<table class="table table-striped" id="cookTlist">
													<thead>
														<tr>
															<th>No.</th>
															<th>Group</th>															
															<th>Category</th>
															<th>Name</th>
															<th>stock</th>
															<th>Company</th>
															<th>Country</th>
															<th>Buy Cost</th>
															<th>Sell Cost</th>															
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${thing }" var="tlist">
														<tr>
															<td>${tlist.tno }<input type="hidden" value=${tlist.tno } id="listcno"></td>
															<td>
																<c:forEach items="${ctgroup }" var="list"> 
																	<c:if test="${list.ctgroup eq tlist.ctgroup }">
																		${list.name}
																	</c:if>
																</c:forEach>
															</td>
															<td>
																<c:forEach items="${category}" var="list"> 
																	<c:if test="${list.ctno eq tlist.category}">
																		${list.ctname}
																	</c:if>
																</c:forEach>
															</td>
															<td>${tlist.name }</td>
															<td>${tlist.stock }</td>
															<td>${tlist.company }</td>
															<td>${tlist.country }</td>
															<td>${tlist.buycost }</td>
															<td>${tlist.sellcost }</td>															
															<td>
																<input type="button" value="MODIFY" class="btn btn-default"
																	onclick="getAjax(${tlist.tno})" data-toggle="modal" data-target="#thingadd">
															</td>
															<td>
																<input type="button" value="DELETE"
																				class="btn btn-default"
																				onclick="deleteItem(${tlist.tno})">
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
																			<a href="CookTable?page=${pageMaker.startPage-1 }">&laquo;</a>
																		</li>
																	</c:if>
																	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
																		<li
																			<c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
																			<a href="CookTable?page=${idx }">${idx }</a>
																		</li>
																	</c:forEach>
																	<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
																		<li>
																			<a href="CookTable?page=${pageMaker.startPage+1 }">&raquo;</a>
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