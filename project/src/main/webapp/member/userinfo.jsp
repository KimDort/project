<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="./css/style.css" rel="Stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>

<script type="text/javascript">
$(function(){

});
</script>


</head> 
<!-- ----------------------------------------- -->
<body>
  <table border="1">
  <tr>
    <th>ID</th><th>NICKNAME</th><th>PHOTO</th><th>PHONE</th>
    <th>ZIPCODE</th><th>ADDRESS1</th><th>ADDRESS2</th>
   </tr>
   <tr>
    <td>${memberVO.id }</td><td>${memberVO.nickname }</td><td>${memberVO.photo }</td>
    <td>${memberVO.phone}</td><td>${memberVO.zipcode }</td>
    <td>${memberVO.address1 }</td><td>${memberVO.address2 }</td>
   </tr>
  </table>
  <input type="button" value="메인" onclick="location.href='http://localhost:9090/'">
</body>
</html> 
