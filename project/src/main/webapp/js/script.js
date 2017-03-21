var modalid;
var costarray=new Array();
function CKupdate(){
    for ( instance in CKEDITOR.instances )
        CKEDITOR.instances[instance].updateElement();
}
//글자 1개당 한글 체크인지 검사하는 메소드
function isKorean(ch) {
	  var charCut;
	  for(var i=0;i<=ch.length;i++){
		  if(i+1<=ch.length){
			  charCut=ch.substr(i,i+1);
			  var numUnicode = charCut.charCodeAt(0);
			  if ( 44032 <= numUnicode && numUnicode <= 55203 || 12593 <= numUnicode && numUnicode <= 12643 ) return true;
		  }
	  }            
	 return false;
}
//쿠킹/이벤트/공지사항/샵/ 테이블 출력
function getAllTableList(name){
	var url="/"+name+"/AllList";
	var str="";
	//alert("getAllList 받을 때 값 : "+name);
	$.getJSON(url,function(data){
		$(data).each(function(){			
			str+="<tr><td>";
			if(name=="cook"){str+=this.cno}if(name=="notice"){str+=this.nno}if(name=="event"){this.eno}
			if(name=="thing"){str+=this.tno}if(name=="shop"){str+=this.sno}
			str+="<input type='hidden' value='";
			if(name=="cook"){str+=this.cno}if(name=="notice"){str+=this.nno}if(name=="event"){this.eno}
			if(name=="shop"){str+=this.sno};
			str+="' id='";
			if(name=="cook"){str+=this.cno}if(name=="notice"){str+=this.nno}if(name=="event"){this.eno}
			if(name=="thing"){str+=this.tno}if(name=="shop"){str+=this.sno}
			str+="'></td><td><b>"+this.title+"</b></td><td>"+this.regdate+"</td>";
			if(name=="cook"){str+="<td>"+this.askstart+"</td><td>"+this.askend+"</td>"}
			str+="<td>"+this.startday+"</td><td>"+this.endday+"</td><td>";
			if(name=="cook"){str+=this.starttime+"</td><td>"+this.endtime+"</td><td>"}
			if(name=="cook"){str+=this.cost}if(name=="shop"){str+=this.cost}
			str+="</td><td>"+this.salecost+"</td><td>";
			if(name=="cook"){str+=this.cost-this.salecost}if(name=="shop"){this.cost-this.salecost}
			str+="</td><td>";
			str+="<select class='form-control' style='width: 60px;' id='"+name+"Strong'>"
				+"<option value='";
				this.strong=='Y'?str+='Y'+"' selected='selected'>"+'Y'+"</option>":str+='Y'+"'>"+'Y'+"</option>"
				+"<option value='";
				this.strong=='N'?str+='N'+"' selected='selected'>"+'N'+"</option>":str+='N'+"'>"+'N'+"</option>";
			str+="</select></td>";
			str+="<td><select class='form-control' style='width: 60px;' id='"+name+"Closed'>"
				+"<option value='";
				this.closed=='Y'?str+='Y'+"' selected='selected'>"+'Y'+"</option>":str+='Y'+"'>"+'Y'+"</option>"
				+"<option value='";
				this.closed=='N'?str+='N'+"' selected='selected'>"+'N'+"</option>":str+='N'+"'>"+'N'+"</option>";
			str+="</select></td>";
			str+="<td><select class='form-control' style='width: 60px;' id='"+name+"Deleted'>"
				+"<option value='";
				this.deleted=='Y'?str+='Y'+"' selected='selected'>"+'Y'+"</option>":str+='Y'+"'>"+'Y'+"</option>"
				+"<option value='";
				this.deleted=='N'?str+='N'+"' selected='selected'>"+'N'+"</option>":str+='N'+"'>"+'N'+"</option>";
			str+="</select></td>";
			if(name=="cook" || name=="shop"){
				str+="<td><select class='form-control' style='width: 60px;' id='"+name+"Sale'>"
					+"<option value='";
				this.sale=='Y'?str+='Y'+"' selected='selected'>"+"Y"+"</option>":str+="Y"+"'>"+"Y"+"</option>"
				+"<option value='";
				this.sale=='N'?str+='N'+"' selected='selected'>"+'N'+"</option>":str+="N"+"'>"+"N"+"</option>";
				str+="</select></td>";
			}
			str+="<td><select class='form-control' style='width: 60px;' id='"+name+"Display'>"
				+"<option value='";
				this.display=='Y'?str+="Y"+"' selected='selected'>"+'Y'+"</option>":str+="Y"+"'>"+"Y"+"</option>"
				+"<option value='";
				this.display=='N'?str+='N'+"' selected='selected'>"+'N'+"</option>":str+='N'+"'>"+'N'+"</option>";
			str+="</select></td>";
			if(name=="event"){str+="<td><select class='form-control' style='width: 60px;' id='eventQuit'>"
				+"<option value='";
				this.event=='Y'?str+='Y'+"' selected='selected'>"+'Y'+"</option>":str+='Y'+"'>"+'Y'+"</option>"
				+"<option value='";
				this.event=='N'?str+='N'+"' selected='selected'>"+'N'+"</option>":str+='N'+"'>"+'N'+"</option></select>"
				+"<td><select class='form-control' style='width: 60px;' id='eventBanner'>"
				+"<option value='";
				this.banner=='Y'?str+='Y'+"' selected='selected'>"+'Y'+"</option>":str+='Y'+"'>"+'Y'+"</option>"
				+"<option value='";
				this.banner=='N'?str+='N'+"' selected='selected'>"+'N'+"</option>":str+='N'+"'>"+'N'+"</option></select>"}
			str+="</td></tr>";	
		});
		//alert("리스트 출력 후 : "+name);
		$("#"+name+"Tlist > tbody").html(str);
	});
}
//쿠킹/이벤트/공지사항/샵/ div 박스 출력
function getAllBoxList(name){
	var url="/"+name+"/AllList";
	var str="";
	alert("getAllList 받을 때 값 : "+name);
	$.getJSON(url,function(data){
		$(data).each(function(){
			str +="<div class='col-sm-3' style='width: 250px;'>"
			+"<img src='/photo_upload/";
			if(name=="shop"){str+="thing/"+this.file1;};
			if(name=="event"){str+=name+"/"+this.thumb1;}
			if(name!='shop' && name!="event"){str+=name+"/"+this.thumb;};
			str+="'style='width: 227px; height: 227px;'>"
				+"<h5>"+this.title+"</h5></div>";
		});
		//alert("리스트 출력 후 : "+name);
		$("#"+name+"list > .container > .row").html(str);
	});
}

/*//카테고리 그룹 리스트 출력
function getGroupList(){	
	var totalSelect=$("select[id='ctgroup']").length;
	$.getJSON("/thing/ctgrouplist/", function(data){
		for(var i=0;i<totalSelect;i++){
			$("select[id='ctgroup']").eq(i).empty();
			$(data).each(
					function(){
						$("select[id='ctgroup']").eq(i).append("<option value='"+this.ctgroup+"'>"+this.name+"</option>");					
					});
		}
	});
}
//카테고리 리스트 출력
function getCategoryList(){	
	var ctgroup=$("select[id='ctgroup'] option:selected").val();
	var totalCategory=$("select[id='categorylist']").length;
		$.getJSON("/thing/categorylist/"+ctgroup, function(data){
			for(var i=0;i<totalCategory;i++){
			$("select[id='categorylist']").eq(i).empty();			
			$(data).each(
					function(){
						$("select[id='categorylist']").eq(i).append("<option value='"+this.ctno+"'>"+this.ctname+"</option>");						
					});
			}
		});
}*/
//자세한 상품 페이지 정보 가져오기
/*function getThingInfo(tno){
	$.getJSON("/thing/getthing/"+tno,function(data){
		$(data).each(function(){
			totalCostSum(this.tno);
		});		
	});
}*/
//주문상품 총 가격 구하기
function totalCostSum(){
	//alert("총 금액 : "+$("#hcost"+idnum).val());
	//alert($("input").filter("#hcost").val());
	//alert($("input[id='hcost']").length);
	var cost=0;
	for(var i=0; i<$("input[id='hcost']").length;i++){
		cost=cost+Number($("input[id='hcost']").eq(i).val());
	}
	//alert("totla cost : "+cost);
	$("#lasttotalcost").html(formatNumber(cost)+"원");
}
//상품 개수 추가
function oderCount(updown,idnum){
	//document.getElementById("ordernum").max
	var count=Number($("#ordernum"+idnum).val());
	var max=Number(document.getElementById("ordernum"+idnum).max);
	alert("재고 수량 : "+max);
	var cost=$("#cost"+idnum).val();
	alert("가격 :"+cost);
	if(updown=="up"){
		if(count>=max){
			alert("재고보다 많이 주문 하실 수 없습니다.");
			count=max;
		}else if(count<=max){
			count=count+1;
			$("#ordernum"+idnum).val(count);				
			$("#totalcost"+idnum).html(count*cost);
			$("#totalcost"+idnum).number(true);
			$("#totalcost"+idnum).append("원");
			$("#totalcost"+idnum).append("<input type='hidden' id='hcost' class='"+idnum+"' value='"+count*cost+"'>"
					+"<input type='hidden' value='"+idnum+"' name='tno'>");
			totalCostSum();
		}
	}
	if(updown=="down"){
		if(count<=1){
			alert("최소 주문 수량은 1입니다.");
			count=1;
		}else if(count<=max){
			count=count-1;
			$("#ordernum"+idnum).val(count);
			$("#totalcost"+idnum).html(count*cost);
			$("#totalcost"+idnum).number(true);
			$("#totalcost"+idnum).append("원");
			$("#totalcost"+idnum).append("<input type='hidden' id='hcost' class='"+idnum+"' value='"+count*cost+"'>"
					+"<input type='hidden' value='"+idnum+"' name='tno'>");
			totalCostSum();
		}
	}
}
function addShopThing(){
	var ctgroup=$("select[id='ctgroup']").eq(4).val();
	var ctno=$("select[id='categorylist']").eq(4).val();
	$.getJSON("/thing/thingInfo/"+ctgroup+"/"+ctno,function(data){
		$(data).each(function(){
			if(data!=null){
				if(this.tno!=null){
					$("#thinglist").append("<option value='"+this.tno+"'>"+this.name+"</option>");
				}else{
					$("#thinglist").html("");
				}
			}
		});
	});
	$("#thinglist").empty();
}
function modalId(modal){
	modalid=modal.attr("id");
}
function formatNumber(num) {
	return num.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"); 
}
function moreDelete(num){
	$(".more"+num).remove();
	$("#shopmorething").find("option[value="+num+"]").prop("selected",false);
	totalCostSum();
}

function orderMethod(creditMethod){
	if(creditMethod=='card'){
		for(var i=0;i<$("div[id='credit-card']").length;i++){
			$("div[id='credit-send']").eq(i).hide();
			$("div[id='credit-card']").eq(i).show();
		}
		$("#credit-card").show();
	}
	if(creditMethod=='send'){
		$("#credit-send").show();
		for(var i=0;i<$("div[id='credit-card']").length;i++){
			$("div[id='credit-card']").eq(i).hide();
			$("div[id='credit-send']").eq(i).show();
		}
	}
}

$(document).ready(function() {
	$(document).keydown(function(e){
		if (event.keyCode == 116) {
	        alert("새로고침을 할 수 없습니다.");
	        event.keyCode = 2;
	        return false;
	    } else if (event.ctrlKey
	            && (event.keyCode == 78 || event.keyCode == 82)) {
	        return false;
	    }
	}); 
	var totalcostsum=0;
	for(var i=0;i<$("input[id='sumcost']").length;i++){
		totalcostsum+=Number($("input[id='sumcost']").eq(i).val());
	}
	$("#emailCom2").on("change",function(){
		if($("#emailCom2 option:selected").val()=="self"){
			$("#emailCom").removeAttr("readonly");
			$("#emailCom").val("");
			$("#emailCom").focus();
		}else{		
			$("#emailCom").attr("readonly","readonly");
			$("#emailCom").val($("#emailCom2 option:selected").val());
		}
	});
	
	for(var i=0;i<$("div[id='totalcost']").length;i++){
		$("div[id='totalcost']").eq(i).html(formatNumber(totalcostsum)+"원");
	}
	//getThingInfo($("#tno").val());
	
	/*$(".member-box").css("position", "absolute");
	$(".member-box").css("top",Math.max(0, (($(window).height()-$(".member-box").outerHeight())/2)
			+$(window).scrollTop())+"px");
	$(".member-box").css("left",Math.max(0, (($(window).width()-$(".member-box").outerWidth())/2)
			+$(window).scrollLeft())+"px");
	*/
	$("#buynow").on("click",function(){
		var frmdata=$("#frmbuy");
		frmdata.attr("action", "./shoporder");
		frmdata.attr("method","POST");
		frmdata.submit();
		//frmdata.submit();
	});
	//추가 상품 선택시 
	$("#shopmorething").on("change",function(){
		var tno=$("#shopmorething option:selected").val();
		if($(".col-md-4").hasClass("more"+tno)){
			alert("이미 같은 상품을 등록 하셨습니다.");
			$("#shopmorething").find("option[value="+tno+"]").prop("selected",false);
		}else{
			$.getJSON("/thing/getthing/"+tno,function(data){
				$(data).each(function(){
					var cost=formatNumber(this.sellcost);
					$("#shopThing").append(							
							"<div class='col-md-4 more"+this.tno+"' style='width: 100%;margin: 0 0 0 0;padding: 0 0 0 0;margin-top:10px;'>"
							+"<input type='hidden' value='"+this.sellcost+"' id='cost"+this.tno+"' name='cost"+this.tno+"'>"
							+"<div class='col-sm-2' style='width:20%;height:70px;float:left;margin: 0 0 0 0;padding: 0 0 0 0;'>"
							+"<img src='/photo_upload/thing/"+this.thumb+"' style='width:70px;height:70px;' class='preview' id='"+this.tno+"' alt=''>"
							+"</div>"
							+"<div class='col-sm-2' style='width: 30%;float: left;line-height: 25px;margin-top:20px;'>"+this.name+"</div>"
							+"<div class='col-sm-2' style='width: 20%;float: left;'>"
							+"<div style='float:left;width: 50px;margin-top:20px;'>"
							+"<input type='number' value='1' max='"+this.stock+"' style='width: 100%;height: 25px;'"
							+"readonly='readonly' id='ordernum"+this.tno+"' class='form-control' name='orderStock'></div>"
							+"<div style='margin-top:20px;'>"
							+"<a href='#' onclick=oderCount('up',"+this.tno+")>"
							+"<span class='glyphicon glyphicon-collapse-up' style='display: block;'></span>"
							+"</a>"
							+"<a href='#' onclick=oderCount('down',"+this.tno+")>"
							+"<span class='glyphicon glyphicon-collapse-down' style='display: block;'></span>"
							+"</a>"
							+"</div>"
							+"</div>"
							+"<div class='col-sm-2' style='width: 5%;float:left;margin-top:20px;'>"
							+"<a href='#' onclick=moreDelete("+this.tno+")><span class='glyphicon glyphicon-remove'></span></a></div>"
							+"<div class='col-sm-2' style='width: 20%;float: left;text-align: right;line-height: 25px;margin-top:20px;"
							+"' id='totalcost"+this.tno+"'>"
							+cost +"원"
							+"<input type='hidden' id='hcost' class='hcost"+this.tno+"' value='"+this.sellcost+"'>"
							+"<input type='hidden' value='"+this.tno+"' name='tno'>"
							+"</div>"
							+"</div>"
							);
					$("#shopmorething").find("option[value="+tno+"]").prop("selected",false);
					totalCostSum();					
				});
			});
		}		
	});
	
	$("#thinglist").on("click",function(){
		var tno=$("#thinglist option:selected").val();
		$.getJSON("/thing/getthing/"+tno,function(data){
			$(data).each(function(){
				$("#coverimage").html("<img src='/photo_upload/thing/"+this.thumb+"' style='width:275px;height:275px;'>");
				$("#shopcost").val(this.sellcost);
				$("#shopstock").val(this.stock);
				$("#file1").val(this.thumb);
			});
		});
	});
	$("#thinglist").on("change",function(){
		var tno=$("#thinglist option:selected").val();
		$.getJSON("/thing/getthing/"+tno,function(data){
			$(data).each(function(){
				$("#coverimage").html("<img src='/photo_upload/thing/"+this.thumb+"' style='width:275px;height:275px;'>");
				$("#shopcost").val(this.sellcost);
				$("#shopstock").val(this.stock);
				$("#file1").val(this.thumb);
			});
		});
	});
	
	$("select[id='categorylist']").on("change",function(){
		var indexno=$("select[id='categorylist']").index(this);
		var ctgroup=$("select[id='ctgroup'] option:selected").eq(4).val();
		var ctno=$(this).val();
		if(indexno==4){
			$.getJSON("/thing/thingInfo/"+ctgroup+"/"+ctno, function(data){
				$(data).each(function(){
					if(data!=null){
						if(this.tno!=null){
							$("select[id='thinglist']").eq(0).append("<option value='"+this.tno+"'>"+this.name+"</option>");
							//$("#thinglist").append("<option value='"+this.tno+"'>"+this.name+"</option>");
						}else{
							$("select[id='thinglist']").eq(0).html("");
						}
					}
				});
			});
			$("select[id='thinglist']").eq(0).empty();
		}
		if(indexno==5){
			$.getJSON("/thing/thingInfo/"+ctgroup+"/"+ctno, function(data){
				$(data).each(function(){
					if(data!=null){
						if(this.tno!=null){
							$("select[id='thinglist']").eq(1).append("<option value='"+this.tno+"'>"+this.name+"</option>");
							//$("#thinglist").append("<option value='"+this.tno+"'>"+this.name+"</option>");
						}else{
							$("select[id='thinglist']").eq(1).html("");
						}
					}
				});
			});
			$("select[id='thinglist']").eq(1).empty();
		}
	});
	/*$("select[id='categorylist']").on("click",function(){
		var indexno=$("select[id='categorylist']").index(this);
		var ctgroup=$("select[id='ctgroup'] option:selected").eq(4).val();
		var ctno=$(this).val();
		if(indexno==4){
			$.getJSON("/thing/thingInfo/"+ctgroup+"/"+ctno, function(data){
				$(data).each(function(){
					$("#thinglist").append("<option value='"+this.tno+"'>"+this.name+"</option>");
				});
			});
		}
	});*/
	/*$("#AddItem").on("click",function(){
		var selectedGroup = $("select[id='ctgroup'] option:selected").eq(2).text();
		var selectedCategory=$("select[id='categorylist'] option:selected").eq(2).text();
	});
	*/
	//form 통한 게시물 추가 메소드
	$("form[id='frm']").submit(function(){
		CKupdate();
		var formAction=$(this).attr("action");
		//var modalid=$("modal[class='modal']").length;
		alert(formAction+modalid);
		var formData=new FormData(this);
		console.log(formData);
		$.ajax({
			url:formAction,
			processData:false,
			contentType:false,
			data:formData,
			type:"POST",
			success:function(result){				
				alert("아이템이 성공적으로 등록되었습니다.");
				getAllBoxList(result);
			},
			error:function(result){
				alert("값을 넣어주세요");
			}
		});
		event.preventDefault();
		this.reset();
	});
	//카테고리 추가 구문
	$("#AddCT").on("click",function(){
		if($("#categoryText").val().length==0){
			alert("추가할 카테고리 명을 입력해 주십시오.");
		}else{
			var ctgrouptext=$("select[id='ctgroup'] option:selected").eq(1).text();
			var chConfirm=confirm(ctgrouptext+" 그룹에 "+$("#categoryText").val()+" 카테고리를 정말 추가하시겠습니까?");
			if(chConfirm==true){
				$.ajax({
					type : 'post',
					url : '/thing/insertCategory',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType: 'text',
					data : JSON.stringify({
						ctname : $("#categoryText").val(),
						ctgroup : $("select[id='ctgroup']").eq(1).val()
					}),
					success : function(result){
						if(result=='SUCCESS'){
							alert("카테고리가 성공적으로 생성 돼었습니다.");
							getGroupList();
							getCategoryList();
							$("#categoryText").val("");
						}
					}
				});
			}else{
				return false;
			}			
		}
	});
	//카테고리 그룹 삭제 구문
	$("#delTG").on("click", function(){
		if($("select[id='categorylist']").eq(0).val()!=null){
			alert("먼저 카테고리를 삭제해 주십시오.");
		}else{
			var ctgroup=$("select[id='ctgroup']").eq(0).val();
			$.ajax({
				type :'delete',
				url : '/thing/deleteCtgroup/'+ctgroup,
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType :'text',
				success : function(result){
					if(result=='SUCCESS'){
						alert("선택하신 카테고리 그룹이 삭제되었습니다.");
						getGroupList();
						getCategoryList();
					}
				}
			});
		}
	});
	//카테고리 삭제 구문
	$("#delCT").on("click",function(){
		if($("select[id='categorylist']").eq(0).val()==null){
			alert("삭제할 카테고리를 선택해 주십시오.");
		}else{
			var ctno=$("select[id='categorylist']").eq(0).val();
			$.ajax({
				type :'delete',
				url : '/thing/deleteCategory/'+ctno,
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType :'text',
				success : function(result){
					if(result=='SUCCESS'){
						alert("선택하신 카테고리가 삭제되었습니다.");
						getCategoryList();
					}
				}
			});
		}
	});
	//카테고리 그룹 선택시 그룹에 속한 소그룹 출력
	$("select[id='ctgroup']").on("change",function(){
		var indexno=$("select[id='ctgroup']").index(this);		
		var ctgroup=this.value;
		$.getJSON("/thing/categorylist/"+ctgroup,function(data){
			$("select[id='categorylist']").eq(indexno).empty();
			$(data).each(
					function(index){
						$("select[id='categorylist']").eq(indexno).append("<option value='"+this.ctno+"'>"+this.ctname+"</option>");
					});
		});
	});
	//쿠킹클래스 메인화면 출력 여부 결정
	var cnoIndex=$("input[id='cno']");
	$("#cookDisplay").on("click",function(){
		alert("test");
	});
	$("select[id='cookDisplay']").on("change",function(){
		alert("test");
		var index=$("select[id='cookDisplay']").index(this);
		var display=this.value;
		var cno=cnoIndex[index].value;		
		$.ajax({
			type:'put',
			url:'/administrator/cook/display/update/'+cno,
			headers :{
				"Content-type":"application/json",
				"X-HTTP-Method-Override":"PUT"
			},
			data : JSON.stringify({display:display}),
			dataType:'text',
			success:function(result){
				console.log("result: "+result);
				if(result== 'SUCCESS'){
					alert(cno+" 번째 게시물의 화면표시 여부를 "+display+"로 변경완료 하였습니다.");
				}
			}
		});
	});
	//쿠킹 클래스 게시판 강조 여부 결정
	$("select[id='cookStrong']").on("change",function(){
		var index=$("select[id='cookStrong']").index(this);
		var strong=this.value;
		var cno=cnoIndex[index].value;		
		$.ajax({
			type:'put',
			url:'/administrator/cook/strong/update/'+cno,
			headers :{
				"Content-type":"application/json",
				"X-HTTP-Method-Override":"PUT"
			},
			data : JSON.stringify({strong:strong}),
			dataType:'text',
			success:function(result){
				console.log("result: "+result);
				if(result== 'SUCCESS'){
					alert(cno+" 번째 게시물의 강조 여부를 "+strong+"로 변경완료 하였습니다.");
				}
			}
		});
	});
	
	//주소 검색 화면
	$("#BtSearchAddress").on("click",function(){
		var eupmyeon=$("#SearchAddress").val();
		
		if($("#SearchAddress").val().length==0 || $("#SearchAddress").val().length<2){
			alert("검색할 주소를 입력해 주십시오.");	
		}else{
			//주소 리스트 호출 및 select box 데이터 입력
			$.getJSON("/address/searchlist/"+eupmyeon, function(data){
				$("#addressist").empty();
				$(data).each(
						function(){
							$("#addressist").append("<option value='"+this.zipcode+"  "+this.address1+"'>"
									+this.zipcode+"  "+this.address1										
									+"</option>");
						});
			});
		}
	});
	//선택한 주소를 입력 창에 뿌려주는 구문
	$("#addressist").on("change",function(){
		$("#zipcode").val($("#addressist option:selected").val().substr(0,5));
		$("#address1").val($("#addressist option:selected").val().substr(7,$("#addressist option:selected").val().length-1));
	});
	//아이디 중복 체크 및 한글 입력 불가 처리 구문
	$("#checkId").on("click",function(){
		var id=$("#email1").val()+"@"+$("#email2 option:selected").val();
		if($("#email1").val().length==0){
			alert("ID를 입력해 주십시오.");
		}else if($("#email1").val().length<4){
			alert("ID는 4자 이상 입력해 주십시오.");
		}else if(isKorean($("#email1").val())==true){
			alert("ID는 영문만 가능합니다.");
		}else{
			$.ajax({
				type : 'post',
				url : '/member/checkId/',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType: 'text',
				data : JSON.stringify({
					id : id
				}),
				success : function(result){
					if(result=='SUCCESS'){
						$(".glyphicon-ok").show();
						$(".glyphicon-remove").hide();
					}else{
						$(".glyphicon-remove").show();
						$(".glyphicon-ok").hide();
					}
				}
			});
		}
	});
	
	//아이디 중복 체크전 OK, NOT 아이콘 표시 숨김
	$(".glyphicon-ok").hide();
	$(".glyphicon-remove").hide();
	$("div[id='credit-send']").eq(0).hide();
	$("div[id='credit-send']").eq(1).hide();
	$("input:radio[id='credit-method']:radio[value='card']").attr('checked', true);
	//카테고리 그룹 추가 구문
	$("#AddCTG").on("click",function(){
		var groupName=$("#groupText").val();
		if(groupName.length==0){
			alert("추가할 카테고리 그룹명을 입력해 주십시오.");
		}else{
			$.ajax({
				type : 'post',
				url : '/thing/insertCtgroup',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType: 'text',
				data : JSON.stringify({
					name : groupName
				}),
				success : function(result){
					if(result=='SUCCESS'){
						alert("카테고리 그룹이 성공적으로 생성 돼었습니다.");
						getGroupList();
						getCategoryList();
						$("#groupText").val("");
					}
				}
			});
		}
	});
});