function check(){
	if($("#title").val()==null || $("#title").val()==""){
		alert("제목을 입력하십시오.");
		$("#title").focus();
		return false;
	}
	if(CKEDITOR.instances.content.getData()==""){
		alert("내용을 입력하십시오.");
		CKEDITOR.instances.content.focus();
		return false;
	}
	if($("#cost").val()==null || $("#cost").val()==""){
		alert("가격을 입력하셔야  합니다.");
		$("#cost").focus();
		return false;
	}
	if($.isNumeric($("#cost").val())==false){
		alert("숫자만 입력가능합니다.");
		$("#cost").focus();
		return false;
	}
	if($("#salecost").val()=="" || $("#salecost").val()==null){
		$("#salecost").val("0");
	}
	if($("#salecost").val()>0){
		$("#sale").attr("checked","checked");
	}
	return true;
}
function deleteItem(snonum){
	if(confirm("정말 삭제하시겠습니까?")==true){
		//location.href='http://happyrecipek.iptime.org:9090/administrator/Thing/Delete?tno='+tno;
		$.get("http://happyrecipek.iptime.org:9090/administrator/Shop/Delete",{sno:snonum})
		window.location.reload();
	}else{
		return false;
	}
	
}
function closemodal(){
	$("#close").on("click", function(){
		$("form[id='frm']")[0].reset();
	});
}
//수정을 위해 정보가져오기
function getAjax(sno){	
	var url="/administrator/Shop/Modify?sno="+sno;
	getCategoryList();
	$.getJSON(url,function(data){
		$(data).each(function(){
			$("#sno").val(this.sno);
			$("#sno").attr("name","sno");
			$("#title").val(this.title);
			CKEDITOR.instances.content.setData(this.content);
			$("select[id='ctgroup'] option[value='"+this.ctgroup+"']").eq(0).attr("selected","selected");
			$("select[id='categorylist'] option[value='"+this.category+"']").eq(0).attr("selected","selected");
			getThingList();
			$("select[id='thinglist'] option[value='"+this.tno+"']").attr("selected","selected");
			$("#in").val(this.startday);
			$("#out").val(this.endday);
			$("#starttime").val(this.starttime);
			$("#endtime").val(this.endtime);
			$("#cost").val(this.cost);
			$("#salecost").val(this.salecost);
			
			if(this.shopmore.length!=0){
				$(this.shopmore).each(function(key,value){
					$("select[id='ctgroup'] option[value='"+value.shopmorectgroup+"']").eq(1).attr("selected","selected");
					$("select[id='categorylist'] option[value='"+value.shopmorecategory+"']").eq(1).attr("selected","selected");
					$("#thinglist option[value='"+value.shopmoretno+']').attr("selected","selected");
				});
			}
			
			$("#st_begin").val(this.st_begin);
			$("#st_end").val(this.st_end);
			$("#st_day").val(this.st_day);
			
			$("#clo_begin").val(this.clo_begin);
			$("#clo_end").val(this.clo_end);
			$("#clo_day").val(this.clo_day);
			
			$("#del_begin").val(this.del_begin);
			$("#del_end").val(this.del_end);
			$("#del_day").val(this.del_day);
			
			$("#sale_begin").val(this.sale_begin);
			$("#sale_end").val(this.sale_end);
			$("#sale_day").val(this.sale_day);
			
			if(this.display==true){
				$("#display").attr("checked","checked");
			}else{
				$("#display").attr("checked",false);
			}
			if(this.strong==true){
				$("#strong").attr("checked","checked");
			}else{
				$("#strong").attr("checked",false);
			}
			if(this.closed==true){
				$("#closed").attr("checked","checked");
			}else{
				$("#closed").attr("checked",false);
			}
			if(this.deleted==true){
				$("#deleted").attr("checked","checked");
			}else{
				$("#deleted").attr("checked",false);
			}
			if(this.sale==true){
				$("#sale").attr("checked","checked");
			}else{
				$("#sale").attr("checked",false);
			}
			
		});
	});
	$("#frm").attr("action","./Thing/Modify");
}

function getCategoryList(){
	var ctgroup=$("select[id='ctgroup'] option:selected").val();
	var url="/administrator/Thing/CategoryList/"+ctgroup;
	var totalCategory=$("select[id='categorylist']").length;
		$.getJSON(url, function(data){
			for(var i=0;i<totalCategory;i++){
			$("select[id='categorylist']").eq(i).empty();			
			$(data).each(
					function(){
						$("select[id='categorylist']").eq(i).append("<option value='"+this.ctno+"'>"+this.ctname+"</option>");						
					});
			}
		});
}
function getThingList(){
	var ctgroup=$("select[id='ctgroup'] option:selected").val();
	var ctno=$("select[id='categorylist'] option:selected").val();
	var url="/administrator/Thing/Categorylist?ctgroup="+ctgroup+"&ctno="+ctno;
	$.getJSON(url,function(data){
		$("select[id='thinglist']").eq(0).empty();
		$(data.thingCategoryList).each(function(key, value){			
			$("select[id='thinglist']").eq(0).append("<option value='"+value.tno+"'>"+value.name+"</option>");			
		});
	});
}
//사이드 메뉴 설정
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}