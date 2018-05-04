<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<%
LoginDto mem = (LoginDto)session.getAttribute("login");
if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>
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
	 align-content: center;
}
td:nth-child(even) {
    background-color:white;
}

</style>

<!--fileName setting  -->
<script type="text/javascript">
var fileSize = 0;
var fileNameArray = new Array("", "", "", "", "", "", "", "", "", "");
var pdSize = 0;
</script>

<!--fileName setting  -->
<c:forEach items="${ Ddto.pic }" var="pic" varStatus="i">
	<c:if test="${ not empty Ddto.pic[i.index] && Ddto.pic[i.index] != '' }">
		<script type="text/javascript">
			fileNameArray[fileSize] = "${Ddto.pic[i.index]}";
			fileSize++;
		</script>
	</c:if>
</c:forEach>


<div align="center">
	<br><br><br>
	<div align="center" style="width:100%" class="addmu">
	
	<form action="dressUpdateAf.do" method="post" onsubmit="return checkSubmit()"
	enctype="multipart/form-data">			<!-- 파일 업로드를 위한 인코딩타입 설정 -->
	<!-- <form action="addMu.do" method="post" enctype="multipart/form-data">		 -->
	
		<input type="hidden" name="Ddto.dsseq" value="${Ddto.dsseq}">
		<input type="hidden" value="${Ddto.dsseq }" name="pdseq" id="_pdseq">
		<input type="hidden" value="${login.id }" name="usid" id="_mid">	
			<table>
				<colgroup>
					<col width="20%"><col width="30%"><col width="20%"><col width="30%">
				</colgroup>
				<tr>
					<td>회사 아이디</td>
					<td colspan="3">
						<input type="text" name="Ddto.cid" id="_cid" size="60" value="${Ddto.getCid()}" readonly>
					</td>
				</tr>
				<tr>
					<td>회사 이름</td>
					<td colspan="3">
						<input type="text" name="Ddto.dname" id="_dname" size="60" value="${Ddto.getDname()}" readonly>
					</td>
				</tr>
				<tr>
					<td>회사 주소</td>
					<td colspan="3">
						<input type="text" name="Ddto.addre" id="_address" size="60" value="${Ddto.getAddre()}">
					</td>
				</tr>
				<tr>
					<td>영업 시간</td>
					<td colspan="3">
						<input type="text" name="Ddto.opentime" id="_opentime" size="60" value="${Ddto.getOpentime()}">
					</td>
				</tr>
				<tr>
					<td>상세내용</td>
					<td colspan="3">
						<textarea rows="5" cols="60" name="Ddto.content" id="_content" >${Ddto.getContent()}</textarea>
					</td>
				</tr>

				<tr id="_file0">
					<td id="_fileTh">사진업로드</td>
					<td id="_fileTd" colspan="3">
						<button type="button" id="_fileBtn" onclick="fileBtn()">사진 선택</button>&nbsp;<font>최대 10개까지 가능합니다.</font>
						<!--  style="display:none;" -->
						<input type="text" name="fileNameList[0]" id="_fileNameList0" value="">
						<input type="text" name="fileNameList[1]" id="_fileNameList1" value="">
						<input type="text" name="fileNameList[2]" id="_fileNameList2" value="">
						<input type="text" name="fileNameList[3]" id="_fileNameList3" value="">
						<input type="text" name="fileNameList[4]" id="_fileNameList4" value="">
						<input type="text" name="fileNameList[5]" id="_fileNameList5" value="">
						<input type="text" name="fileNameList[6]" id="_fileNameList6" value="">
						<input type="text" name="fileNameList[7]" id="_fileNameList7" value="">
						<input type="text" name="fileNameList[8]" id="_fileNameList8" value="">
						<input type="text" name="fileNameList[9]" id="_fileNameList9" value="">
						
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
				<br>
				<tr>
					<td colspan="4" style="align-content: center">
						<input type="submit" value="수정">&nbsp;&nbsp;
						<input type="button" onclick="detailView(${Ddto.dsseq})" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<script type="text/javascript">
var timeFlag = false;

drawFileNameDiv();

function detailView(dsseq) {
	location.href = "dressDetail.do?dsseq="+dsseq;
}

function checkSubmit() {
	var flag = true;

	if ($("#_content").val().trim() == "") {
		alert("상세 내용을 입력해주세요.");
		flag = false;
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
		var fileNameInputId = "#_fileNameList" + i;
		$(fileNameInputId).val(fileNameArray[i]);
	}
	
	$("#_fileNameDiv").html(tagStr);
}

</script>


