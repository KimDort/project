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
<script>
	function odersend(method){
		var formdate=$("#oderComplte");
		if(method=='card'){
			formdate.append("<input type='hidden' name='method' value='C'>");
			formdate.submit();
		}
		if(method='send'){
			formdate.append("<input type='hidden' name='method' value='S'>");
			formdate.submit();
		}
	}
</script>
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
	<form id="oderComplte" action="./shopordercomplete" method="post">
	<div class="container">
		<div class="row">
			<font size="4pt">ORDER SHEET</font>
		</div>
		<div class="row" style="margin-top:10px;">
			<div class="col-md-12" style="border: 1px solid #bbbbbb;height: 100px;background: #f0f0f0;padding: 0 0 0 0;">
				<div style="width: 100px;height:80px;border-right:1px solid #bbbbbb;margin-top: 10px;
				text-align: center;line-height: 80px;color: #aaaaaa;float: left;">USER INFO</div>
				<div style="width:85%;height: 80px; float: left;margin-left: 20px;margin-top: 10px;color: #aaaaaa">
					<font color="#555555"><b>${mInfo.name }</b></font>님의 정보 및 혜택<br>
					결제금액의 1%씩 적립되며 50,000이상 결제시 배송비는 무료입니다.
					<div style="width: 100%;border-top: 1px solid #bbbbbb;float: left;margin-top: 20px;line-height: 30px;">
						POINT : <font color="#555555"><b>${mInfo.point }</b></font> | 
						LEVEL : <font color="#555555"><c:if test="${mInfo.mlevel eq 'N'.charAt(0)}"><b>[NORMAL]</b></c:if></font>
					</div>				
				</div>
			</div>
		</div>
		<div class="row" style="margin-top: 20px;">
			<div class="container">
				<div class="row">
					<font size="4pt">ORDER INFO</font>
				</div>
				<div class="row">
						<table class="table" id="orderinfo">
							<thead>
								<th><input type="checkbox"></th>
								<th>상품</th>
								<th>상품정보</th>
								<th>판매가</th>
								<th>수량</th>
								<th>합계</th>
							</thead>
							<tbody>								
								<c:forEach items="${order}" var="olist">
									<input type="hidden" name="sno" value="${olist.sno }">									
									<input type="hidden" name="mno" value="${mInfo.mno }">								
									<input type="hidden" name="tno" value="${olist.tno}">
									<input type="hidden" value="${olist.sumcost }" id="sumcost">
									<input type="hidden" name="cost" value="${olist.sellcost }">
									<input type="hidden" name="orderstock" value="${olist.quantity }">
									<tr>
										<td width="10px"><input type="checkbox"></td>
										<td width="90px">
											<img src="/photo_upload/thing/${olist.thumb }" alt="" style="width: 80px;height: 80px;">
										</td>
										<td>${olist.name } </td>
										<td width="200px" align="center"><fmt:formatNumber type="currency" value="${olist.sellcost }" currencySymbol=""/>원</td>
										<td width="40px" align="center">${olist.quantity }</td>
										<td width="100px" align="right"><fmt:formatNumber type="currency" value="${olist.sumcost}" currencySymbol=""/>원
											
										</td>
									</tr>
								</c:forEach>
								<tr>
									<td><input type="checkbox"></td>
									<td colspan="1">선택상품</td>
									<td colspan="1"><input type="button" class="btn btn-default" value="삭제하기"></td>																											
									<td colspan="3" style="text-align: right;margin: 0 0 0 0;padding: 0 0 0 0;">
										총구매금액=<div id="totalcost" style="width: 20%;float: right;"></div>
									</td>
								</tr>								
							</tbody>
						</table>
					</div>
					<div class="row">
						<font size="4pt">ADDRESS INFO</font>
					</div>
					<div class="row">
						<table class="table">
							<tr>
								<th width="150px" bgcolor="#e4e4e4">배송지 선택</th><td width="200px;"><input type="radio">회원정보와 동일</td><td><input type="radio">새로운 배송지</td>
							</tr>
							<tr>
								<th bgcolor="#e4e4e4">받으시는 분<font color="red">*</font></th><td colspan="3">
									<input type="text" value="${mInfo.name }" class="form-control" style="width: 100px;">
								</td>
							</tr>
							<tr>
								<th bgcolor="#e4e4e4" style="line-height: 100px;">
									주소<font color="red">*</font>
								</th>
								<td colspan="2">
								<div class="container" style="width: 100%;float: left;">
									<div class="row">
										<input type="text" value="${mInfo.zipcode }" class="form-control" style="width: 100px;display: inline;float: left;" name="zipcode">
										<input type="button" value="주소검색" class="btn btn-default" style="float: left;">
									</div>
									<div class="row">
										<input type="text" value="${mInfo.address1 }" class="form-control" style="width: 400px;" name="address1">
										<input type="text" value="${mInfo.address2 }" class="form-control" style="width: 400px;" name="address2">
									</div>
								</div> 						
								</td>
							</tr>
							<tr>
								<th bgcolor="#e4e4e4">일반전화<font color="red">*</font></th>
								<td colspan="2">
									<input type="hidden" value="${mInfo.phone }" name="phone">
									<c:set value="${mInfo.phone }" var="phone"/>
									<select class="form-control" style="width: 90px;display: inline;" >
										<option value="02" <c:out value="${fn:substring(phone,0,3) eq '02' ? 'selected=selected':''}"/>>02</option>
										<option value="031" <c:out value="${fn:substring(phone,0,3) eq '031' ? 'selected=selected':''}"/>>031
										<option value="032" <c:out value="${fn:substring(phone,0,3) eq '032' ? 'selected=selected':''}"/>>032</option>
										<option value="033" <c:out value="${fn:substring(phone,0,3) eq '033' ? 'selected=selected':''}"/>>033</option>
										<option value="041" <c:out value="${fn:substring(phone,0,3) eq '041' ? 'selected=selected':''}"/>>041</option>
										<option value="042" <c:out value="${fn:substring(phone,0,3) eq '042' ? 'selected=selected':''}"/>>042</option>
										<option value="043" <c:out value="${fn:substring(phone,0,3) eq '043' ? 'selected=selected':''}"/>>043</option>
										<option value="044" <c:out value="${fn:substring(phone,0,3) eq '044' ? 'selected=selected':''}"/>>044</option>
										<option value="051" <c:out value="${fn:substring(phone,0,3) eq '051' ? 'selected=selected':''}"/>>051</option>
										<option value="052" <c:out value="${fn:substring(phone,0,3) eq '052' ? 'selected=selected':''}"/>>052</option>
										<option value="053" <c:out value="${fn:substring(phone,0,3) eq '053' ? 'selected=selected':''}"/>>053</option>
										<option value="054" <c:out value="${fn:substring(phone,0,3) eq '054' ? 'selected=selected':''}"/>>054</option>
										<option value="055" <c:out value="${fn:substring(phone,0,3) eq '055' ? 'selected=selected':''}"/>>055</option>
										<option value="061" <c:out value="${fn:substring(phone,0,3) eq '061' ? 'selected=selected':''}"/>>061</option>
										<option value="062" <c:out value="${fn:substring(phone,0,3) eq '062' ? 'selected=selected':''}"/>>062</option>
										<option value="063" <c:out value="${fn:substring(phone,0,3) eq '063' ? 'selected=selected':''}"/>>063</option>
										<option value="064" <c:out value="${fn:substring(phone,0,3) eq '064' ? 'selected=selected':''}"/>>064</option>
										<option value="0502" <c:out value="${fn:substring(phone,0,3) eq '0502' ? 'selected=selected':''}"/>>0502</option>
										<option value="0503" <c:out value="${fn:substring(phone,0,3) eq '0503' ? 'selected=selected':''}"/>>0503</option>
										<option value="0504" <c:out value="${fn:substring(phone,0,3) eq '0504' ? 'selected=selected':''}"/>>0504</option>
										<option value="0505" <c:out value="${fn:substring(phone,0,3) eq '0505' ? 'selected=selected':''}"/>>0505</option>
										<option value="0506" <c:out value="${fn:substring(phone,0,3) eq '0506' ? 'selected=selected':''}"/>>0506</option>
										<option value="0507" <c:out value="${fn:substring(phone,0,3) eq '0507' ? 'selected=selected':''}"/>>0507</option>
										<option value="070" <c:out value="${fn:substring(phone,0,3) eq '070' ? 'selected=selected':''}"/>>070</option>
										<option value="010" <c:out value="${fn:substring(phone,0,3) eq '010' ? 'selected=selected':''}"/>>010</option>
										<option value="011" <c:out value="${fn:substring(phone,0,3) eq '011' ? 'selected=selected':''}"/>>011</option>
										<option value="016" <c:out value="${fn:substring(phone,0,3) eq '016' ? 'selected=selected':''}"/>>016</option>
										<option value="017" <c:out value="${fn:substring(phone,0,3) eq '017' ? 'selected=selected':''}"/>>017</option>
										<option value="018" <c:out value="${fn:substring(phone,0,3) eq '018' ? 'selected=selected':''}"/>>018</option>
										<option value="019" <c:out value="${fn:substring(phone,0,3) eq '019' ? 'selected=selected':''}"/>>019</option>
									</select>
									-<input type="text" class="form-control" style="width: 70px;display: inline;" maxlength="4" value="${fn:substring(phone,4,8)}">
									-<input type="text" class="form-control" style="width: 70px;display: inline;" maxlength="4" value="${fn:substring(phone,9,13)}">
								</td>
							</tr>
							<tr>
								<th bgcolor="#e4e4e4">이메일<font color="red">*</font></th>
								<td colspan="3">
									<c:set var="email" value="${fn:split(mInfo.id,'@')}"/>
									<input type="text" value="${email[0] }" class="form-control" style="width: 30%;display: inline;">@
									<input type="text" value="${email[1]}" class="form-control" style="width: 30%;display: inline;" id="emailCom" readonly="readonly">
									<select style="display: inline;width: 20%;" class="form-control" id="emailCom2">
										<option value="naver.com" <c:out value="${email[1] eq 'naver.com'?'selected=selected':'' }"/>>naver.com</option>
										<option value="daum.net" <c:out value="${email[1] eq 'daum.net'?'selected=selected':'' }"/>>daum.net</option>
										<option value="nate.com" <c:out value="${email[1] eq 'nate.com'?'selected=selected':'' }"/>>nate.com</option>
										<option value="naver.com" <c:out value="${email[1] eq 'naver.com'?'selected=selected':'' }"/>>naver.com</option>
										<option value="hotmail.com" <c:out value="${email[1] eq 'hotmail.com'?'selected=selected':'' }"/>>hotmail.com</option>
										<option value="yahoo.com" <c:out value="${email[1] eq 'yahoo.com'?'selected=selected':'' }"/>>yahoo.com</option>
										<option value="empas.com" <c:out value="${email[1] eq 'empas.com'?'selected=selected':'' }"/>>empas.com</option>
										<option value="korea.com" <c:out value="${email[1] eq 'korea.com'?'selected=selected':'' }"/>>korea.com</option>
										<option value="dreamwiz.com" <c:out value="${email[1] eq 'dreamwiz.com'?'selected=selected':'' }"/>>dreamwiz.com</option>
										<option value="gmail.com" <c:out value="${email[1] eq 'gmail.com'?'selected=selected':'' }"/>>gmail.com</option>
										<option value="self">직접입력</option>
									</select>
								</td>
							</tr>
						</table>
					</div>
					<div class="row">
						<font size="4pt">EXPECTED PAY</font>
					</div>
					<div class="row">
						<table class="table table-bordered">
							<tr height="50px" bgcolor="#e4e4e4" style="text-align: center;font-size: 10pt;font-weight: bold;">
								<td>총 주문금액</td><td>총 할인 +부가결제금액</td><td>총 결제예정금액</td>
							</tr>
							<tr style="text-align: center;font-size: 10pt;font-weight: bold;">
								<td>
									<div id="totalcost" style="width: 100%;"></div>
								</td>
								<td>0원</td>
								<td><div id="totalcost" style="width: 100%;"></div></td>
							</tr>
						</table>
					</div>
					<div class="row">
						<font size="4pt">PAYMENT METHOD</font>
					</div>
					<div class="row">
					<div class="col-md-12">
						<div class="col-md-8" style="border: 1px solid #e4e4e4;height: 80px;padding-top: 15px;">							
							<a class="btn btn-default btn-lg" onclick="orderMethod('card')">
          						<span class="glyphicon glyphicon-credit-card"></span> Credit Card
        					</a>
        					
        					<a class="btn btn-default btn-lg" onclick="orderMethod('send')">
          						<span class="glyphicon glyphicon-send"></span>Credit Send 
        					</a>
        				</div>
        				<div class="col-md-4" style="border: 1px solid #e4e4e4;height: 282px;padding-top: 15px;" id="credit-card">						
							<div style="width: 100%;text-align: right;"><b>카드결제 </b>최종결제예정금액</div>
								<div id="totalcost" style="width: 100%;text-align: right;font-size: 13pt;font-weight: bold;color:#d31b1f"></div>							
							<div style="padding-top: 20px">
								<input type="button" class="form-control" id="buynow" value="결제하기" onclick="odersend('card')">								
							</div>
						</div>
        				<div class="col-md-8" style="border: 1px solid #e4e4e4;height: 200px;" id="credit-card">
        					<div class="col-md-8" style="margin-top: 10px;">
	        					<span class="glyphicon glyphicon-info-sign"style="color: #d31b1f"></span>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.<br>
    	    					<span class="glyphicon glyphicon-info-sign"style="color: #d31b1f"></span>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.
        					</div>
        				</div>
						
						<div class="col-md-4" style="border: 1px solid #e4e4e4;height: 282px;padding-top: 15px;" id="credit-send">
							<div style="width: 100%;text-align: right;"><b>무통장입금 </b>최종결제예정금액</div>
								<div id="totalcost" style="width: 100%;text-align: right;font-size: 13pt;font-weight: bold;color:#d31b1f"></div>							
							<div style="padding-top: 20px">
								<input type="button" class="form-control" id="buynow" value="결제하기" onclick="odersend('send')">								
							</div>
						</div>
						<div class="col-md-8" style="border: 1px solid #e4e4e4;height: 200px;" id="credit-send">
        					<div class="col-md-8" style="margin-top: 10px;">
	        					<label>입금자명</label><input type="text" class="form-control" name="bankname"><br>
    	    					<label>입금은행</label>
    	    						<select class="form-control" name="bank">
    	    							<option>:::입금은행 선택:::</option>
    	    							<option value="농협">농협 000-00-000000</option>
    	    							<option value="우리">우리 000-00-000000</option>
    	    							<option value="국민">국민 000-00-000000</option>
    	    							<option value="신환">신환 000-00-000000</option>
    	    						</select>
        					</div>
        				</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
	</section>
	<section>
	</section>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
