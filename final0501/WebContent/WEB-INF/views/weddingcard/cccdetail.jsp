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
    
<form name="frmForm" id="_frmForm" action="cdupdate.do?cdseq=${dto.cdseq}" method="post" 
enctype="multipart/form-data">
<div class="main">
<table>
<colgroup>
		<col width="100"/><col width="300"/>
	</colgroup>
	<tr>
		<td>업체ID</td>
		<td>${dto.cid}</td>
	</tr>
	<tr>
		<td>청첩장이름</td>
		<td>${dto.title}</td>
	</tr>
	<tr>
		<td>청첩장종류</td>
		<td>
		<c:if test="${dto.category eq 'mobile'}">
			모바일
		</c:if>
		<c:if test="${dto.category eq 'analog'}">	
			아날로그
		</c:if>
		</td>
		
	</tr>
	<tr>
		<td>봉투</td>
		<td>
		<c:if test="${dto.cbag eq 2}">
			봉투있음
		</c:if>
		<c:if test="${dto.cbag eq 1}">
			봉투없음
		</c:if>
		</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>${dto.price}</td>
	</tr>
	<tr>
		<td>청첩장크기</td>
		<td>
		<c:if test="${dto.cardsize eq 'recwidth' }">
		직사각형(가로)(171*116mm)
		</c:if>
		<c:if test="${dto.cardsize eq 'recheight' }">
		직사각형(세로)(116*171mm)
		</c:if>
		<c:if test="${dto.cardsize eq 'square' }">
		정사각형(141*141mm)
		</c:if>
		</td>
	</tr>
	<tr>
		<td>메인사진</td>
		<td><img src = "upload/${dto.picture0}"/></td>
	<tr>
	    <td>사진1</td>
	    <td><img src = "upload/${dto.picture1}"/></td>
	</tr>
	<tr>
	    <td>사진2</td>
	    <td><img src = "upload/${dto.picture2}"/></td>
	</tr>
	<tr>
	    <td>사진3</td>
	    <td><img src = "upload/${dto.picture3}"/></td>
	</tr>
	   </table>

<button id = "card_update">수정하기</button>
<button id="ccdelete">삭제하기</button>
</div>
</form>

<script>
$("#card_update").click(function() {
	alert('수정하기');
	$("#_frmForm").attr({ "target":"_self", "action":"cdupdate.do?cdseq=${dto.cdseq}"}).submit();
});

$("#ccdelete").click(function() {
	alert('삭제하기');
	$("#_frmForm").attr({ "target":"_self", "action":"ccdelete.do?cdseq=${dto.cdseq}"}).submit();
});

</script>