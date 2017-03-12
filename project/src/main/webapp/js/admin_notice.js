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
	if($("#file").val()!=""){
		var ext = $('#file').val().split('.').pop().toLowerCase();
		if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
			alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
			$("#file").focus();
			return false;
		}
	}
	
	if($("#frm").attr("action")=="./Notice/Modify"){
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
function deleteItem(nno, page, perPageNum){
	if(confirm("정말 삭제하시겠습니까?")==true){
		location.href='http://happyrecipek.iptime.org:9090/administrator/Notice/Delete?eno='+nno+"&page="+page+"&perPageNum="+perPageNum
		+"url=NoticeTable";
	}else{
		return false;
	}
	
}
function closemodal(){
	$("#close").on("click", function(){
		$("form[id='frm']")[0].reset();
	});
}
function getAjax(nno){
	var url="/administrator/Notice/Modify?nno="+nno;
	$.getJSON(url,function(data){
		$(data).each(function(){
			$("#nno").val(this.nno);
			$("#nno").attr("name","nno");
			$("#title").val(this.title);
			CKEDITOR.instances.content.setData(this.content);
			
			
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
		});
	});
	$("#frm").attr("action","./Notice/Modify");
}
//사이드 메뉴 설정
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}