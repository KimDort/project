<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="container" style="width: 100%">
	<div class="row">
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
			<textarea name="content" id="content" class="form-control" rows="20"></textarea>
		</div>
		<div class="form-group">
			<label for="file">FILE :</label><input type="file" id="file"
				name="file1MF" class="form-control">
		</div>
		<div class="form-group">
			<div id="cal3Container"></div>
			<div id="dates">
				<p>
					<label for="startday">STARTDAY:</label> <input type="text"
						name="startday" id="note_in" class="form-control"
						readonly="readonly">
				</p>
				<p>
					<label for="endday">ENDDAY:</label> <input type="text"
						name="endday" id="note_out" class="form-control"
						readonly="readonly">
				</p>
			</div>
			<script type="text/javascript" src="../js/calendar.js"></script>
		</div>
		<div class="form-group">
			<label><h4>공지사항 노출 옵션 :</h4></label> <label for="strong"
				style="display: inline;">STRONG : <input type="checkbox"
				name="strong" value='Y' class="checkbox" style="display: inline;"></label>
			<label for="close" style="display: inline;">CLOSE : <input
				type="checkbox" name="closed" value='Y' class="checkbox"
				style="display: inline;"></label> <label for="delete"
				style="display: inline;">DELETE : <input type="checkbox"
				name="deleted" value='Y' class="checkbox" style="display: inline;"></label>
		</div>
	</div>
</div>