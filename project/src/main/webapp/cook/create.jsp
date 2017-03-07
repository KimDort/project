<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

		<div class="container" style="width: 100%;">
			<div class="row">				
					<div class="form-group">
						<label for="writer">WRITER : </label><input type="text"
							value="${sessionScope.MemberVO.id }" name="writer" readonly="readonly"
							class="form-control">
					</div>
					<div class="form-group">
						<label for="title">TITLE :</label> <input type="text" name="title"
							placeholder="Enter Title" class="form-control" id="title">
					</div>
					<div class="form-group">
						<label for="content">CONTENT :</label>
						<textarea name="content" id="content1" class="form-control"
							rows="20"></textarea>
					</div>
					<div class="form-group">
						<label for="file">COVER IMAGE :</label><input type="file" id="file"
							name="file1MF" class="form-control">
					</div>
					<div class="form-group">
						<div id="cal1Container">
							<script type="text/javascript" src="../js/calendar.js"></script>
						</div>
					</div>
					<div class="form-group">
						<div id="dates">
							<p>
								<label for="startday">ASK START:</label> <input type="text"
									name="askstart" id="ask_in" class="form-control"
									readonly="readonly">
							</p>
							<p>
								<label for="endday">AKS END:</label> <input type="text"
									name="askend" id="ask_out" class="form-control" readonly="readonly">
							</p>
						</div>
					</div>
					<div class="form-group">
						<div id="cal2Container"></div>
					</div>
					<div class="form-group">
						<div id="dates">
							<p>
								<label for="startday">STARTDAY:</label> <input type="text"
									name="startday" id="in" class="form-control"
									readonly="readonly">
							</p>
							<p>
								<label for="endday">ENDDAY:</label> <input type="text"
									name="endday" id="out" class="form-control" readonly="readonly">
							</p>
						</div>
					</div>
					<div class="form-group">
							<label for="starttime">START HOUR:</label> <select
								class="form-control" id="sel1" name="stime1" id="starttime">
								<c:forEach begin="1" end="24" var="idx">
									<option value="${idx }">${idx }</option>
								</c:forEach>
							</select> <label>START MINUTE:</label> <select class="form-control"
								id="sel1" name="stime2">
								<c:forEach begin="00" end="60" var="idx">
									<option value="${idx }">${idx }</option>
								</c:forEach>
							</select>
						</div>
						 
						<div class="form-group">
							<label for="endtime">END HOUR:</label> <select
								class="form-control" id="sel1" name="etime1" id="endtime">
								<c:forEach begin="1" end="24" var="idx">
									<option value="${idx }">${idx }</option>
								</c:forEach>
							</select> <label>END MINUTE:</label> <select class="form-control"
								id="sel1" name="etime2" id="endtime">
								<c:forEach begin="00" end="60" var="idx">
									<option value="${idx }">${idx }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>COST</label> <input type="text" name="cost"
								class="form-control">
						</div>
						
						<div class="form-group">
							<label>SALE COST</label> <input type="text" name="salecost"
								class="form-control">
						</div>						
						<div class="form-group">
							<label>SOME READY</label> <input type="text" name="someready"
								class="form-control">
						</div>	
						<div class="form-group">
							<label>CATEGORY GROUP</label>
							<select class="form-control" id="ctgroup"></select>
						</div>							
						<div class="form-group">
							<label>SELL THING</label>
								<select multiple="multiple" name="sellthingnum" id="categorylist" class="form-control" >
									
								</select>							
						</div>
						<div class="form-group">
							<label>Min Member</label> <input type="text" name="minmember"
								class="form-control">
						</div>
						<div class="form-group">
							<label>Max Member</label> <input type="text" name="maxmember"
								class="form-control">
						</div>
			</div> 
					<div class="form-group">
						<label for="strong" style="display: inline;">STRONG : 
						<input	type="checkbox" name="strong" value='Y' class="checkbox" style="display: inline;"></label> 
						<label for="close" style="display: inline;">CLOSE : 
						<input type="checkbox" name="closed" value='Y' class="checkbox" style="display: inline;"></label>
						<label for="delete" style="display: inline;">DELETE : 
						<input type="checkbox" name="deleted" value='Y' class="checkbox" style="display: inline;"></label> 
						<label for="sale"	style="display: inline;">SALE : 
						<input type="checkbox" name="sale" value='Y' class="checkbox" style="display: inline;"></label>
						<label for="display"	style="display: inline;">DISPLAY : 
						<input type="checkbox" name="display" value='Y' class="checkbox" style="display: inline;"></label>
					</div>		
					</div>		