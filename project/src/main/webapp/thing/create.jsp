<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<label for="categorygroup">CATEGORY GROUP:</label>
<select class="form-control" name="ctgroup" id="ctgroup">
	<c:forEach items="${ctgroup }" var="ctList">
		<option value="${ctList.ctgroup }">${ctList.name }</option>
	</c:forEach>
</select>
<div class="form-group">
	<label for="category">CATEGORY: </label> <select name="category"
		class="form-control" id="categorylist">
	</select>
</div>
<div class="form-group">
	<label for="title">NAME :</label> <input type="text" name="name"
		placeholder="Enter Title" class="form-control" id="name">
</div>
<div class="form-group">
	<label for="file">COVER IMAGE :</label><input type="file" id="file"
		name="file1MF" class="form-control">
</div>
<div class="form-group">
	<label for="content">STOCK:</label> <input type="number" name="stock"
		class="form-control" id="stock">
</div>
<div class="form-group">
	<label for="content">BUY COST :</label> <input type="number"
		name="buycost" class="form-control" id="buycost">
</div>
<div class="form-group">
	<label for="content">SELL COST :</label> <input type="number"
		name="sellcost" class="form-control" id="sellcost">
</div>
<div class="form-group">
	<label for="strong" style="display: inline;">STRONG : <input
		type="checkbox" name="strong" value='Y' class="checkbox"
		style="display: inline;"></label> <label for="close"
		style="display: inline;">CLOSE : <input type="checkbox"
		name="closed" value='Y' class="checkbox" style="display: inline;"></label>
	<label for="delete" style="display: inline;">DELETE : <input
		type="checkbox" name="deleted" value='Y' class="checkbox"
		style="display: inline;"></label> <label for="delete"
		style="display: inline;">SALE : <input type="checkbox"
		name="sale" value='Y' class="checkbox" style="display: inline;"></label>
</div>