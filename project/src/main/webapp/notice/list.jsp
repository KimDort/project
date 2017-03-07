<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
$(function(){

});
</script>


</head> 
<!-- ----------------------------------------- -->
<body>
<table border="1">
  <tr>
    <th>NO</th><th>TITLE</th><th>WRITER</th><th>REGDATE</th><th>READCOUNT</th>
  </tr>
  <c:forEach items="${list }" var="noticeVO">
    <tr>
      <td>${noticeVO.nno }</td>
      <td>
        <a href="./read${pageMaker.makeQuery(pageMaker.cri.page) }&nno=${noticeVO.nno}">
          ${noticeVO.title }
        </a>
       </td>
      <td>${noticeVO.writer }</td>
      <td>
        <fmt:parseDate value="${noticeVO.regdate }" var="noticeDate" pattern="yyyy-MM-dd "/>
         <fmt:formatDate value="${noticeDate }" pattern="yy/MM/dd"/>
      </td>
      <td>${noticeVO.readcount }</td>
    </tr>
  </c:forEach>
</table>
<div>
  <table border="1">
  <tr>
    <c:if test="${pageMaker.prev }">
      <td><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></td>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
    <td><a href="list${pageMaker.makeQuery(idx)}">${idx }</a></td>
      
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
      <td><a href="list${pageMaker.makeQuery(pageMaker.endPage+1) }">&raquo;</a></td>
    </c:if>
    </tr>
  </table>
</div>
</body>
<!-- -------------------------------------------- -->
</html> 
