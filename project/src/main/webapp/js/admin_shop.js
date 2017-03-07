function check(){
	if($("#name").val()==null || $("#title").val()==""){
		alert("이름을 입력하십시오.");
		$("#title").focus();
		return false;
	}
	if($("#salecost").val()=="" || $("#salecost").val()==null){
		$("#salecost").val("0");
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
function getAjax(tno){	
	var url="/administrator/Shop/Modify?sno="+sno;
	$.getJSON(url,function(data){
		$(data).each(function(){
			$("#sno").val(this.sno);
			$("#sno").attr("name","sno");
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
		});
	});
	$("#frm").attr("action","./Thing/Modify");
}
//사이드 메뉴 설정
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}