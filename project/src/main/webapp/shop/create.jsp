<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

		<div class="container" style="width: 100%;">
		<div class="row">			
					<label for="categorygroup">CATEGORY GROUP:</label> 
					<select class="form-control" name="ctgroup" id="ctgroup">
						
					</select>
					<div class="form-group">
						<label for="category">CATEGORY: </label> <select name="category"
							class="form-control" id="categorylist">
						</select>
					</div>
					<div class="form-group">
						<label for="category">THING LIST: </label> <select name="tno"
							class="form-control" id="thinglist">
						</select>
					</div>
					<div class="form-group">
						<label for="writer">WRITER : </label><input type="text"
							value="${sessionScope.id }" name="writer" readonly="readonly"
							class="form-control">
					</div>
					<div class="form-group">
						<label for="title">TITLE :</label> <input type="text" name="title"
							placeholder="Enter Title" class="form-control" id="title">
					</div>
					<div class="form-group">
						<label for="content">CONTENT :</label>
						<textarea name="content" id="content5" class="form-control"
							rows="20"></textarea>
					</div>
					<div class="form-group">
						<label for="file">COVER IMAGE :</label>
						<div id="coverimage"></div>
						<input type="hidden" name="file1" id="file1">
					</div>
					<div class="form-group">
						<div id="cal5Container">
							<script type="text/javascript" src="../js/calendar.js"></script>
						</div>
					</div>					
					<div class="form-group">
						<div id="dates">
							<p>
								<label for="startday">STARTDAY:</label> <input type="text"
									name="startday" id="shop_in" class="form-control"
									readonly="readonly">
							</p>
							<p>
								<label for="endday">ENDDAY:</label> <input type="text"
									name="endday" id="shop_out" class="form-control" readonly="readonly">
							</p>
						</div>
					</div>
					<div class="form-group">
						<label>COST</label> <input type="text" name="cost" class="form-control" id="shopcost" readonly="readonly">
					</div>	
					<div class="form-group">
						<label>SALE COST</label> <input type="text" name="salecost"
							class="form-control">
					</div>
					<div class="form-group">
						<label>STOCK</label> <input type="text" name="stock" class="form-control" readonly="readonly" id="shopstock">
					</div>
					<label for="categorygroup">ADD OPTION:</label> 
					<select class="form-control" name="ctgroup" id="ctgroup">
						<c:forEach items="${ctgroup }" var="ctList">
							<option value="${ctList.ctgroup }">${ctList.name }</option>
						</c:forEach>
					</select>
					<div class="form-group">
						<label for="category">CATEGORY: </label> <select class="form-control" id="categorylist">
						</select>
					</div>	
					<div class="form-group">
						<label for="category">THING LIST: </label> <select name="category2"
							class="form-control" id="thinglist" multiple="multiple">
						</select>
					</div>				
				<div class="form-group">
					<label for="strong" style="display: inline;">STRONG : 
					<input type="checkbox" name="strong" value='Y' class="checkbox"	style="display: inline;"></label> 
					<label for="close" style="display: inline;">CLOSE : <input type="checkbox" name="closed" value='Y' class="checkbox" style="display: inline;">
					</label>
					<label for="delete" style="display: inline;">DELETE : 
					<input type="checkbox" name="deleted" value='Y' class="checkbox" style="display: inline;"></label>
					<label for="display"	style="display: inline;">DISPLAY : 
					<input type="checkbox" name="display" value='Y' class="checkbox" style="display: inline;"></label> 
					<label for="sale"	style="display: inline;">SALE : 
					<input type="checkbox" name="sale" value='Y' class="checkbox" style="display: inline;"></label>
				</div>
		</div>
		</div>