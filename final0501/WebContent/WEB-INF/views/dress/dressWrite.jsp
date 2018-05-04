<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>

<style type="text/css">
table {
	border: 1px solid #EBEBEB;
	align-content: center;
	width: 300px;
}
td font{
	font-size:12px;color:#0000ff;margin:8px 0 0 8px;letter-spacing:-0.5px;
}
tr{
	height: 60px;
	padding:  20px 20px;
}
td{
	 align-content: center;
}
td:nth-child(even) {
    background-color:white;
}
</style>

<div align="center">
<br><br><br>
<div align="center" style="width:100%">

<form action="dressupload.do" method="post" onsubmit="return checkSubmit()" enctype="multipart/form-data">
<table style="width:70%;">
<colgroup>
<col width="200px"><col width="450px">
</colgroup>

<tr>
	<th style="text-align: center">업체 아이디</th>
	<td><input type="text" name="Ddto.cid" id="_cid" size="70"><font id="_cidCheckFld"></td>
</tr>
<tr>
	<th style="text-align: center">업체 이름</th>
	<td><input type="text" name="Ddto.dname" id="_cname" size="70" readonly="readonly"></td>
</tr>

<tr id="_file0">
	<td id="_fileTh" style="text-align: center">사진업로드</td>
	<td id="_fileTd" colspan="3">
		<button type="button" id="_fileBtn" onclick="fileBtn()">사진 선택</button>&nbsp;<font>최대 10개까지 가능합니다.</font>
		<!--  style="display:none;" -->
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
		<div id="_fileNameDiv" style="height:260px; padding:10px; border:1px solic black;"></div>
	</td>
</tr>

<tr>
	<th style="text-align: center">소개 글</th>
	<td><input type="text" name="Ddto.content" id="_content" size="70"></td>
</tr>

<tr>
	<th style="text-align: center">영업 시간</th>
	<td><input type="text" name="Ddto.opentime" id="_opentime" size="70"></td>
</tr>

<tr>
	<th style="text-align: center">주소</th>
	<td><input type="text" name="Ddto.addre" id="_addre" size="70" readonly="readonly"></td>
</tr>

<tr>
	<td colspan="2" style="text-align: center">
		<input type="submit" value="전송">
	</td>
</tr>
</table>
</form>
</div>
</div>


<script type="text/javascript">
var cidFlag = false;
var timeFlag = false;
var fileSize = 0;
var fileNameArray = new Array("", "", "", "", "", "", "", "", "", "");
var pdSize = 1;

function checkSubmit() {
	var flag = true;

	if ($("#_content").val().trim() == "") {
		alert("상세 내용을 입력해주세요.");
		flag=false;
	}
	return flag;
}

////////////////////// 파일관련
// 파일 선택버튼 클릭시
function fileBtn() {
	for (var i = 0; i < fileNameArray.length; i++) {
		if (fileNameArray[i] == "") {
			var inputFileId = "#_fileList" + i;
			$(inputFileId).click();
			break;
		}
	}
}

// 파일선택시
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
	if (fileSize >= 10) {
		$("#_fileBtn").attr("disabled", "disabled");
	} else {
		$("#_fileBtn").removeAttr("disabled");
	}
	
	drawFileNameDiv();
}

// 파일 삭제 버튼 클릭
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

// _fileNameDiv 생성
function drawFileNameDiv() {
	var tagStr = "";
	for (var i = 0; i < 10; i++) {
		if (fileNameArray[i] != "") {
			tagStr += "<button type='button' onclick='delfile(" + i +")'>삭제</button>&nbsp;&nbsp;";
			tagStr += fileNameArray[i];
			tagStr += "<br>";
		}
	}
	
	$("#_fileNameDiv").html(tagStr);
}

$(document).ready(function () {
	
	// 회사아이디 등급 확인
 	$("#_cid").blur(function () {
		$.ajax({
			url:"checkCompanyGrade.do",
			type:"get",
			data:"cid=" + $("#_cid").val(),
			success:function(msg){
				if(msg.message == "null") {
					$("#_cidCheckFld").text("존재하지 않는 회사입니다.");
				} else if (msg.message == "false") {
					$("#_cidCheckFld").text("등급이 맞지 않습니다.");
				} else {
					$("#_cidCheckFld").text("");
					$("#_cid").attr("readonly", "readonly");
					$("#_cname").val(msg.message.cname);
					$("#_addre").val(msg.message.address);
					cidFlag = true;
				}
			},
			error:function(reqest, status, error){
				alert("실패");
			}
		});
	});
		
});


</script>
