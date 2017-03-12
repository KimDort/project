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
	if($("#frm").attr("action")=="./Member/Modify"){
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
function deleteItem(mno,page,perPageNum){
	if(confirm("정말 삭제하시겠습니까?")==true){
		location.href='http://happyrecipek.iptime.org:9090/administrator/Member/Delete?mno='+mno+"&page="+page+"&perPageNum="+perPageNum
		+"&url=MemberTable";
	}else{
		return false;
	}
	
}
function closemodal(){
	$("#close").on("click", function(){
		$("form[id='frm']")[0].reset();
	});
}
function getAjax(mno){
	var url="/administrator/Member/Modify?mno="+mno;
	$.getJSON(url,function(data){
		$(data).each(function(){
			$("#mno").val(this.mno);
			$("#mno").attr("name","mno");
			$("#name").val(this.name);
			
			if(this.sale==true){
				$("#sale").attr("checked","checked");
			}else{
				$("#sale").attr("checked",false);
			}
		});
	});
	$("#frm").attr("action","./Member/Modify");
}
//사이드 메뉴 설정
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}