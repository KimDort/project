<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/JavaScript">
	window.onload=function(){
		getGroupList();
		getCategoryList();
		CKEDITOR.replace('content1');  // Cooking Class<TEXTAREA>태그 id 값 
		CKEDITOR.replace('content5');
    };   
</script>
<style type="text/css">

/*Panel tabs*/
.panel-tabs {
    position: relative;
    bottom: 30px;
    clear:both;
    border-bottom: 1px solid transparent;
}

.panel-tabs > li {
    float: left;
    margin-bottom: -1px;
}

.panel-tabs > li > a {
    margin-right: 2px;
    margin-top: 4px;
    line-height: .85;
    border: 1px solid transparent;
    border-radius: 4px 4px 0 0;
    color: #E0E0E0;
}

.panel-tabs > li > a:hover {
    border-color: transparent;
    color: #ffffff;
    background-color: transparent;
}

.panel-tabs > li.active > a,
.panel-tabs > li.active > a:hover,
.panel-tabs > li.active > a:focus {
    color: #fff;
    cursor: default;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    background-color: rgba(255,255,255, .23);
    border-bottom-color: transparent;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Happy Recipe K</title>
</head>
<body>
	<jsp:include page="../menu/top.jsp" flush='false' />
	<section class="body-sec">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-md-offst-3">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">Administrator Page</h3>
							<span class="pull-right">
							 <!-- Menu Tabs -->
								<ul class="nav panel-tabs">
									<li class="active"><a href="#tab1" data-toggle="tab">Cooking Class</a></li>
									<li><a href="#tab2" data-toggle="tab">Notice</a></li>
									<li><a href="#tab3" data-toggle="tab">Event</a></li>
									<li><a href="#tab4" data-toggle="tab">Thing</a></li>
									<li><a href="#tab5" data-toggle="tab">Shop</a></li>
									<li><a href="#tab6" data-toggle="tab">Member</a></li>
								</ul>
							</span>
						</div>
						<div class="panel-body">
							<div class="tab-content">
								<div class="tab-pane active" id="tab1">
								<div class="container" style="width: 100%;">	
								<div class="row">
									<div class="col-md-12">
										<ul class="nav nav-tabs" style="float: left;">
  										<li class="active"><a data-toggle="tab" href="#cookboxlist"><span class="glyphicon glyphicon-th-large"></span></a></li>
  										<li><a data-toggle="tab" href="#cooktablelist" onclick="getAllTableList('cook')">
  											<span class="glyphicon glyphicon-list"></span></a>
  										</li>  										
										</ul>
									<input type="button" class="form-control" style="width: 30%;display: inline;float: right;" value="Add Cooking Class"
										id="AddItem" data-toggle="modal" data-target="#cookingadd"
										onclick="var modalid=modalId($('#cookingadd'))">										
									</div>
									<form id="frm" enctype="multipart/form-data" method="post" action="/cook/create">
									<!-- 모달 시작 -->
										<div class="modal fade" id="cookingadd" role="dialog" >										
  										  <div class="modal-dialog modal-lg">
											<div class="modal-content">
											<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Add Cooking Class</h4>
        								</div>
        								<!-- 모달 바디 -->
        								<div class="modal-body">          									
										<jsp:include page="../cook/create.jsp" flush='false' />			
        								</div>
        								<div class="modal-footer">
        								<input type="submit" value="Add" id="savebutton" class="btn btn-default">
          								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
  									<div class="col-md-12" id="cooklist">
									<div class="container">
										<div class="row">
										<c:forEach items="${cook }" var="ckList">
												<div class="col-sm-3">
													<img src="/photo_upload/cook/${ckList.thumb }"
                  											style="width: 227px; height: 227px;">                  						
                    								<h5>
                      									<a href="#">${ckList.title }</a>
                    								</h5>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
  								</div>
  								<div id="cooktablelist" class="tab-pane fade">
  									<table class="table table-striped" id="cookTlist">
										<thead>
										<tr>
											<th>No.</th>
											<th>Title</th>
											<th>RegDate</th>
											<th>Ask Start</th>
											<th>Ask End</th>
											<th>Start Day</th>
											<th>End Day</th>
											<th>Start Time</th>
											<th>End Time</th>
											<th>Cost</th>
											<th>Sale Cost</th>
											<th>Total Cost</th>
											<th>Strong</th>
											<th>Closed</th>
											<th>Deleted</th>
											<th>Sale</th>
											<th>Display</th>
										</tr>
										</thead>										
										<tbody>											
										</tbody>
									</table>
  								</div>  								
								</div>						
									
									</div>
									</div>
								</div>
								
								<div class="tab-pane" id="tab2">
								<div class="container">
									<div class="row">
										<div class="col-md-12" style="width: 95%;">
										<ul class="nav nav-tabs" style="float: left;">
  										<li class="active"><a data-toggle="tab" href="#noticeboxlist"><span class="glyphicon glyphicon-th-large"></span></a></li>
  										<li><a data-toggle="tab" href="#noticetablelist" onclick="getAllTableList('notice')">
  											<span class="glyphicon glyphicon-list"></span></a>
  										</li>  										
										</ul>
											<input type="button" class="form-control" style="width: 30%;display: inline;float: right;" 
											value="Add Notice" id="AddItem" data-toggle="modal" data-target="#noticeadd"
											onclick="var modalid=modalId($('#noticeadd'))">	
										</div>
										<!-- 모달 시작 -->
										<div class="modal fade" id="noticeadd" role="dialog">
										<form id="frm" enctype="multipart/form-data" method="post" action="/notice/create">
  										  <div class="modal-dialog modal-lg">
											<div class="modal-content">
											<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Add Notice</h4>
        								</div>
        								<!-- 모달 바디 -->
        								<div class="modal-body">          									
										<jsp:include page="../notice/create.jsp" flush='false' />			
        								</div>
        								<div class="modal-footer">
        								<input type="submit" value="Add" id="savebutton" class="btn btn-default">
          								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        								</div>
      									</div>
    									</div>
    									</form>
  										</div>
  										<!-- 모달 끝 --> 
									</div>
									<div class="row">
										<div class="tab-content">
  										<div id="noticeboxlist" class="tab-pane fade in active">
		    								<div class="col-md-12" id="noticelist" style="width: 95%;">
		    									<div class="container">
		    										<div class="row"></div>
		    									</div>
		    								</div>
  										</div>
  										<div id="noticetablelist" class="tab-pane fade">
  										<div class="col-md-12" style="width: 95%;">
  											<div class="row">
  												<table class="table table-striped" id="noticeTlist">
												<thead>
												<tr>
													<th>No.</th>
													<th>Title</th>
													<th>Regdate</th>
													<th>Start Day</th>
													<th>End Day</th>
													<th>Strong</th>
													<th>Closed</th>
													<th>Deleted</th>
												</tr>
												</thead>
												</table>
  											</div>
  										</div>    										
  										</div>  										
										</div>
									</div>
								</div>
								</div>
								<div class="tab-pane" id="tab3">
								<div class="container">
									<div class="row">
										<div class="col-md-12" style="width: 95%;">
										<ul class="nav nav-tabs" style="float: left;">
  										<li class="active"><a data-toggle="tab" href="#eventboxlist"><span class="glyphicon glyphicon-th-large"></span></a></li>
  										<li><a data-toggle="tab" href="#eventtablelist" onclick="getAllTableList('event')">
  											<span class="glyphicon glyphicon-list"></span></a>
  										</li>  										
										</ul>
										<input type="button" class="btn btn-default" style="float: right;" value="Add Event"
										id="AddItem" data-toggle="modal" data-target="#eventadd" 
										onclick="var modalid=modalId($('#eventadd'))">
										</div>
										<form id="frm" enctype="multipart/form-data" method="post" action="/event/create">
										<!-- thing 모달 시작 -->
										<div class="modal fade" id="eventadd" role="dialog">
  										  <div class="modal-dialog modal-lg">
											<div class="modal-content">
											<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Add Event</h4>
        								</div>
        								<!-- 모달 바디 -->
        								<div class="modal-body">          									
										<jsp:include page="../event/create.jsp" flush='false' />			
        								</div>
        								<div class="modal-footer">
        								<input type="submit" value="Add" id="savebutton" class="btn btn-default">
          								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        								</div>
      									</div>
    									</div>    									
  										</div>
  										<!-- thing 모달 끝 -->
  										</form> 
									</div>
									<div class="row">
										<div class="tab-content">
  											<div id="eventboxlist" class="tab-pane fade in active">
    											<div class="col-md-12" id="eventlist" style="width: 95%;">
		    									<div class="container">
		    										<div class="row"></div>
		    									</div>
  												</div>
  											</div>
  											<div id="eventtablelist" class="tab-pane fade">
  												<div class="col-md-12" style="width: 95%;">
		    									<div class="container">
		    										<div class="row">
		    											<table class="table table-striped" id="evetTlist">
														<thead>
														<tr>
														<th>No.</th>
														<th>Title</th>
														<th>Regdate</th>
														<th>Start Day</th>
														<th>End Day</th>
														<th>Banner</th>
														<th>Strong</th>
														<th>Closed</th>
														<th>Deleted</th>
														<th>Quit</th>
														</tr>
														</thead>	
														<tbody>
														</tbody>									
														</table>
		    										</div>
		    									</div>
  												</div>    											
  											</div> 											
											</div>
										</div>
									</div>								
								</div>
								<div class="tab-pane" id="tab4">
								<div class="container">
								<div class="row">
									<div class="col-md-4" style="float: left;"><label>카테고리 그룹 분류</label></div>
									<div class="col-md-4" style="float: left;"><label>새로운 카테고리 그룹 목록 추가</label></div>
								</div>
								<div class="row">
									<div class="col-md-4" style="float: left;">
										<select class="form-control" id="ctgroup" style="width: 80%;display: inline;" >
											<c:forEach items="${ctgroup }" var="ctList">
												<option value="${ctList.ctgroup }">${ctList.name }</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-4" style="float: left;">
									<span class="glyphicon glyphicon-chevron-left" style="display: inline;"></span>
										<input type="text" class="form-control" id="groupText" style="width: 80%;display: inline;">
									</div>
									<div class="col-md-4" style="float: left;">
										<input type="button" class="btn btn-default" value="ADD GROUP" id="AddCTG">
										<input type="button" class="btn btn-default" value="Delete" id="delTG">
									</div>
								</div>
								<div class="row">
									<div class="col-md-4" style="float: left;"><label>카테고리 소그룹 분류</label></div>
									<div class="col-md-4" style="float: left;"><label>새로운 카테고리 목록 추가</label></div>
								</div>
								<div class="row">
									<div class="col-md-4" style="float: left;">
										<select class="form-control" id="categorylist" style="width: 80%;display: inline;">
										</select>
									</div>
									<div class="col-md-4" style="float: left;">
										<span class="glyphicon glyphicon-chevron-left"></span>
										<input type="text" class="form-control" id="categoryText" style="width: 80%;display: inline;">
									</div>
									<div class="col-md-4" style="float: left;">
										<input type="button" class="btn btn-default" value="ADD CATEGORY" id="AddCT">
										<input type="button" class="btn btn-default" value="Delete" id="delCT">
									</div>
								</div>
								<div class="row" style="width: 90%;border-top: 1px solid gray;">
									<div class="col-md-4" style="float: left;">
										<label>카테고리 대그룹</label>
									</div>
									<div class="col-md-4" style="float: left;">
										<label>카테고리 소그룹</label>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4" style="float: left;">
										<select class="form-control" id="ctgroup" style="width: 80%;display: inline;" >
											<c:forEach items="${ctgroup }" var="ctList">
												<option value="${ctList.ctgroup }">${ctList.name }</option>
											</c:forEach>
										</select>									
									</div>
									<div class="col-md-4" style="float: left;">
									<span class="glyphicon glyphicon-chevron-right"></span>
										<select class="form-control" id="categorylist" style="width: 80%;display: inline;">
										</select>
									</div>
									<div class="col-md-4" style="float: left;">
										<input type="button" class="form-control" style="width: 30%;display: inline;" value="Add Item"
										id="AddItem" data-toggle="modal" data-target="#thingAddItem"
										onclick="var modalid=modalId($('#thingAddItem'))">
										<input type="button" class="form-control" style="width: 30%;display: inline;" value="All List"
										id="AllList">
										<form id="frm" enctype="multipart/form-data" method="post" action="/thing/create">
										<!-- 모달 시작 -->
										<div class="modal fade" id="thingAddItem" role="dialog">
										
  										  <div class="modal-dialog modal-lg">
											<div class="modal-content">
											<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Thing Add Item</h4>
        								</div>
        								<!-- 모달 바디 -->
        								<div class="modal-body">          									
										<jsp:include page="../thing/create.jsp" flush='false' />			
        								</div>
        								<div class="modal-footer">
        								<input type="submit" value="Add" id="savebutton" class="btn btn-default">
          								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        								</div>
      									</div>
    									</div>
  										</div>
  										<!-- 모달 끝 --> 
  										</form> 										
									</div>
								</div>
								</div>
									<div class="container">
										<c:forEach items="${thing }" var="thingList">
										<div class="col-sm-3">
										<div class="container">
											<div class="row">						
                  								<img src="/photo_upload/thing/${thingList.thumb }"
                  								style="width: 227px; height: 227px;">                  						
                    							<h5>
                      							<a href="#">${thingList.name }</a>
                    							</h5>
                    						</div>
                    						<div class="row">
                    							<select class="form-control" style="width: 10%;display: inline;" id="regctgroup">
                    								<c:forEach items="${ctgroup }" var="ctList">
														<option value="${ctList.ctgroup}"
														<c:out value="${ctList.ctgroup eq  thingList.ctgroup ? 'selected=selected':''}"/>
														>${ctList.name }</option>
													</c:forEach>
                    							</select>
                    							<select class="form-control" style="width: 10%; display: inline;" id="regcategorylist">
                    								<c:forEach items="${categoryAllList }" var="ctAll">
                    									<c:if test="${ctAll.ctgroup eq thingList.ctgroup }">
                    										<option value="${ctAll.ctno }"
                    											<c:out value="${ctAll.ctno eq thingList.category ? 'selected=selected':''}"/>
                    										>${ctAll.ctname }</option>
                    									</c:if>
                    								</c:forEach>                    								
                    							</select>
                    						</div>	  
                    					</div>
									</div>
									</c:forEach>
									</div>
								</div>
								<div class="tab-pane" id="tab5">								
								<div class="container">
									<div class="row">
									<div class="col-md-12" style="width: 95%;">
									<ul class="nav nav-tabs" style="float: left;">
  										<li class="active"><a data-toggle="tab" href="#shopboxlist"><span class="glyphicon glyphicon-th-large"></span></a></li>
  										<li><a data-toggle="tab" href="#shoptablelist" onclick="getAllTableList('shop')">
  											<span class="glyphicon glyphicon-list"></span></a>
  										</li>  										
									</ul>
									<input type="button" class="form-control" style="width: 30%;display: inline;float: right;" value="Add Item"
										id="AddItem" data-toggle="modal" data-target="#shopadd" 
										onclick="var modalid=modalId($('#shopadd'));addShopThing();">
									</div>
										<form id="frm" enctype="multipart/form-data" method="post" action="/shop/create">									
										<!-- thing 모달 시작 -->
										<div class="modal fade" id="shopadd" role="dialog">										
  										  <div class="modal-dialog modal-lg">
											<div class="modal-content">
											<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Shop Add Item</h4>
        								</div>
        								<!-- 모달 바디 -->        					
        								<div class="modal-body">          									
											<jsp:include page="../shop/create.jsp" flush='false' />			
        								</div>
        								<div class="modal-footer">
        								<input type="submit" value="Add" id="savebutton" class="btn btn-default">
          								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        								</div>
      									</div>
    									</div>
  										</div>
  										<!-- thing 모달 끝 -->
  										</form>
  									</div> 								
									<div class="row">
										<div class="tab-content">
  										<div id="shopboxlist" class="tab-pane fade in active">
  										<div class="col-md-12" style="width: 95%" id="shoplist">
  										<div class="container">
  											<div class="row">
  											<c:forEach items="${shop }" var="spList">
												<div class="col-sm-3" style="width: 250px;">
													<img src="/photo_upload/thing/${spList.file1 }"
                  											style="width: 227px; height: 227px;">                  						
                    								<h5>
                      									<a href="#">${spList.title }</a>
                    								</h5>
												</div>
											</c:forEach>
											</div>	
										</div>
  										</div>
  										</div>
  										<div id="shoptablelist" class="tab-pane fade">
    										
  										</div>
										</div>																				
									</div>	
								</div>								
								</div>
								<div class="tab-pane" id="tab6">
								<div class="container">
								<div class="row">
								<div class="col-md-12" style="width: 95%;">
									<table class="table table-striped">
										<thead>
										<tr>
											<th>No.</th>
											<th>Id</th>
											<th>Name</th>
											<th>NiceName</th>
											<th>Regdate</th>
											<th>Level</th>
											<th>Confirm</th>
											<th>Point</th>
											<th>Zipcode</th>
											<th>Address1</th>
											<th>Address2</th>
											<th>Phone</th>
										</tr>
										</thead>
										<tbody>
											<c:forEach items="${member}" var="memberList">
												<tr>
													<td>${memberList.mno }</td>
													<td>${memberList.id }</td>
													<td>${memberList.name }</td>
													<td>${memberList.nickname}</td>
													<td>${memberList.regdate }</td>
													<td>${memberList.mlevel }</td>
													<td>${memberList.confirm }</td>
													<td>${memberList.point }</td>
													<td>${memberList.zipcode}</td>
													<td>${memberList.address1 }</td>
													<td>${memberList.address2 }</td>
													<td>${memberList.phone}</td>
												</tr>
											</c:forEach>
										</tbody>
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