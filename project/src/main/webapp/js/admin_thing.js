function check(){
	if($("#ctgroup").val()==null || $("#ctgroup").val()==""){
		alert("등록하실 카테고리 그룹을 선택하셔야합니다.");
		$("#ctgroup").focus();
		return false;
	}
	if($("#name").val()==null || $("#title").val()==""){
		alert("이름을 입력하십시오.");
		$("#title").focus();
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
	if($("#buycost").val()==null || $("#buycost").val()==""){
		alert("구입 가격을 입력하셔야  합니다.");
		$("#buycost").focus();
		return false;
	}
	if($.isNumeric($("#buycost").val())==false){
		alert("숫자만 입력가능합니다.");
		$("#buycost").focus();
		return false;
	}
	if($("#buycost").val()<=0){
		alert("0원을 기입하실 순 없습니다.");
		$("#buycost").focus();
		return false;
	}
	
	if($("#sellcost").val()==null || $("#sellcost").val()==""){
		alert("구입 가격을 입력하셔야  합니다.");
		$("#sellcost").focus();
		return false;
	}
	if($.isNumeric($("#sellcost").val())==false){
		alert("숫자만 입력가능합니다.");
		$("#sellcost").focus();
		return false;
	}
	if($("#sellcost").val()<=0){
		alert("0원을 기입하실 순 없습니다.");
		$("#sellcost").focus();
		return false;
	}
	
	if($("#frm").attr("action")=="./Thing/Modify"){
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
function deleteItem(tno, page, perPageNum, url){
	if(confirm("정말 삭제하시겠습니까?")==true){
		location.href='http://happyrecipek.iptime.org:9090/administrator/Thing/Delete?tno='+tno+"&page="+page+"&perPageNum="+perPageNum
		+"&url="+url;
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
	var url="/administrator/Thing/Modify?tno="+tno;
	$.getJSON(url,function(data){
		$(data).each(function(){
			$("#tno").val(this.tno);
			$("#tno").attr("name","tno");
			$("#name").val(this.name);
			$("#stock").val(this.stock);
			$("#company").val(this.company);
			$("#country").val(this.country);
			$("#buycost").val(this.buycost);
			$("#sellcost").val(this.sellcost);
			
			$("select[id='ctgroup'] option[value='"+this.ctgroup+"']").eq(0).attr("selected","selected");
			var ctgroup=$("select[id='ctgroup'] option:selected").eq(0).val();
			getCategoryList(ctgroup);
			$("select[id='categorylist'] option[value='"+this.category+"']").eq(0).attr("selected","selected");
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