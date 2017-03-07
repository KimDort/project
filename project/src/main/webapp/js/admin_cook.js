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
	if($("#salecost").val()=="" || $("#salecost").val()==null){
		$("#salecost").val("0");
	}
	if($("#file").val()!=""){
		var ext = $('#file').val().split('.').pop().toLowerCase();
		if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
			alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
			$("#file").focus();
			return false;
		}
	}
	if($("#cost").val()==null || $("#cost").val()==""){
		alert("가격을 입력하셔야  합니다.");
		$("#cost").focus();
		return false;
	}
	if($("#minmember").val()==null || $("#minmember").val()==""){
		alert("최소 인원을 정하셔야합니다.");
		$("#minmember").focus();	
		return false;
	}
	if($("#maxmember").val()==null || $("#maxmember").val()==""){
		alert("최대 인원을 정하셔야합니다.");
		$("#maxmember").focus();
		return false;
	}
	if($.isNumeric($("#cost").val())==false){
		alert("숫자만 입력가능합니다.");
		$("#cost").focus();
		return false;
	}
	if($.isNumeric($("#minmember").val())==false){
		alert("숫자만 입력가능합니다.");
		$("#minmember").focus();
		return false;
	}
	if($.isNumeric($("#maxmember").val())==false){
		alert("숫자만 입력가능합니다.");
		$("#maxmember").focus();
		return false;
	}
	if($.isNumeric($("#salecost").val())==false){
		alert("숫자만 입력가능합니다.");
		$("#salecost").focus();
		return false;
	}
	if($("#salecost").val()>0){
		$("#sale").attr("checked","checked");
	}
	if($("#cost").val()<=0){
		alert("0원을 기입하실 순 없습니다.");
		$("#cost").focus();
		return false;
	}	
	if($("#minmember").val()<=0){
		alert("최소 인원은 1명 이상이어야 합니다.");
		$("#minmember").focus();	
		return false;
	}
	
	if($("#maxmember").val()<=0){
		alert("최대 인원은 1명 이상이어야 하고 최소인원보다 많아야 합니다.");
		$("#maxmember").focus();	
		return false;
	}
	if($("#maxmember").val()<$("#minmember").val()){
		alert("최대 인원은 최소인원보다 작을 수 없습니다.");
		$("#maxmember").focus();
		return false;
	}
	if($("#frm").attr("action")=="./Cook/Modify"){
		if($("#file").val()==""){
			if(confirm("기존의 커버이미지를 사용하시겠습니까?")==true){
				return true;
			}else{
				return false;
			}
		}
	}
	return true;
}
function deleteItem(cno){
	if(confirm("정말 삭제하시겠습니까?")==true){
		location.href='http://happyrecipek.iptime.org:9090/administrator/Cook/Delete?cno='+cno;
	}else{
		return false;
	}
	
}
function closemodal(){
	$("#close").on("click", function(){
		$("form[id='frm']")[0].reset();
	});
}
function getAjax(cno){
	var url="/administrator/Cook/Modify?cno="+cno;
	$.getJSON(url,function(data){
		$(data).each(function(){
			$("#cno").val(this.cno);
			$("#cno").attr("name","cno");
			$("#title").val(this.title);
			CKEDITOR.instances.content.setData(this.content);
			$("#ask_in").val(this.askstart);
			$("#ask_out").val(this.askend);
			$("#in").val(this.startday);
			$("#out").val(this.endday);
			$("#starttime").val(this.starttime);
			$("#endtime").val(this.endtime);
			$("#cost").val(this.cost);
			$("#salecost").val(this.salecost);
			$("#someready").val(this.someready);
			if(this.shopmore.length!=0){
				$("#shopmore").find("option[value=0]").prop("selected",false);
				for(var i=0;i<$("#shopmore option").length;i++){
					$(this.shopmore).each(function(key,value){					
						if($("#shopmore option:eq("+i+")").val()==value.sno){
							$("#shopmore option:eq("+i+")").attr("selected","selected");
						}
					});
				}
			}
			$("#minmember").val(this.minmember);
			$("#maxmember").val(this.maxmember);
			
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
	$("#frm").attr("action","./Cook/Modify");
}
//사이드 메뉴 설정
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}