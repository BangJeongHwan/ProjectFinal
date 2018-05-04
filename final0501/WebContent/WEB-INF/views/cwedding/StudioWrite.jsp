<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

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

<%-- <c:set var="fileIndex" value="0"/> --%>

<div align="center">
	<br><br><br>
	<div align="center" style="width:100%">
	
	<form action="addStudio.do" method="post" onsubmit="return checkSubmit()"
	enctype="multipart/form-data">			<!-- 파일 업로드를 위한 인코딩타입 설정 -->
	<!-- <form action="Studio.do" method="post" enctype="multipart/form-data">		 -->	
			<table>
				<colgroup>
					<col width="20%"><col width="20%"><col width="10%"><col width="20%"><col width="10%"><col width="20%">
				</colgroup>
				<tr>
					<td>회사 아이디</td>
					<td colspan="5">
						<input type="text" name="sdDto.cid" id="_cid" size="60"><font id="_cidCheckFld"></font>
					</td>
				</tr>
				<tr>
					<td>회사명</td>
					<td colspan="5">
						<input type="text" name="sdDto.cname" id="_cname" size="60" readonly>
					</td>
				</tr>
				<tr>
					<td>회사 주소</td>
					<td colspan="5">
						<input type="text" name="sdDto.addre" id="_address" size="60" readonly>
					</td>
				</tr>
				<tr>
					<td>상세내용</td>
					<td colspan="5">
						<textarea rows="5" cols="60" name="sdDto.content" id="_content" ></textarea>
					</td>
				</tr>
				
				<tr>
					<td>오픈시간</td>
					<td colspan="5">
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
							<c:forEach var="i" begin="0" end="60" step="15">
								<c:if test="${ i == 30 }">
									<option value="${ i }" selected>&nbsp;&nbsp;${ i }
								</c:if>
									<option value="${ i }">&nbsp;&nbsp;${ i }
							</c:forEach>
						</select>&nbsp;분
						<input type="hidden" name="sdDto.opentime" id="_opentime"><!-- hidden으로 변경 -->
					</td>
				</tr>
				<tr>
					<td>마감시간</td>
					<td colspan="5">
						<select id="_closetime1">
							<c:forEach var="i" begin="1" end="23" step="1">
								<c:if test="${ i == 20 }">
									<option value="${ i }" selected>&nbsp;&nbsp;${ i }
								</c:if>
									<option value="${ i }">&nbsp;&nbsp;${ i }
							</c:forEach>
						</select>&nbsp;시
						<select id="_closetime2">
							<c:forEach var="i" begin="0" end="60" step="15">
								<c:if test="${ i == 30 }">
									<option value="${ i }" selected>&nbsp;&nbsp;${ i }
								</c:if>
									<option value="${ i }">&nbsp;&nbsp;${ i }
							</c:forEach>
						</select>&nbsp;분
						<input type="hidden" name="sdDto.closetime" id="_closetime">
					</td>
				</tr>
				<tr id="_file0">
					<td id="_fileTh">사진업로드</td>
					<td id="_fileTd" colspan="5">
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
					<td>동영상업로드</td>
					<td colspan="5">
						<input type="file" name="videoload" id="videoload" size="60">
					</td>
				</tr>
				<tr id="_pd0">
					<td>옵션1<button type="button" onclick="addPd()">+</button></td>
					<td>
						<input type="text" name="sdPdList[0].title" id="_sdPdTitle0">
					</td>
					<td>가격</td>
					<td>
						<input type="text" name="sdPdList[0].price" id="_sdPdPrice0" onblur="checkNum(0)">
					</td>
					<td>내용</td>
					<td>
						<input type="text" name="sdPdList[0].content" id="_sdPdContent0">
					</td>
				</tr>
				<tr>
					<td colspan="6" style="align-content: center">
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
	var flag = false;

	if(!cidFlag) {
		alert("회사 아이디를 확인해주세요.");
	} else if ($("#_content").val().trim() == "") {
		alert("상세 내용을 입력해주세요.");
	} else {
		timeCheck();
		if (!timeFlag) {return false;}
		
		if($("#_sdPdTitle0").val().trim() == "" || $("#_sdPdPrice0").val().trim() == "") {
			alert("하나 이상의 옵션을 입력해주세요.");
		} else {
			flag = true;
						
			for (var i = 0; i < pdSize; i++) {
				var titleFldId = "#_sdPdTitle" + i;
				var priceFldId = "#_sdPdPrice" + i;
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
	}
	
	$("#_fileNameDiv").html(tagStr);
}

////////////////////////// 상품 옵션 관련
// 상품 옵션 입력시
function  checkNum(i) {
	var priceFldId = "#_sdPdPrice" + i;
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
	tagStr += "<input type='text' name='sdPdList["+ pdSize +"].title' id='_sdPdTitle"+ pdSize +"'>"
	tagStr += "</td>";
	tagStr += "<td>가격</td>";
	tagStr += "<td>";
	tagStr += "<input type='text' name='sdPdList["+ pdSize +"].price' id='_sdPdPrice"+ pdSize +"' onblur='checkNum("+ pdSize +")' >"
	tagStr += "</td>";
	tagStr += "<td>내용</td>";
	tagStr += "<td>";
	tagStr += "<input type='text' name='sdPdList["+ pdSize +"].content' id='_sdPdContent"+ pdSize +"' >"
	tagStr += "</td>";
	tagStr += "</tr>";
	var siblingTrId = "#_pd" + (pdSize - 1);
	$(tagStr).insertAfter($(siblingTrId));

	pdSize++;
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
					$("#_address").val(msg.message.address);
					cidFlag = true;
				}
			},
			error:function(reqest, status, error){
				alert("실패");
			}
		});
	});
		
});

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