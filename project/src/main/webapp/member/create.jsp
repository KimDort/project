<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript"
  src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>

</script>

</head>
<!-- ----------------------------------------- -->
<body>
  <form action="./create" method="post" name="form">
    name:<input type="text" name="id1">@ <select name="id2">
      <option value="gmail.com">gmail.com</option>
      <option value="hanmail.net">hanmail.net</option>
      <option value="yahoo.com">yahoo.com</option>
      <option value="gmail.com">gmail.com</option>
      <option value="gmail.com">gmail.com</option>
      <option value="gmail.com">gmail.com</option>
    </select><input type="button" value="중복확인"><br /> 
    PASS:<input type="password" name="password"><br /> 
    PASSCONFIRM:<input type="password" name="password1"><br /> 
    NAME:<input type="text" name="name"><br /> 
    NICKNAME:<input type="text" name="nickname">
    <br /> PHONE:<select name="phone1">
      <option value="010">010</option>
      <option value="011">011</option>
      <option value="012">012</option>
      <option value="013">013</option>
      <option value="014">014</option>
      <option value="017">017</option>
      <option value="018">018</option>
      <option value="019">019</option>
      <option value="090">019</option>
    </select>-<input type="text" name="phone2" maxlength="4">-<input type="text" name="phone3" maxlength="4"><br /> 
    <input type="file" name="photo"><br />
    ZIPCODE:<input type="text" name="zipcode"><br> 
    ADDRESS:<input type="text" name="address1"><br> 
    ADDRESS:<input type="text" name="address2"><br> 
      <input type="submit" value="가입" ><input type="reset" value="취소">
      <input type="button" value="메인" onclick="location.href='http://localhost:9090/'">
  </form>
</body>
<!-- -------------------------------------------- -->
</html>
