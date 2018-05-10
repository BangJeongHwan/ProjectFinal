<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<style type="text/css">
table {
	border: 1px solid #EBEBEB;
	align-content: center;
	width: 800px;
	/* height: 1000px; */
}
td font{
	font-size:12px;color:#0000ff;margin:8px 0 0 8px;letter-spacing:-0.5px;
}
tr{
	height: 60px;
	padding:  20px 20px;
}
td{
	 background-color:#F8F8F8;
}
th{
	 background-color:#F8F8F8;
	text-align:center;
}
td:nth-child(even) {
    background-color:white;
}

.btn_both{overflow:hidden;clear:both;width:100%;padding-top: 0px;} 
.btn_both .fl{float:left} 

</style>

<script type="text/javascript">
var hallcount = 0;
</script>

<div class="container">
	<h2 class="nino-sectionHeading">
	<span class="nino-subHeading">wedding Hall</span>
		${wd.cname }
	</h2>
	
	
	<div class="sectionContent">
		<div class="row" align="center">
			
			
			<!-- 홀 선택 -->
			<div align="center">
				<c:forEach items="${hallList }" var="list" varStatus="i" begin="0" step="1">
					<span style="cursor: pointer; font-size: 30px" onclick="selectHall(${i.index})" id="_hallsel${i.index}">${list.hallname }홀</span>&nbsp;&nbsp;
					
					<script>
						hallcount++;
					</script>
					
				</c:forEach>
			</div>
			<br>
			<div align="center">
				<button onclick="delhall()" style="background-color: white;">홀 삭제</button>
			</div>
	
			<br><br>
			
			<!-- action = "hallwriteAf.do" -->
			<form name="frmForm" id="_frmForm" action="#none" method="post" 
			enctype="multipart/form-data">
			
			<!-- 글 번호 -->
			<input type="hidden" name="hallPd.whseq" id="_whseq" value="${wd.whseq }">		
			<!-- 홀 번호 -->
			<input type="hidden" name="hallPd.pdseq" id="_pdseq" value="${hallList[0].pdseq }">	
			<table class="list_table" style="width:85%;">
				<colgroup>
					<col width="20%"><col width="30%">
				</colgroup>
				<tr>
					<th>홀 이름</th>
					<td>	
						<input type="text" name="hallPd.hallname" id="_hallname" size="20" value="${hallList[0].hallname}" readonly>
					</td>
				</tr>
				<tr>
					<th>층 수</th>
					<td>
						<input type="text" name="hallPd.floor" id="_floor" size="10" value="${hallList[0].floor}">층
					</td>
				</tr>
				
				<tr>
					<th>시설 구분</th>
					<td>
						<input type="hidden" name="hallPd.facility" id="_facility" value="${hallList[0].facility}">
						<input type="checkbox" name="faci" value="컨벤션">컨벤션&nbsp;&nbsp;
						<input type="checkbox" name="faci" value="호텔">호텔&nbsp;&nbsp;
						<input type="checkbox" name="faci" value="채플">채플&nbsp;&nbsp;
						<input type="checkbox" name="faci" value="전통">전통&nbsp;&nbsp;
						<input type="checkbox" name="faci" value="야외">야외&nbsp;&nbsp;
						<input type="checkbox" name="faci" value="종교">종교&nbsp;&nbsp;
						<input type="checkbox" name="faci" id="_faci" value="기타">기타
					</td>
				</tr>
				
				<tr>
					<th>음식 종류</th>
					<td>
						<input type="hidden" name="hallPd.menutype" id="_menutype" value="${hallList[0].menutype}">
						<input type="checkbox" name="menu" value="뷔페">뷔페&nbsp;&nbsp;
						<input type="checkbox" name="menu" value="양식">양식&nbsp;&nbsp;
						<input type="checkbox" name="menu" value="한식">한식&nbsp;&nbsp;
						<input type="checkbox" name="menu" value="중식">중식&nbsp;&nbsp;
						<input type="checkbox" name="menu" value="일식">일식&nbsp;&nbsp;
						<input type="checkbox" name="menu" id="_menu" value="기타">기타
					</td>
				</tr>
				
				<tr>
					<th>식대 가격대</th>
					<td><input type="text" name="hallPd.mincook" id="_mincook" size="10" value="${hallList[0].mincook }">원
					 ~ <input type="text" name="hallPd.maxcook" id="_maxcook" size="10" value="${hallList[0].maxcook }">원
					 &nbsp;&nbsp;&nbsp;&nbsp;<font id="_cookCheckFld">※ 최소 가격 ~ 최대 가격 순으로 입력해주세요!</font>
					 </td>
				</tr>
				
				<tr>
					<th>식사 동시 가능 여부</th>
					
					<td>
						<input type="hidden" id="_formatStr" value="${hallList[0].format }">
						<select id="_format" name="hallPd.format">
							<option value="분리">분리</option>
							<option value="동시">동시</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>수용 인원 범위</th>
					<td><input type="text" name="hallPd.minpeople" id="_minpeople" size="10" value="${hallList[0].minpeople }">명
					 ~ <input type="text" name="hallPd.maxpeople" id="_maxpeople" size="10" value="${hallList[0].maxpeople }">명
					 &nbsp;&nbsp;&nbsp;&nbsp;<font id="_peopleCheckFld">※ 최소 인원 ~ 최대인원 순으로 입력해주세요!</font>
					 </td>
				</tr>
				<tr>
					<th>착석 인원</th>
					<td>
						<input type="text" name="hallPd.setpeople" id="_setpeople" size="10" value="${hallList[0].setpeople }">명
					 </td>
				</tr>
				 
				<tr style="height: 500px">
					<th>사진 업로드</th>
					<td style="text-align: left" class="btn_both">
						<div class="fl">
							<button type="button" id="_fileBtn" onclick="fileBtn()">사진 선택</button>&nbsp;&nbsp;&nbsp;&nbsp;
								<font>※  최대 15개까지 가능합니다.</font>
							<!--  style="display:none;" -->
							<input type="hidden" name="fileNameList[0]" id="_fileNameList0" value="">
							<input type="hidden" name="fileNameList[1]" id="_fileNameList1" value="">
							<input type="hidden" name="fileNameList[2]" id="_fileNameList2" value="">
							<input type="hidden" name="fileNameList[3]" id="_fileNameList3" value="">
							<input type="hidden" name="fileNameList[4]" id="_fileNameList4" value="">
							<input type="hidden" name="fileNameList[5]" id="_fileNameList5" value="">
							<input type="hidden" name="fileNameList[6]" id="_fileNameList6" value="">
							<input type="hidden" name="fileNameList[7]" id="_fileNameList7" value="">
							<input type="hidden" name="fileNameList[8]" id="_fileNameList8" value="">
							<input type="hidden" name="fileNameList[9]" id="_fileNameList9" value="">
							<input type="hidden" name="fileNameList[10]" id="_fileNameList10" value="">
							<input type="hidden" name="fileNameList[11]" id="_fileNameList11" value="">
							<input type="hidden" name="fileNameList[12]" id="_fileNameList12" value="">
						
							<input type="file" name="fileList[0]" id="_fileList0" onchange="fileSelect(0)" style="display:none;">
							<input type="file" name="fileList[1]" id="_fileList1" onchange="fileSelect(1)" style="display:none;">
							<input type="file" name="fileList[2]" id="_fileList2" onchange="fileSelect(2)" style="display:none;">
							<input type="file" name="fileList[3]" id="_fileList3" onchange="fileSelect(3)" style="display:none;">
							<input type="file" name="fileList[4]" id="_fileList4" onchange="fileSelect(4)" style="display:none;">
							<input type="file" name="fileList[5]" id="_fileList5" onchange="fileSelect(5)" style="display:none;">
							<input type="file" name="fileList[6]" id="_fileList6" onchange="fileSelect(6)" style="display:none;">
							<input type="file" name="fileList[7]" id="_fileList7" onchange="fileSelect(7)" style="display:none;">
							<input type="file" name="fileList[8]" id="_fileList8" onchange="fileSelect(8)" style="display:none;">
							<input type="file" name="fileList[9]" id="_fileList9" onchange="fileSelect(9)" style="display:none;">
							<input type="file" name="fileList[10]" id="_fileList10" onchange="fileSelect(10)" style="display:none;">
							<input type="file" name="fileList[11]" id="_fileList11" onchange="fileSelect(11)" style="display:none;">
							<input type="file" name="fileList[12]" id="_fileList12" onchange="fileSelect(12)" style="display:none;">
							<input type="file" name="fileList[13]" id="_fileList13" onchange="fileSelect(13)" style="display:none;">
							<input type="file" name="fileList[14]" id="_fileList14" onchange="fileSelect(14)" style="display:none;">
							<div id="_fileNameDiv" style="padding:10px; border:1px solic black;"></div>
						</div>
						<div>
							<!-- 사진 뿌려주기 -->
							<img id="_imgshow">
						</div>
					</td>
				</tr>
				<tr>
					<th>오픈, 마감 시간</th>
					<td>
						<input type="hidden" id="_opentimeStr" value="${hallList[0].opentime }">
						<input type="hidden" id="_closetimeStr" value="${hallList[0].closetime }">
						<select id="_opentime" name="hallPd.opentime">
							<c:forEach var="i" begin="1" end="23" step="1">
								<option value="${i }">${i }시</option>
							</c:forEach>
						</select>
						~
						<select id="_closetime" name="hallPd.closetime">
							<c:forEach var="i" begin="1" end="23" step="1">
								<option value="${i }">${i }시</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>이용 시간</th>
					<td>
						<input type="hidden" id="_wstepStr" value="${hallList[0].wstep}">
						<select id="_wstep" name="hallPd.wstep">
							<c:forEach var="i" begin="40" end="200" step="10">
								<option value="${i }분">${i }분</option>
							</c:forEach>
						</select>
					</td>
				</tr>				
				<tr>
					<th>사용료</th>
					<td>
						 <input type="text" name="hallPd.pay" id="_pay" size="10" value="${hallList[0].pay }">만원&nbsp;&nbsp;&nbsp;&nbsp;
						 <font>※ 단위는 '만원' 입니다.</font>
					</td>
				</tr>
				
				<tr>
					<th>음주류 포함 여부</th>
					<td>
						<input type="hidden" id="_drinkStr" value="${hallList[0].drink }">
						<select id="_drink" name="hallPd.drink">
							<option value="포함">포함</option>
							<option value="미포함">미포함</option>
						</select>
					</td>
				</tr>
				
				
				
				<tr>
					<td colspan="2" style="height:50px; text-align:center;">
						<span>
							<a href="#none" id="_btnLogin" title="글쓰기"><img src="assets/images/others/bwrite.png" alt="글쓰기" /></a>
						</span>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</div>

<!-- 파일 업로드 -->
<script type="text/javascript">

var fileSize = 0;
var fileNameArray = new Array("", "", "", "", "", "", "", "", "", "","","","","","");
</script>

<c:forEach items="${ hallpicArr }" varStatus="i">
	<c:if test="${ not empty hallpicArr[i.index] && hallpicArr[i.index] != '' }">
		<script type="text/javascript">
			fileNameArray[fileSize] = "${hallpicArr[i.index]}";
			fileSize++;
		</script>
	</c:if>
</c:forEach>

<script>
drawFileNameDiv();
//파일 선택버튼 클릭시
function fileBtn() {
	for (var i = 0; i < fileNameArray.length; i++) {
		if (fileNameArray[i] == "") {
			var inputFileId = "#_fileList" + i;
			$(inputFileId).click();
			break;
		}
	}
}

//파일선택시
function fileSelect(selectFileIndex) {
	if (fileNameArray[selectFileIndex] == "") {
		fileSize++;
	}
	var inputFileId = "#_fileList" + selectFileIndex;
	var path = $(inputFileId).val();
	var idx = path.lastIndexOf("\\");
	if (idx == -1) {
		idx = path.lastIndexOf("/");
	}
	var fileName = path.substring(idx + 1);
	
	// 본래 있던 파일이 삭제되면
	if (fileName.trim() == "" && fileNameArray[selectFileIndex] != "") {
		alert("delete");
		fileSize--;
		fileNameArray[selectFileIndex] = "";
	} else {
		fileNameArray[selectFileIndex] = fileName;
	}
	
	//파일사이즈 10이면 버튼 비활성화
	if (fileSize >= 15) {
		$("#_fileBtn").attr("disabled", "disabled");
	} else {
		$("#_fileBtn").removeAttr("disabled");
	}
	
	drawFileNameDiv();
	//changeimg(fileName);
}

//파일 삭제 버튼 클릭
function delfile(i){
	var inputFileId = "#_fileList" + i;
	$(inputFileId).remove();
	fileNameArray[i] = "";
	fileSize--;
	$("#_fileBtn").removeAttr("disabled");
	
	var inputFileTagStr = "<input type='file' name='fileList[" + i +"]' id='_fileList"+ i +"' onchange='fileSelect("+ i +")' style='display:none;'>";
	$(inputFileTagStr).insertBefore($("#_fileNameDiv"));

	drawFileNameDiv();
}

//_fileNameDiv 생성
function drawFileNameDiv() {
	var tagStr = "";
	for (var i = 0; i < 15; i++) {
		if (fileNameArray[i] != "") {
			tagStr += "<button type='button' onclick='delfile(" + i +")'>삭제</button>&nbsp;&nbsp;";
			tagStr += fileNameArray[i];
			tagStr += "<br>";
		}
		var fileNameInputId = "#_fileNameList" + i;
		$(fileNameInputId).val(fileNameArray[i]);
	}
	
	$("#_fileNameDiv").html(tagStr);
}

</script>

<!-- 홀 이름에 따른 입력 변경 -->
<script>

// 초기 값 입력
changeHallInfo(0,"","");

function changeHallInfo(hallnum,hall,picArr){
	for(var i=0;i<hallcount;i++){
		if(i==hallnum){
			$("#_hallsel"+i).css("border-bottom","1px solid red");
		}else{
			$("#_hallsel"+i).css("border-bottom","");
		}
	}
	
	if(hall!="" && picArr!=""){		
		$("#_pdseq").val(hall.pdseq);
		$("#_hallname").val(hall.hallname);
		$("#_floor").val(hall.floor);
		$("#_facility").val(hall.facility);
		$("#_menutype").val(hall.menutype);
		$("#_mincook").val(hall.mincook);
		$("#_maxcook").val(hall.maxcook);
		$("#_formatStr").val(hall.format);
		$("#_minpeople").val(hall.minpeople);
		$("#_maxpeople").val(hall.maxpeople);
		$("#_setpeople").val(hall.setpeople);
		
		for(var i=0;i<picArr.length;i++){
			fileNameArray[i]=picArr[i];
		}
		drawFileNameDiv();
		
		$("#_opentimeStr").val(hall.opentime);
		$("#_closetimeStr").val(hall.closetime);
		$("#_wstepStr").val(hall.wstep);
		$("#_pay").val(hall.pay);
		$("#_drinkStr").val(hall.drink);
	}
	changeVal();
}

function changeVal(){
	var faci = $("#_facility").val().split(" ");
	for(var i=0;i<faci.length;i++){
		if(faci[i].trim()=='컨벤션'){
			$("input[value='컨벤션']").prop("checked",true);
		}else if(faci[i].trim()=='호텔'){
			$("input[value='호텔']").prop("checked",true);
		}else if(faci[i].trim()=='채플'){
			$("input[value='채플']").prop("checked",true);
		}else if(faci[i].trim()=='전통'){
			$("input[value='전통']").prop("checked",true);
		}else if(faci[i].trim()=='채플'){
			$("input[value='채플']").prop("checked",true);
		}else if(faci[i].trim()=='야외'){
			$("input[value='야외']").prop("checked",true);
		}else if(faci[i].trim()=='종교'){
			$("input[value='종교']").prop("checked",true);
		}else if(faci[i].trim()=='기타'){
			$("#_faci").prop("checked",true);
		}
	}

	var menu = $("#_menutype").val().split(" ");
	for(var i=0;i<menu.length;i++){
		if(menu[i]=='뷔페'){
			$("input[value='뷔페']").prop("checked",true);
		}else if(menu[i]=='양식'){
			$("input[value='양식']").prop("checked",true);
		}else if(menu[i]=='한식'){
			$("input[value='한식']").prop("checked",true);
		}else if(menu[i]=='중식'){
			$("input[value='중식']").prop("checked",true);
		}else if(menu[i]=='일식'){
			$("input[value='일식']").prop("checked",true);
		}else if(menu[i]=='기타'){
			$("#_menu").prop("checked",true);
		}
	}

	var format = $("#_formatStr").val();
	if(format=='분리'){
		$("option[value='분리']").prop("selected",true);
	}else if(format=='동시'){
		$("option[value='동시']").prop("selected",true);
	}


	var opentime = $("#_opentimeStr").val();
	opentime = parseInt(opentime);
	var closetime = $("#_closetimeStr").val();
	closetime = parseInt(closetime);

	for(var i=1;i<=23;i++){
		if(opentime==i){
			$("#_opentime option[value='"+i+"']").prop("selected",true);	
		}
		if(closetime==i){
			$("#_closetime option[value='"+i+"']").prop("selected",true);	
		}
	}

	var drink = $("#_drinkStr").val();
	if(drink=='포함'){
		$("#_drink option[value='포함']").prop("selected",true);
	}else if(drink=='미포함'){
		$("#_drink option[value='미포함']").prop("selected",true);
	}

	var wstep = $("#_wstepStr").val().split('분');
	for(var i=40;i<=200;i=i+10){
		if(i==wstep[0]){
			$("#_wstep option[value='"+i+"분']").prop("selected",true);
		}
	}
}

function selectHall(hallnum){
	var hallorname = $("#_hallsel"+hallnum).text().split('홀');
	//alert(hallorname[0]);
	data = {
		hallname:hallorname[0],
		whseq:$("#_whseq").val()		
	}	
	
	$.ajax({
		url:"Hallmodselect.do",
        data:data,      // parameter 타입으로 이동
        success:function(msg){        	
        	// 초기화
        	$("input[type=checkbox]:checked").each(function () {
   				$(this).prop('checked', false);
   			});
        	for(var i=0;i<15;i++){
        		fileNameArray[i]="";
        	}
        	drawFileNameDiv();
        	
        	changeHallInfo(hallnum,msg.hall,msg.hallpicArr);
        },
        error:function(reqest, status, error){
            alert("실패");
        }
	});
	
}
</script>



<!-- 공백 체크 -->
<script>
$(function () {
	// 글쓰기 버튼 누를 시 실행
	$("#_btnLogin").click(function () {
		// checkbox check 된 값 받아오기(facility)
		var facility="";
		$("input[name=faci]:checked").each(function () {
			facility += $(this).val().trim();
			facility += " ";
		});	
		// 끝 문자열 자르기
		var len = facility.length;
		facility=facility.substr(0,len-1);
		
		// menutype에 값 넣기
		var faciTrue=true;
		if(facility==""){
			faciTrue=false;
		}else{
			$("#_facility").val(facility);
		}
				
		
		// checkbox check 된 값 받아오기(menutype)
		var menutype="";
		$("input[name=menu]:checked").each(function () {
			menutype += $(this).val().trim();
			menutype += " ";
		});	
		// 끝 문자열 자르기
		var len = menutype.length;
		menutype=menutype.substr(0,len-1);
		
		// menutype에 값 넣기
		var menuTrue=true;
		if(menutype==""){
			menuTrue=false;
		}else{
			$("#_menutype").val(menutype);
		}
		
		var opentime = parseInt($("#_opentime option:selected").val());
		var closetime = parseInt($("#_closetime option:selected").val());
		var timeTure = true;
		if(opentime=="" || closetime==""){
			timeTure = false;
		}else{
			if(opentime>closetime){
				timeTure = false;
			}
		}
		
		// 숫자 판별하기(식대 가격, 수용 인원)
		var mincook = $("#_mincook").val().trim();
		var maxcook = $("#_maxcook").val().trim();
		var minpeople = $("#_minpeople").val().trim();
		var maxpeople = $("#_maxpeople").val().trim();
		var floor = $("#_floor").val().trim();
		var pay = $("#_pay").val().trim();
		
		
		if($("#_hallname").val().trim()==""){
			 alert("홀 이름을 입력해주세요!");
		}else if(floor=="" || !isNum(floor)){
			$("#_floor").val("");
			alert("층 수를 확인해주세요!");
			$("#_floor").focus();
		}else if(!faciTrue){	
			alert("시설을 선택해주세요!");
		}else if(!menuTrue){
			alert("메뉴를 선택해주세요!");		
		}else if($("#_format option:selected").text()==""){
			alert("식사 동시 가능 여부를 선택해주세요!");
		}else if(mincook=="" || !isNum(mincook)){
			$("#_cookCheckFld").text("※ 숫자를 입력해주세요!");
            $("#_cookCheckFld").css("color","#ff0000");
			$("#_mincook").val("");
			$("#_mincook").focus();
		}else if(maxcook=="" || !isNum(maxcook)){
			$("#_cookCheckFld").text("※ 숫자를 입력해주세요!");
            $("#_cookCheckFld").css("color","#ff0000");
            $("#_maxcook").val("");
			$("#_maxcook").focus();
		}else if(minpeople=="" || !isNum(minpeople)){
			$("#_peopleCheckFld").text("※ 숫자를 입력해주세요!");
            $("#_peopleCheckFld").css("color","#ff0000");
            $("#_minpeople").val("");
			$("#_minpeople").focus();
		}else if(maxpeople=="" || !isNum(maxpeople)){
			$("#_peopleCheckFld").text("※ 숫자를 입력해주세요!");
            $("#_peopleCheckFld").css("color","#ff0000");
            $("#_maxpeople").val("");
			$("#_maxpeople").focus();
		}else if($("#_setpeople").val().trim()=="" || !isNum($("#_setpeople").val().trim())){
			alert("착석 인원수를 확인해주세요!");
			$("#_setpeople").val("");
			$("#_setpeople").focus();
		}else if(!timeTure){
			alert("오픈, 마감 시간을 정확히 입력해주세요!");
		}else if(pay=="" || !isNum(pay)){
			alert("사용료를 확인해주세요!");
			$("#_pay").val("");
			$("#_pay").focus();
		}else if($("#_drink option:selected").text()==""){
			alert("음주류 선택 여부를 선택해주세요!");
		}else{
			$("#_floor").val(floor);
			$("#_pay").val(pay);
			$("#_frmForm").attr({"target":"_self", "action":"hallmodAf.do"}).submit();
		}
	});	
});

// 숫자 판별(숫자면 true)
function isNum(num){
	for( var i = 0; i <= num.length -1 ; i++ ) {
		if (num.charAt(i) >= '0' && num.charAt(i) <= '9') {
		} else {
			return false;
		}
	}
	return true;
}

/* 홀 삭제 */
function delhall(){
	var pdseq = $("#_pdseq").val();
	var whseq = $("#_whseq").val();
	var hallname = $("#_hallname").val();
	alert(pdseq);
	location.href="Halldel.do?pdseq="+pdseq+"&whseq="+whseq+"&hallname="+hallname;
}
</script>

