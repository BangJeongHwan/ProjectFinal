<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<%-- 
<%
LoginDto mem = (LoginDto)session.getAttribute("login");
if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>
 --%>
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


<script type="text/javascript">
var fileSize = 0;
var fileNameArray = new Array("", "", "", "", "", "", "", "", "", "");
var pdSize = 0;
</script>
 
<!--fileName setting  -->
<c:forEach items="${ muDto.pic }" var="pic" varStatus="i">
	<c:if test="${ not empty muDto.pic[i.index] && muDto.pic[i.index] != '' }">
		<script type="text/javascript">
			fileNameArray[fileSize] = "${muDto.pic[i.index]}";
			fileSize++;
		</script>
	</c:if>
</c:forEach>

<div align="center">
	<br><br><br>
	<div align="center" style="width:100%" class="addmu">
	
	<form action="modMu.do" method="post" onsubmit="return checkSubmit()"
	enctype="multipart/form-data">			<!-- 파일 업로드를 위한 인코딩타입 설정 -->
	<!-- <form action="addMu.do" method="post" enctype="multipart/form-data">		 -->
		<input type="hidden" name="muDto.museq" value="${ muDto.museq }">
		<%-- <input type="hidden" name="pdseq" value="${muDto.museq }">
		<input type="hidden" name="usid" value="<%=mem.getId()%>"> --%>
			<table>
				<colgroup>
					<col width="20%"><col width="30%"><col width="20%"><col width="30%">
				</colgroup>
				<tr>
					<td>회사 아이디</td>
					<td colspan="3">
						<input type="text" name="muDto.cid" id="_cid" size="60" value="${muDto.cid}" readonly>
					</td>
				</tr>
				<tr>
					<td>회사명</td>
					<td colspan="3">
						<input type="text" name="muDto.cname" id="_cname" size="60" value="${muDto.cname}" value= readonly>
					</td>
				</tr>
				<tr>
					<td>회사 주소</td>
					<td colspan="3">
						<input type="text" name="muDto.address" id="_address" size="60" value="${muDto.address}" readonly>
					</td>
				</tr>
				<tr>
					<td>상세내용</td>
					<td colspan="3">
						<textarea rows="5" cols="60" name="muDto.content" id="_content" >${muDto.content}</textarea>
					</td>
				</tr>
				
				<tr>
					<td>오픈시간</td>
					<td colspan="3">
						<select id="_opentime1">
							<c:forEach var="i" begin="1" end="23" step="1">
								<c:if test="${ i == openHour }">
									<option value="${ i }" selected>&nbsp;&nbsp;${ i }</option>
								</c:if>
								<c:if test="${ i != openHour }">
									<option value="${ i }">&nbsp;&nbsp;${ i }</option>
								</c:if>
							</c:forEach>
						</select>&nbsp;시
						<select id="_opentime2">
							<c:forEach var="i" begin="0" end="45" step="15">
								<c:if test="${ i == openMin }">
									<option value="${ i }" selected>&nbsp;&nbsp;${ i }</option>
								</c:if>
								<c:if test="${ i != openMin }">
									<option value="${ i }">&nbsp;&nbsp;${ i }</option>
								</c:if>
							</c:forEach>
						</select>&nbsp;분
						<input type="hidden" name="muDto.opentime" id="_opentime"><!-- hidden으로 변경 -->
					</td>
				</tr>
				<tr>
					<td>마감시간</td>
					<td colspan="3">
						<select id="_closetime1">
							<c:forEach var="i" begin="1" end="23" step="1">
								<c:if test="${ i == closeHour }">
									<option value="${ i }" selected>&nbsp;&nbsp;${ i }</option>
								</c:if>
								<c:if test="${ i != closeHour }">
									<option value="${ i }">&nbsp;&nbsp;${ i }</option>
								</c:if>
							</c:forEach>
						</select>&nbsp;시
						<select id="_closetime2">
							<c:forEach var="i" begin="0" end="45" step="15">
								<c:if test="${ i == closeMin }">
									<option value="${ i }" selected>&nbsp;&nbsp;${ i }
								</c:if>
								<c:if test="${ i != closeMin }">
									<option value="${ i }">&nbsp;&nbsp;${ i }</option>
								</c:if>
							</c:forEach>
						</select>&nbsp;분
						<input type="hidden" name="muDto.closetime" id="_closetime">
					</td>
				</tr>
				<tr id="_file0">
					<td id="_fileTh">사진업로드</td>
					<td id="_fileTd" colspan="3">
						<button type="button" id="_fileBtn" onclick="fileBtn()">사진 선택</button>&nbsp;<font>최대 10개까지 가능합니다.</font>
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
				<c:forEach items="${ mupdList }" var="mupd" varStatus="i">
					<c:if test="${ i.index == 0 }">
						<tr id="_pd${ i.index }">
							<td>
								옵션1
								<button type="button" onclick="addPd()">＋</button>
								<button type="button" onclick="delPd()">－</button>
							</td>
							<td>
								<input type="text" name="muPdList[${ i.index }].title" id="_muPdTitle${ i.index }" value="${ mupd.title }">
							</td>
							<td>가격</td>
							<td>
								<input type="text" name="muPdList[${ i.index }].price" id="_muPdPrice${ i.index }" onblur="checkNum(${ i.index })" value="${ mupd.price }">
							</td>
						</tr>
					</c:if>
					<c:if test="${ i.index != 0 }">
						<tr id="_pd${ i.index }">
							<td>옵션${ i.index + 1 }</td>
							<td>
								<input type="text" name="muPdList[${ i.index }].title" id="_muPdTitle${ i.index }" value="${ mupd.title }">
							</td>
							<td>가격</td>
							<td>
								<input type="text" name="muPdList[${ i.index }].price" id="_muPdPrice${ i.index }" onblur="checkNum(${ i.index })" value="${ mupd.price }">
							</td>
						</tr>
					</c:if>
					<script type="text/javascript">
						pdSize++;
					</script>
				</c:forEach>
				<tr>
					<td colspan="4" style="align-content: center">
						<input type="submit" value="수정">&nbsp;&nbsp;
						<input type="button" onclick="detailView(${muDto.museq})" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<script type="text/javascript">
var timeFlag = false;

drawFileNameDiv();

function detailView(museq) {
	location.href = "muDetailView.do?museq=" + museq;
}

function checkSubmit() {
	var flag = false;

	if ($("#_content").val().trim() == "") {
		alert("상세 내용을 입력해주세요.");
	} else {
		timeCheck();
		if (!timeFlag) {return false;}
		
		if($("#_muPdTitle0").val().trim() == "" || $("#_muPdPrice0").val().trim() == "") {
			alert("하나 이상의 옵션을 입력해주세요.");
		} else {
			flag = true;
						
			for (var i = 0; i < pdSize; i++) {
				var titleFldId = "#_muPdTitle" + i;
				var priceFldId = "#_muPdPrice" + i;
				if ($(titleFldId).val().trim() == "" || $(priceFldId).val().trim() == "") {
					alert("옵션을 전부 입력해주세요.");
					flag = false;
					break;
				}
			}
			
		}
	}
	
	return flag;
}

// 오픈시간, 마감시간 확인
function timeCheck() {
	var openhour = parseInt($("#_opentime1").val());
	var openmin = parseInt($("#_opentime2").val());
	var closehour = parseInt($("#_closetime1").val());
	var closemin = parseInt($("#_closetime2").val());
	if (openhour > closehour) {
		alert("오픈시간과 마감시간을 확인해주세요.");
		timeFlag = false;
	} else if (openhour == closehour && openmin >= closemin) {
		alert("오픈시간과 마감시간을 확인해주세요.");
		timeFlag = false;
	} else {
		var opentime = "" + two(openhour) + ":" + two(openmin);
		$("#_opentime").val(opentime);
		var closetime = "" + two(closehour) + ":" + two(closemin);
		$("#_closetime").val(closetime);
		timeFlag = true;
	}
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

////////////////////////// 상품 옵션 관련
// 상품 옵션 입력시
function  checkNum(i) {
	var priceFldId = "#_muPdPrice" + i;
	if (!isNum($(priceFldId).val())) {
		alert("숫자만 입력해주세요.");
		$(priceFldId).val("");
		$(priceFldId).focus();
	}
}

function addPd() {
	var tagStr = "<tr id='_pd"+ pdSize +"'>";
	tagStr += "<td>옵션"+ (pdSize+1) +"</td>";
	tagStr += "<td>";
	tagStr += "<input type='text' name='muPdList["+ pdSize +"].title' id='_muPdTitle"+ pdSize +"'>"
	tagStr += "</td>";
	tagStr += "<td>가격</td>";
	tagStr += "<td>";
	tagStr += "<input type='text' name='muPdList["+ pdSize +"].price' id='_muPdPrice"+ pdSize +"' onblur='checkNum("+ pdSize +")' >"
	tagStr += "</td>";
	tagStr += "</tr>";
	var siblingTrId = "#_pd" + (pdSize - 1);
	$(tagStr).insertAfter($(siblingTrId));

	pdSize++;
}

function delPd() {
	if (pdSize > 1) {
		var pdTrId = "#_pd" + (pdSize - 1);
		$(pdTrId).remove();
		pdSize--;
	} else {
		alert("옵션은 적어도 하나 이상 작성해주세요.");
	}
}

function two(num) {
	if (num < 10) {
		return "0" + num;
	} else {
		return "" + num;
	}
}

//숫자이면 true
function isNum(str) {
	for( var i = 0; i <= str.length -1 ; i++ ) {
		if (str.charAt(i) >= '0' && str.charAt(i) <= '9') {
		} else {
			return false;
		}
	}
	return true;
}

</script>
















