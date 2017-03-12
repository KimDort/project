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
	if($("input[id='file']").val()!=""){
		var ext = $("input[id='file']").val().split('.').pop().toLowerCase();
		if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
			alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
			$("input[id='file']").focus();
			return false;
		}
	}
	if($("#salecost").val()==""){
		alert("세일 가격을 입력하셔야 합니다.");
		$("#salecost").focus();
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
	if($("#frm").attr("action")=="./Event/Modify"){
		if($("input[id='file']").val()==""){
			if(confirm("기존의 커버이미지를 사용하시겠습니까?")==true){
				return true;
			}else{
				return false;
			}
		}
	}
	return true;
}
function deleteItem(eno, page, perPageNum, url){
	if(confirm("정말 삭제하시겠습니까?")==true){
		location.href='http://happyrecipek.iptime.org:9090/administrator/Event/Delete?eno='+eno+"&page="+page+"&perPageNum="+perPageNum
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
function getAjax(eno){
	resetSaleList();
	var url="/administrator/Event/Modify?eno="+eno;
	$.getJSON(url,function(data){
		$(data).each(function(){
			$("#eno").val(this.eno);
			$("#eno").attr("name","eno");
			$("#title").val(this.title);
			CKEDITOR.instances.content.setData(this.content);
			$("#salecost").val(this.salecost);
			/*$("select[id='saleList'] option[value='"+this.cookSale+"']").eq(0).attr("selected",true);
			$("select[id='saleList'] option[value='"+this.shopSale+"']").eq(1).attr("selected",true);*/
			$("#cookSaleList option[value='"+this.cookSale+"']").attr("selected","selected");
			$("#shopSaleList option[value='"+this.shopSale+"']").attr("selected","selected");
			console.log(this.shopSale);
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
			
			$("#banner_begin").val(this.banner_begin);
			$("#banner_end").val(this.banner_end);
			$("#banner_day").val(this.banner_day);
			
			$("#quit_begin").val(this.quit_begin);
			$("#quit_end").val(this.quit_end);
			$("#quit_day").val(this.quit_day);
			
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
			if(this.banner==true){
				$("#banner").attr("checked","checked");
			}else{
				$("#banner").attr("checked",false);
			}
			if(this.quit==true){
				$("#quit").attr("checked","checked");
			}else{
				$("#quit").attr("checked",false);
			}
		});
	});
	$("#frm").attr("action","./Event/Modify");
}

//사이드 메뉴 설정
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}