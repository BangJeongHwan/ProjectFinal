<%@page import="javax.websocket.SendResult"%>
<%@page import="kh.com.a.model2.LoginDto"%>
<%@page import="kh.com.a.model.HoneyMoonDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>

<style type="text/css">
/* button, input, select, table, textarea {
    font-size: 14px;
    font-family: Helvetica-Light,HelveticaNeue-Light,"Helvetica Neue Light","나눔고딕",nanumgothic,AppleSDGothicNeo,"malgun gothic","맑은 고딕",sans-serif;
} */

#se_title_wrapper {
    position: relative;
}

.se_title {
    font-size: 38px;
    line-height: 55px;
}
.se_textarea {
    font-weight: 400;
    word-break: normal;
    word-break: break-word;
    word-wrap: break-word;
    display: block;
    width: 100%;
    height: 100%;
    padding: 53px 0px;
    outline: 0;
    border: none;
    background: 0 0;
    font-family: inherit;
    font-size: inherit;
    font-weight: inherit;
    line-height: inherit;
    color: inherit;
    text-align: inherit;
    font-style: inherit;
    text-decoration: inherit;
    resize: none;
    margin-left: 12%;
}
.se_textarea1 {
    font-weight: 200;
    word-break: normal;
    word-break: break-word;
    word-wrap: break-word;
    display: block;
    width: 80%;
    height: 100%;
    padding: 0px;
    outline: 0;
    border: none;
    background: 0 0;
    font-family: inherit;
    font-size: inherit;
    font-weight: inherit;
    line-height: inherit;
    color: inherit;
    text-align: inherit;
    font-style: inherit;
    text-decoration: inherit;
    resize: none;
    margin-left: 20%;
}
#tab img{
	max-width: 50%; 
	max-height 50%;
	resize: none; 
	margin-left: 20%;
}
button{
	margin-top: 3px;
	border: 1px solid #EAEAEA;
	border-radius: 5px;
	background-color: #EAEAEA;
	padding: 5px 15px
}
</style>
<%
List<HoneyMoonDto> arealist = (List<HoneyMoonDto>)request.getAttribute("arealist"); 
LoginDto mem = (LoginDto)session.getAttribute("login");

%>
<script type="text/javascript">
var fileSize = 0;
var fileNameArray = new Array("", "", "", "", "");
</script>
 
<!--fileName setting  -->
<c:forEach items="${ bbs.file }" var="file" varStatus="i">
	<c:if test="${ not empty bbs.file[i.index] && bbs.file[i.index] != '' }">
		<script type="text/javascript">
			console.log("${bbs.file[i.index]}");
			fileNameArray[fileSize] = "${bbs.file[i.index]}";
			console.log("----fileNameArray[fileSize]" + fileNameArray[fileSize]);
			fileSize++;
		</script>
	</c:if>
</c:forEach>

<div class="se_component_wrap">
	<div id="se_title_wrapper">
	
		<form action="updatehmAf.do" id="frm" method="post" onsubmit="return checkSubmit()" enctype="multipart/form-data" >
		
			<input type="text" style="display: none;" value="false" id="sub">			<!--  엔터시 줄이동으로 보내기 위한 인풋 -->
			<input type="hidden" name="hmbDto.seq" value="${bbs.seq}">			
			<div class="se_title">
							<!-- 수직선  -->
				<hr style="width: 1px;height: 65%;position: fixed;margin-left: 950px;margin-top: 200px;background-color: #EAEAEA;"/>
				
					<!--   지역 셀렉트   -->
				<select id="_area" name="hmbDto.area" style="position: fixed; margin-left: 1050px; margin-top: 505px; font-size: 20px; ">
					<option value="null">여행지역을 선택해주세요</option>
					<c:forEach var="area" items="${arealist}" varStatus="fori">	
						<c:if test="${area.name eq bbs.area}">
							<option value="${area.name}" selected="selected">${area.name}</option>
						</c:if>
						<option value="${area.name}" >${area.name}</option>
					</c:forEach>
				</select>
						<!--   이미지 추가 버튼  -->
				<button style="border: none; background: none; position: fixed; z-index: 100; margin-left: 1050px; margin-top: 20px" id="_fileBtn" type="button"> <i class="fa fa-file-photo-o" style="font-size:30px" onmouseover ="$(this).css('color','#CEF279')" onmouseout="$(this).css('color','inherit')"></i></button>
						<!--  제목     -->
				<textarea class="se_textarea" placeholder="제목" rows="1" cols="10" id="_title" name="hmbDto.title">${bbs.title}</textarea>
				
			</div>
			
						<!--  수정 버튼    -->
			<button type="submit" style="position: fixed; z-index: 100; margin-left: 1050px; margin-top: 410px; background-color: #cacaca; border:1px solid #cacaca; color: white;"  id="submit">수정</button>
						<!--  이미지 삭제 버튼 다이브    -->
			<div id="_fileNameDiv" style="height:260px; width:300px; padding:10px; border:1px solic black;position: fixed; margin-top:460px; margin-left: 1040px;"></div>
			
						<!--  내용 컨텐츠    -->
			<div style="min-height: 300px;">
				<table id="tab">
					<tr>
						<td><textarea id="_content0" name="hmbDto.content0" class="se_textarea1" placeholder="내용" cols="100" id="1" rows="1" >${bbs.content0}</textarea></td>
					</tr>
					<tr>
						<td><img src="" id="_picture0" name="picture0" style="display: none;"> </td>					
					</tr>
					<tr>
						<td><textarea id="_content1" name="hmbDto.content1" class="se_textarea1" placeholder="내용" cols="100" id="1" rows="1" style="display: none;"></textarea></td>
					</tr>
					<tr>
						<td><img src="" id="_picture1" name="picture1" style="display: none;"> </td>					
					</tr>
					<tr>
						<td><textarea id="_content2" name="hmbDto.content2" class="se_textarea1" placeholder="내용" cols="100" id="1" rows="1" style="display: none;"></textarea></td>
					</tr>
					<tr>
						<td><img src="" id="_picture2" name="picture2" style="display: none;"> </td>					
					</tr>
					<tr>
						<td><textarea id="_content3" name="hmbDto.content3" class="se_textarea1" placeholder="내용" cols="100" id="1" rows="1" style="display: none;"></textarea></td>
					</tr>
					<tr>
						<td><img src="" id="_picture3" name="picture3" style="display: none;"> </td>					
					</tr>
					<tr>
						<td><textarea id="_content4" name="hmbDto.content4" class="se_textarea1" placeholder="내용" cols="100" id="1" rows="1" style="display: none;"></textarea></td>
					</tr>
					<tr>
						<td><img src="" id="_picture4" name="picture4" style="display: none;"> </td>					
					</tr>
				</table>
			</div>
						<input type="hidden" name="fileNameList[0]" id="_fileNameList0" value="">
						<input type="hidden" name="fileNameList[1]" id="_fileNameList1" value="">
						<input type="hidden" name="fileNameList[2]" id="_fileNameList2" value="">
						<input type="hidden" name="fileNameList[3]" id="_fileNameList3" value="">
						<input type="hidden" name="fileNameList[4]" id="_fileNameList4" value="">
																	
						<input type="file" name="fileList[0]" id="_fileList0" onchange="fileSelect(0)" style="display:none;">
						<input type="file" name="fileList[1]" id="_fileList1" onchange="fileSelect(1)" style="display:none;">
						<input type="file" name="fileList[2]" id="_fileList2" onchange="fileSelect(2)" style="display:none;">
						<input type="file" name="fileList[3]" id="_fileList3" onchange="fileSelect(3)" style="display:none;">
						<input type="file" name="fileList[4]" id="_fileList4" onchange="fileSelect(4)" style="display:none;">
						
		</form>
	</div>
</div>

<script type="text/javascript">

var bbscontent1 = "${bbs.content1}";
var bbscontent2 = "${bbs.content2}";
var bbscontent3 = "${bbs.content3}";
var bbscontent4 = "${bbs.content4}";
var bbsfile0 = "${bbs.file0}";
var bbsfile1 = "${bbs.file1}";
var bbsfile2 = "${bbs.file2}";
var bbsfile3 = "${bbs.file3}";
var bbsfile4 = "${bbs.file4}";

/* 
if(isNull(bbsfile0)){ // null이 아닐때
	$("#_picture0").attr("src","upload/"+bbsfile0);
	$("#_picture0").css("display","block");
	$("#_filename0").val(bbsfile0);
}
for (var i = 1; i <= 4; i++) {
	var bbsfile = "bbsfile"+i;
	var bbscontent = "bbscontent"+i;
	var picture = "#_picture"+i;
	var filename = "#_filename"+i;
	var content = "#_content"+i;
	
	if(isNull(bbsfile)){
		$(picture).attr("src","upload/"+bbsfile);
		$(picture).css("display","block");
		$(filename).val(bbsfile);
	}
	if(isNull(bbscontent1)){ 
		$(content).val(bbscontent);
		$(content).css("display","block");
	}
} */
if(isNull(bbsfile0)){ // null이 아닐때
	$("#_picture0").attr("src","upload/"+bbsfile0);
	$("#_picture0").css("display","block");
}if(isNull(bbscontent1)){ 
	$("#_content1").val(bbscontent1);
	$("#_content1").css("display","block");
}if(isNull(bbsfile1)){ // null이 아닐때
	$("#_picture1").attr("src","upload/"+bbsfile1);
	$("#_picture1").css("display","block");
}if(isNull(bbscontent2)){ 
	$("#_content2").val(bbscontent2);
	$("#_content2").css("display","block");
}if(isNull(bbsfile2)){ // null이 아닐때
	$("#_picture2").attr("src","upload/"+bbsfile2);
	$("#_picture2").css("display","block");
}if(isNull(bbscontent3)){ 
	$("#_content3").val(bbscontent3);
	$("#_content3").css("display","block");
}if(isNull(bbsfile3)){ // null이 아닐때
	$("#_picture3").attr("src","upload/"+bbsfile3);
	$("#_picture3").css("display","block");
}if(isNull(bbscontent4)){ 
	$("#_content4").val(bbscontent4);
	$("#_content4").css("display","block");
}if(isNull(bbsfile4)){ // null이 아닐때
	$("#_picture4").attr("src","upload/"+bbsfile4);
	$("#_picture4").css("display","block");
} 


drawFileNameDiv();
//////////내용부분에 대한
var len = $(".se_textarea1").val().length;
var rows = len/75;		
	// 한줄당  75글자 
	if(rows>0){
		$(this).attr("rows",rows);
	}


function isNull(obj) {
	return (typeof obj != "undefined" && obj !=null && obj !="")?true:false;
}


function checkSubmit() {			
	var flag = false;
	if($("#sub").val()=="false"){		// sub == 인풋 주고 엔터키로 서브밋 막는 용
	}else{
		flag = true;
	}
	console.log(flag);
	return flag;
}

///////       제목에 대한 25글자제한
$(".se_textarea").keyup(function () {
	if($(this).val().length > 25) {
		alert("25자 이하로 적어주세요.");
        $(this).val($(this).val().substring(0, 25));
    }
});
//////////내용부분에 대한
var len;
var rows;
$(".se_textarea1").keyup(function () {
	len = $(this).val().length;
	rows = len/75;		
	// 한줄당  75글자 
	if(rows>0){
		$(this).attr("rows",rows);
	}
});


/////////////////////////이미지 파일



$("#_fileBtn").click(function () {
	for (var i = 0; i < fileNameArray.length; i++) {
		if (fileNameArray[i] == "") {
			var inputFileId = "#_fileList" + i;
			$(inputFileId).click();
			break;
		}
	}
});
	

//파일선택시
function fileSelect(selectFileIndex) {				//onchange
	if (fileNameArray[selectFileIndex] == "") {
		fileSize++;
	}
	var inputFileId = "#_fileList" + selectFileIndex;
	var path = $(inputFileId).val();
	console.log(path);
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
	if (fileSize >= fileNameArray.length) {
		$("#_fileBtn").attr("disabled", "disabled");
	} else {
		$("#_fileBtn").removeAttr("disabled");
	}
	
	drawFileNameDiv();
}
//_fileNameDiv 생성
function drawFileNameDiv() {
	var tagStr = "";
	for (var i = 0; i < fileNameArray.length; i++) {
		if (fileNameArray[i] != "") {
			tagStr += "<button class='delbtn' type='button' onclick='delfile(" + i +")'>삭제</button>&nbsp;&nbsp;";
			tagStr += fileNameArray[i];
			tagStr += "<br>";
		}
		// 수정한 부분
		var fileNameInputId = "#_fileNameList" + i;
		$(fileNameInputId).val(fileNameArray[i]);
		
	}
	///////// for문 안에 써줘야함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	//var fileNameInputId = "#_fileNameList" + i;
	//console.log("fileNameArray[i]" + fileNameArray[i]);
	//$(fileNameInputId).val(fileNameArray[i]);
	
	console.log("fileNameInputId : " +$(fileNameInputId).val());
	$("#_fileNameDiv").html(tagStr);
}

function delfile(i){
	var inputFileId = "#_fileList" + i;
	/* $(inputFileId).remove(); */
	$(inputFileId).val("");
	fileNameArray[i] = "";
	fileSize--;
	$("#_fileBtn").removeAttr("disabled");
	

	if(i<4){
		var imgId = "#_picture"+i;
		
		var afterArea = "#_content"+(i+1);
		var beforeArea = "#_content"+i;
		
		for (var j = i; j >= 0; j--) {
			var display = $(beforeArea).css("display");
			console.log("i : " + i);
			console.log("j : " + j);
			console.log("display : " + display);
			console.log("beforeArea : " + beforeArea);
			
			if(display != "block"){
				beforeArea = "#_content"+(j-1);
			}else{
				beforeArea = "#_content"+j;
				var content1 = $(beforeArea).val();
				var content2 = $(afterArea).val();
				console.log("content1 : " + content1);
				console.log("content2 : " + content2);
				$(beforeArea).val(content1+"\n"+content2);
				$(beforeArea).focus();
				break;
			}
			console.log("bbefore : " + beforeArea);
		}
		$(imgId).attr("src","");
		$(imgId).css("display","none");
		$(afterArea).css("display","none");
		$(afterArea).val("");
	}else{
		var imgId = "#_picture"+i;
		$(imgId).attr("src","");
		$(imgId).css("display","none");
	}
	drawFileNameDiv();
}
//////////선택한이미지 넣기
$(document).ready(function(){
	$("#_fileList0").change(function(){
		readImage(this,0);
	});
	$("#_fileList1").change(function(){
		readImage(this,1);
	});
	$("#_fileList2").change(function(){
		readImage(this,2);
	});
	$("#_fileList3").change(function(){
		readImage(this,3);
	});
	$("#_fileList4").change(function(){
		readImage(this,4);
	});
});
//선택한이미지 넣기
function readImage(input,i) {
	alert($(input).attr("id"));
		if ( input.files && input.files[0] ) {
			var FR= new FileReader();
			FR.onload = function(e) {
				var imgId = "#_picture"+i;
				var areaId = "#_content"+(i+1);
				
				 $(imgId).attr( "src", e.target.result );
				 $(imgId).css( "display", "block");
				 $(areaId).val("");
				 $(areaId).css( "display", "block");
				 $(areaId).focus();
			};       
			FR.readAsDataURL( input.files[0] );
		}
	}

$("#submit").click(function () {
	var title = $.trim($("#_title").val());
	var content = $.trim($("#_content0").val());
	var area = $("#_area option:selected").val();
	
	if(area == "null"){
		alert("여행지를 선택해 주세요.");
	}else if(title == ""){
		alert("제목을 작성해주세요");
	}else if(content == ""){
		alert("글을 작성해주세요");
	}else{
		$("#sub").val("true"); // 서브밋 제한 풀기
		$("#frm").attr({ "target":"_self", "action":"updatehmAf.do" }).submit();	
	}
	
});


</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
