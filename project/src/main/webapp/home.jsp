<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<!--[if ite ie 10]>
<script>
	alert("익스플로러에서 정상작동하지 않을 수 있습니다.");
</script>
<![endif]-->
<!--[if ite ie 11]>
<p class="chromeframe" style="background-color: rgb(255, 255, 255);">익스플로러 환경에서 정상작동하지 않을 수 있습니다. Chrome를 사용하세요.</p>
<![endif]-->
<meta charset="UTF-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Happy Recipe K</title>
</head>
<body>
  <jsp:include page="./menu/top.jsp" flush='false' />
  <section class="body-sec">
    <div class="container">
      <div class="row">
        <div class="col-md-8">
          <c:forEach items="${cookIndex }" var="cookIndex">
            <c:if test="${cookIndex.strong ne 'Y'.charAt(0) && cookIndex.display ne 'N'.charAt(0) }">
              <div class="col-sm-5">
                <div class="card">
                  <a href="./cook/read?cno=${cookIndex.cno }"><img src="/photo_upload/cook/${cookIndex.thumb }" ></a>
                  <div class="container">
                    <h4>
                      <a href="./cook/read?cno=${cookIndex.cno }">${cookIndex.title }</a>
                    </h4>
                  </div>
                </div>
              </div>
            </c:if>
          </c:forEach>
        </div>
        <div class="col-md-4">
          <div id="carousel-example-generic" class="carousel slide">
            <ol class="carousel-indicators">
            <c:forEach items="${thingStrong }" var="TStrong">
              <li data-target="#carousel-example-generic"
                data-slide-to="${TStrong.r -1 }" <c:out value="${TStrong.r -1 eq '0' ? 'class=active':'' }"/>>
            </c:forEach>
            </ol>

            <div class="carousel-inner">
              <c:forEach items="${thingStrong }" var="sVO">
                <c:if test="${sVO.r eq '1'}">
                  <div class="item active">
                    <div class="card">
                      <img alt="" src="/photo_upload/thing/${sVO.thumb }"
                        style="width: 100%; height: 350px;">
                      <div class="container" style="background-color: #EBEBEB">
                        <h4>${sVO.name }</h4>
                      </div>
                    </div>
                  </div>
                </c:if>
                <c:if test="${sVO.r ne '1'}">
                  <div class="item">
                    <div class="card">
                      <img alt=""
                        src="/photo_upload/thing/${sVO.thumb }"
                        style="width: 100%; height: 350px;">
                      <div class="container"
                        style="background-color: #EBEBEB">
                        <h4>${sVO.name }</h4>
                      </div>
                    </div>
                  </div>
                </c:if>
              </c:forEach>
            </div>
          </div>
        </div>

        <div class="col-sm-3">
          <div id="myCarousel" class="carousel slide media"
            data-ride="carousel"
            style="width: 360px; height: 200px; margin: auto;">
            <ol class="carousel-indicators">
            <c:forEach items="${event }" var="eventVO">
                <li data-target="#myCarousel" data-slide-to="${eventVO.r -1 }"
                <c:out value="${eventVO.r-1 eq '0' ? 'class=active':'' }" /> >              
             </c:forEach>
            </ol>
            <div class="carousel-inner">
              <c:forEach items="${event }" var="eventVO">
                <c:if test="${eventVO.r eq '1' }">
                  <div class="item active">
                    <c:if test="${eventVO.quit eq 'Y'.charAt(0) }">
                      <div class="col-sm-3"
                        style="width: 150px; height: 150px; z-index: 3; position: absolute; background-image: url('/photo_upload/event/closed.png'); left: 210px; top: 20px;"></div>
                    </c:if>
                    <div class="card">
                      <a href="#"><img alt="${eventVO.title }"
                        src="/photo_upload/event/${eventVO.thumb2 }"
                        style="width: 375px; height: 170px;"></a>
                      <div class="container">
                        <c:if test="${!empty eventVO.startday}">
                  시작일 : ${eventVO.startday } / 종료일 : ${eventVO.endday }
                  </c:if>
                      </div>
                    </div>
                  </div>
                </c:if>
                <c:if test="${eventVO.r ne '1' }">
                  <div class="item">
                    <c:if test="${eventVO.quit eq 'Y'.charAt(0) }">
                      <div class="col-sm-3"
                        style="width: 150px; height: 150px; z-index: 3; position: absolute; background-image: url('/photo_upload/event/closed.png'); left: 210px; top: 20px;"></div>
                    </c:if>
                    <div class="card">
                      <a href="#"><img alt=""
                        src="/photo_upload/event/${eventVO.thumb2 }"
                        style="width: 375px; height: 170px;"></a>
                      <div class="container">
                        <c:if test="${!empty eventVO.startday}">
                  시작일 : ${eventVO.startday } / 종료일 : ${eventVO.endday }
                  </c:if>
                      </div>
                    </div>
                  </div>
                </c:if>
              </c:forEach>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>
  <section class="event-sec">
    <div class="container">
      <div class="row">
        <div class="col-md-12"></div>
      </div>
    </div>
  </section>
  <section class="shop-sec">
  	<div class="container">
  		<div class="row">
  			<div class="col-md-12">
  				<c:forEach items="${shop }" var="shList">
  				<c:if test="${shList.display eq 'Y'.charAt(0) }">
  					<div class="col-md-4" style="float: left;">  					
  						<div class="card">
  							<a href="./shop/read?sno=${shList.sno}"><img src="/photo_upload/thing/${shList.file1 }" style="width: 100%; height: 350px;"></a>
  							<div class="container">  								
  								<div class="row">  								
  								<div class="col-md-4" style="border-bottom: 1px solid #e4e4e4; width: 100%;height: 30px;line-height: 30px;
  								text-align: left;padding: 0 0 0 0;margin: 0 0 0 0">
  									${shList.title }
  								</div>  									
  								</div>
  								<div class="row" style="height:30px; line-height: 30px;">
  								<div class="col-md-4" style="width: 100%;height: 30px;line-height: 30px;
  								text-align: left;padding: 0 0 0 0;margin: 0 0 0 0">
  									<fmt:formatNumber type="currency" value="${shList.cost}" currencySymbol=""/>원  									
  								</div> 									  									  								
  								</div>  								
  							</div>		
  						</div>  					
  					</div>
  					</c:if>
  				</c:forEach>
  			</div>
  		</div>
  	</div>
  </section>
  <jsp:include page="./menu/bottom.jsp" flush='false' />
</body>
</html>