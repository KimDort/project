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
	background-color:#ffffff;
	border: 4px double #e4e4e4;	
    cursor: pointer;	
    text-decoration: none;
	width: 100%;
	height: 70px;
	text-align: center;
	line-height: 60px;
	font-size: 10pt;font-weight: bold;
	-webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}
#buynow:hover{
	background: #e4e4e4;
	color: #ffffff;
}
</style>
</head> 
<!-- ----------------------------------------- -->
<body>
	<jsp:include page="../menu/top.jsp" flush='false' />
	<section class="body-sec">
	<div class="container">
		<div class="row">
			<div class="col-md-4" style="text-align: right;">
				<a href=""><c:out value="${ctgroup.name }"/></a>
				&nbsp;>&nbsp;<a href=""><c:out value="${category.ctname }"/></a>&nbsp;>&nbsp;
				<a href=""><c:out value="${thing.name }"/></a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<img src="/photo_upload/thing/${shopone.file1 }" alt="" style="width: 400px;height: 400px;">
			</div>
			<div class="col-md-4">
				<div class="container" style="height: 100%;">
					<div class="row" style="font-size: 11pt;border-bottom: 1px solid #e4e4e4;">${shopone.title }						
					</div>
					<div class="row" style="margin-top: 10px;">
						<button type="button" class="btn btn-default btn-sm" >
          					<span class="glyphicon glyphicon-thumbs-up"></span>LIKE ${shopone.goodCount }
        				</button>
					</div>
					<div class="row" style="margin-top: 10px;">
						<div class="com-sm-2" style="width: 30%;float: left">제조사</div>
						<div class="com-sm-2" style="width: 70%;float: left">${thing.company }</div>						
					</div>
					<div class="row" style="margin-top: 10px;">
						<div class="com-sm-2" style="width: 30%;float: left">제조국가</div>
						<div class="com-sm-2" style="width: 70%;float: left">${thing.country }</div>
					</div>
					<div class="row" style="margin-top: 10px;">
						<div class="com-sm-2" style="width: 30%;float: left">판매가</div>
						<div class="com-sm-2" style="width: 70%;float: left">
							<fmt:formatNumber type="currency" value="${thing.sellcost }" currencySymbol=""/>원														
						</div>
					</div>
					<div class="row" style="margin-top: 10px;">
						<div class="com-sm-2" style="width: 30%;float: left">배송지역</div>
						<div class="com-sm-2" style="width: 70%;float: left">국내배송</div>
					</div>
					<div class="row" style="margin-top: 10px;border-bottom: 1px solid #e4e4e4;height: 20px;"></div>
					<c:if test="${fn:length(smore) > 0 }">
						<div class="row" style="margin-top: 10px;">
							<div class="com-sm-2" style="width: 30%;float: left;line-height: 40px;">
								<label>추가상품</label>
							</div>
							<div class="com-sm-2" style="width: 70%;float: left;">
								<select class="form-control" style="font-size: 9pt;" id="shopmorething">
									<option value="0">추가로 구매 가능한 상품</option>
									<c:forEach items="${smore }" var="mlist">
										<option value="${mlist.tno }">${mlist.name } / 재고(${mlist.stock }개)</option>										
									</c:forEach>
								</select>
							</div>
						</div>	
					</c:if>
					<form id="frmbuy">
					<div class="row" style="margin-top: 5px;" id="shopThing">
					<div class="col-md-4" style="width: 100%;margin: 0 0 0 0;padding: 0 0 0 0;">
						<div class="com-sm-2" style="width: 54%;float: left;line-height: 25px;">${shopone.title }</div>
						<div class="com-sm-2" style="width: 20%;float: left;">
							<div style="float:left;width: 50px;">
								<input type="number" value="1" max="${thing.stock }" style="width: 100%;height: 25px;" 
								readonly="readonly"id="ordernum${thing.tno }" class="form-control" name="orderStock">
							</div>
							<div style="float:left;">
								<a href="#" onclick="oderCount('up',${thing.tno})">
									<span class="glyphicon glyphicon-collapse-up" style="display: block;"></span>
								</a>
								<a href="#" onclick="oderCount('down',${thing.tno})">
									<span class="glyphicon glyphicon-collapse-down" style="display: block;"></span>
								</a>
							</div>							
						</div>
						<div class="com-sm-2" style="width: 26%;float: left;text-align: right;line-height: 25px;" id="totalcost${thing.tno }">							
							<fmt:formatNumber type="currency" value="${thing.sellcost }" currencySymbol=""/>원
							<input type="hidden" id="hcost" class="hcost${thing.tno }" value="${thing.sellcost }">
							<input type="hidden" value="${thing.tno }" id="tno" name='tno'>
							<input type="hidden" id="cost${thing.tno }" name="cost${thing.tno }" value="${thing.sellcost }">
							<input type="hidden" name="sno" value="${shopone.sno }">
						</div>
					</div>				
					</div>
					</form>
					<div class="row" style="margin-top: 10px;border-bottom: 1px solid #e4e4e4;height: 20px;"></div>
					<div class="row" style="margin-top: 20px;">
						<div class="com-sm-2" style="float:left;width: 30%;"><label>총 상품금액</label></div>
						<div class="com-sm-2" style="float: left;width:70%;font-weight: bold;text-align: right;" id="lasttotalcost"></div>
					</div>					
					<div class="row" style="margin-top: 20px;">
						<button class="button" id="buynow">B U Y N O W</button>					
					</div>
				</div>
				
			</div>
		</div>
	</div>
	</section>
	<section>
		<div class="row" style="border-top: 1px solid #e4e4e4">
			<div class="container">
				<div class="col-md-12">
					<div id="shopContemt">${shopone.content }</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
