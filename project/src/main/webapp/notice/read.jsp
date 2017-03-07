<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<script>
$(document).ready(function() {
  var form=$("#form");
  $("#list").on("click",function(){
    form.attr("method", "get");
    form.attr("action", "/notice/list");
    form.submit();
  });
});
</script>


</head> 
<!-- ----------------------------------------- -->
<body>
<form action="modify" method="post" id="form">
  <input type="hidden" value="${noticeVO.nno }" name="nno">
  <input type="hidden" value="${cri.page}" name="page">
  <input type="hidden" value="${cri.perPageNum}" name="perPageNum">
</form>
</body>
<table border="1">
  <tr>
    <th>TITLE</th><td>${noticeVO.title }</td><th>WRITER</th><td>${noticeVO.writer }</td>
  </tr>
  <tr>
    <th>CONTENT</th><td colspan="3">${noticeVO.content }</td>
  </tr>
  <tr>
    <th>REGDATE</th><td colspan="3">
      <fmt:parseDate value="${noticeVO.regdate }" var="noticeDate" pattern="yyyy-MM-dd "/>
       <fmt:formatDate value="${noticeDate }" pattern="yy/MM/dd"/>
    </td>
  </tr>
  <tr>
    <td colspan="5">
      <input type="button" id="list"  value="LIST">
      <input type="button" value="BACK" onclick="history.go(-1)">
     </td>
  </tr>
</table>
<!-- -------------------------------------------- -->
</html> 
