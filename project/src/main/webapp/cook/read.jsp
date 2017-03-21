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
#joinclass:hover{
	background: #e4e4e4;
	color: #ffffff;
}
</style>

<script>
$("#joinclass").on("click",function(){
	var frmdata=$("#frmbuy");
	frmdata.attr("action", "./cookjoin");
	frmdata.attr("method","POST");
	frmdata.submit();
	//frmdata.submit();
});
</script>
</head> 
<!-- ----------------------------------------- -->
<body>
	<jsp:include page="../menu/top.jsp" flush='false' />
	<section class="body-sec">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<img src="/photo_upload/cook/${cook.file1 }" alt="" style="width: 400px;height: 400px;">
			</div>
			<div class="col-md-4">
				<div class="container" style="height: 100%;font-size: 10pt;">
					<div class="row" style="border-bottom: 1px solid #e4e4e4; margin-top:10px;" ><h4>${cook.title }</h4>						
					</div>
					<div class="row" style="border-bottom: 1px solid #e4e4e4; margin-top:10px;">최소인원 : ${cook.minmember }정원${cook.maxmember }						
					</div>
					<div class="row" style="border-bottom: 1px solid #e4e4e4; margin-top:10px;">정원 : ${cook.maxmember }						
					</div>
					<div class="row" style="border-bottom: 1px solid #e4e4e4; margin-top:10px;">등록인원 : ${cook.joinmember }						
					</div>
					<div class="row" style="border-bottom: 1px solid #e4e4e4; margin-top:10px;height: 20px;">
						준비물 : ${cook.someready }												
					</div>
					<div class="row" style="border-bottom: 1px solid #e4e4e4;margin-top:10px;">
						장소 : 서울특별시 OO구 OO로
					</div>					
					<div class="row" style="margin-top: 10px;border-bottom: 1px solid #e4e4e4;">
						<div class="col-md-4" style="margin: 0 0 0 0; padding: 0 0 0 0; width: 100%;height: 250px;" id="map"></div>
						<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=32526e509d185abfe4785d0f82859c90"></script>
						<script>
							var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
							var options = { //지도를 생성할 때 필요한 기본 옵션
								center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
								level: 3 //지도의 레벨(확대, 축소 정도)
							};

							var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
						</script>
					</div>
					<div class="row" style="margin-top: 20px;">
						<div class="col-md-4" style="margin: 0 0 0 0; padding: 0 0 0 0; width: 100%;">
							<table style="width: 100%;">
								<tr style="border-bottom: 1px solid #e4e4e4;" height="30px;">
									<th colspan="2">쿠킹클래스내 상품목록</th>
								</tr>
								<c:forEach items="${shopmore }" var="list">
									<tr style="border-bottom: 1px solid #e4e4e4;">
										<td><img src="/photo_upload/thing/${list.file1 }" alt="" style="width: 70px;height: 70px;"></td>
										<td><a href="/shop/read?sno=${list.sno }">${list.title }</a></td>
									</tr>
								</c:forEach>								
							</table>							
							
						</div>
					</div>					
					<div class="row" style="margin-top: 20px;">
						<div class="com-sm-2" style="float:left;width: 30%;"><label>참가비</label></div>
						<div class="com-sm-2" style="float: left;width:70%;font-weight: bold;text-align: right;" id="lasttotalcost">
							<fmt:formatNumber type="currency" value="${cook.cost }" currencySymbol=""/>원	
						</div>
					</div>					
					<div class="row" style="margin-top: 20px;">
						<button class="button" id="joinclass">J O I N C L A S S</button>					
					</div>
				</div>
				
			</div>
		</div>
	</div>
	</section>
	<section>
		<div class="row" style="border-top: 1px solid #e4e4e4">
			<div class="container">
				<div class="col-md-12" style="margin: 0 0 0 0; padding: 0 0 0 0;">
					<div id="cookContemt">${cook.content }</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
