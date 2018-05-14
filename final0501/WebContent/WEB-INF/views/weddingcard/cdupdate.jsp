<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
    
<style>
.main{
	width: 90%;
	height: 100%;
	background-color: white;
	margin : 0 auto;
	align: center;
	text-align: center;
	margin-top: 50px;
	margin-left: 300px;
}
 table { 
 	border: 1px solid #EBEBEB; 
 	width: 70%;
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
button{
text-align: center;
align: center;
width: 100px;
}
img{
	width:200px;
height:170px;
}

</style>    
    
<form name="frmForm" id="_frmForm" action="cdupdateAf.do?cdseq=${cdd.cdseq}" method="post" 
enctype="multipart/form-data">
<input type="hidden" name="cdseq" value="${cdd.cdseq}">
<div class="main">
<table id="list_table">
<colgroup>
		<col width="100"/><col width="300"/>
	</colgroup>
	<tr>
		<td>업체ID</td>
		<td>${cdd.cid}</td>
	</tr>
	<tr>
		<td>청첩장이름</td>
		<td><input type="text" name="title" value="${cdd.title}"></td>
	</tr>
	<tr>
		<td>청첩장종류</td>
		<td>
		<c:if test="${cdd.category eq 'mobile'}">
			모바일
		</c:if>
		<c:if test="${cdd.category eq 'analog'}">	
			아날로그
		</c:if>
		</td>
		
	</tr>
	<tr>
		<td>봉투</td>
		<td>
		<c:if test="${cdd.cbag eq 2}">
			봉투있음
		</c:if>
		<c:if test="${cdd.cbag eq 1}">
			봉투없음
		</c:if>
		</td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input type="text" name="price" value="${cdd.price}"></td>
	</tr>
	<tr>
		<td>청첩장크기</td>
		<td>
		<c:if test="${cdd.cardsize eq 'recwidth' }">
		직사각형(가로)(171*116mm)
		</c:if>
		<c:if test="${cdd.cardsize eq 'recheight' }">
		직사각형(세로)(116*171mm)
		</c:if>
		<c:if test="${cdd.cardsize eq 'square' }">
		정사각형(141*141mm)
		</c:if>
		</td>
	</tr>
	<input type="hidden" name="filenames" value="">
	<tr>
		<td>이미지</td>
	<td><input type="button" onClick="addFile();" value="추가">
	   <table id="fileDiv">
	      <tr>
	         <td><input type="file" name="files"/></td>
	      </tr>
	   </table>
	</td>
	</tr>
	<tr>
		<td>사진1</td>
		<td><input type="text" name="filenames" value="${cdd.picture0 }"><img src = "upload/${cdd.picture0}"/>
		<input type="button" onclick="fdelete(this)" value="삭제"></td>
	<tr>
	    <td>사진2</td>
	    <td><input type="text" name="filenames" value="${cdd.picture1 }"><img src = "upload/${cdd.picture1}"/>
	    <input type="button" onclick="fdelete(this)" value="삭제"></td>
	</tr>
	<tr>
	    <td>사진3</td>
	    <td><input type="text" name="filenames" value="${cdd.picture2 }"><img src = "upload/${cdd.picture2}"/>
	    <input type="button" onclick="fdelete(this)" value="삭제"></td>
	</tr>
	<tr>
	    <td>사진4</td>
	    <td><input type="text" name="filenames" value="${cdd.picture3 }"><img src = "upload/${cdd.picture3}"/>
	    <input type="button" onclick="fdelete(this)" value="삭제"></td>
	</tr>
	
	<tr>
		<td>소개글</td>
		<td><textarea rows="10" cols="50" name="content" id="_content">${cdd.content}</textarea></td>
	</tr>

	   </table>

<button id = "card_update">확인</button>
<button id="ccdelete">삭제</button>
</div>
</form>

<script>
$("#card_update").click(function() {
	alert('수정하기');
	$("#_frmForm").attr({ "target":"_self", "action":"cdupdateAf.do?cdseq=${cdd.cdseq}"}).submit();
});

$("#ccdelete").click(function() {
	alert('삭제하기');
	$("#_frmForm").attr({ "target":"_self", "action":"ccdelete.do?cdseq=${cdd.cdseq}"}).submit();
});

var fileUploadCount=0;
function addFile(){       
   
   var list = $('#fileDiv');
   var data = list.find("tr").eq(list.find("tr").length-1).find("input[type=file]").attr("name");

   fileUploadCount++;

   var html = "";
   html += "<tr>"; 
   html += "   <td><input type='file' name='files'/></td>";
   html += "</tr>";
   
   list.append(html);
   
}



function fdelete(a) {
	var table=document.getElementById("list_table");
	var i = a.parentNode.parentNode.rowIndex;
	table.deleteRow(i);
}

</script>