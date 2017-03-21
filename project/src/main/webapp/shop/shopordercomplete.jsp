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
#orderinfo th {
	text-align: center;
}
#orderinfo td{
	line-height: 80px;
}
.wrap-img:hover img{
	transform:scale(1.2);
	-webkit-transform:scale(1.2);
	-moz-transform:scale(1.2);
	-o-transform:scale(1.2);
	-webkit-transition:.3s;
	-ms-transition:.3s;
}
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
	background: #000000;
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
			<font size="4pt">ORDER INFO</font>
				<div class="col-md-12" style="margin: 0 0 0 0; padding: 0 0 0 0">
					<table class="table" style="width: 100%;">
						<thead>
							<tr>
								<th>구매자</th>
								<th>구매날짜</th>
							</tr>
						</thead>	
						<tbody>
							<tr>
								<td>
									${userinfo.id }/${userinfo.name }
								</td>
								<td>
									${orderList.orderdate }
								</td>
							</tr>
						</tbody>					
					</table>	
				</div>	
			</div>
			<div class="row">
			<font size="4pt">ORDER LIST</font>
			</div>
			<div class="row">
			<div class="col-md-12" style="margin: 0 0 0 0; padding: 0 0 0 0">
				<table class="table" style="width: 100%;">
				<thead>
					<tr bgcolor="#e4e4e4" style="height: 50px;">
						<th style="text-align: center;width: 60px;line-height: 50px;">주문번호</th>
						<th style="text-align: center;width: 80px;line-height: 50px;">주문일자</th>
						<th style="text-align: center;width: 120px;line-height: 50px;">상품</th>
						<th style="text-align: center;line-height: 50px;">상품정보</th>
						<th style="text-align: center;line-height: 50px;">상품가격</th>
						<th style="text-align: center;width: 150px;line-height: 50px;">주문자</th>
						<th style="text-align: center;width: 80px;line-height: 50px;">처리상태</th>
						<th style="text-align: center;width: 150px;line-height: 50px;">
							<input type="checkbox">							
							취소
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${order }" var="list">						
						<tr>
							<td style="line-height: 80px;">${list.ordernum }</td>
							<td style="line-height: 80px;">
								${list.orderdate }
							</td>
							<td style="line-height: 40px;">		
							<c:forEach items="${thing }" var="tlist">							
							<c:if test="${list.tno eq tlist.tno }">							
								<div class="container" style="width: 120px;">
									<div class="row">
										<img src="/photo_upload/thing/${tlist.thumb }" alt="" style="width: 80px;height: 80px;">									
									</div>
								</div>
							</c:if>
							</c:forEach>
							</td>
							<td style="line-height: 80px;">
							<c:forEach items="${thing }" var="tlist">							
							<c:if test="${list.tno eq tlist.tno }">
								${shop.title } / ${tlist.name }
							</c:if>
							</c:forEach>	
							</td>
							<td style="line-height: 80px;">
								<c:forEach items="${thing }" var="tlist">							
								<c:if test="${list.tno eq tlist.tno }">
									<fmt:formatNumber type="currency" value="${list.totalcost }" currencySymbol=""/>원
									<input type="hidden" value="${list.totalcost }" id="sumcost">
								</c:if>
							</c:forEach>
							</td>
							<td style="line-height: 80px;">${user.id}/${user.name }</td>
							<td style="line-height: 80px;">
								<c:if test="${list.processing eq 'C'.charAt(0) }">
									입금확인중
								</c:if>
							</td>
							<td style="line-height: 80px;">
								<input type="checkbox" name="cancel">
								<input type="button" class="btn btn-default" value="주문취소">								
							</td>
						</tr>						
					</c:forEach>
					</tbody>
					<tfoot >
						<tr>
						<td>
							<input type="button"class="btn btn-default" value="HOME" onclick="location.href='http://localhost:9090'">
						</td>
						<td colspan="3" align="right"></td>
						<th>총 결제금액 : </th>
						<th>
							<div id="totalcost" style="width: 100%;"></div>
						</th>
						<td></td>			
						<td><input type="checkbox"><input type="button" class="btn btn-default" value="선택주문취소"></td>				
						</tr>
					</tfoot>
				</table>
			</div>
			</div>
		</div>
	</section>
	<section>
	</section>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
