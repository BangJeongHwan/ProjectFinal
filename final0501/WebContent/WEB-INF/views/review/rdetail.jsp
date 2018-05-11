<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<style>
#ccdetail_main{
margin-left:100px;
margin-right:20px;
}
table th,td{
border: 1px solid black;
text-align: center;
}
button{
text-align: center;
align: center;
}
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
<form name="frmForm" id="_frmForm" action="rupdate.do?rseq=${dto.rseq}" method="post" >
<div id = "ccdetail_main">
<h2>후기 상세보기</h2>

<table>
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="mid" value="${dto.mid}"></td>
	</tr>
	<tr>
		<td>상품이름</td>
		<td>${dto.pname}</td>
	</tr>
	<tr>
		<td>등록일자</td>
		<td>${dto.rdate}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${dto.title}</td>
	</tr>

	<c:if test="${dto.pic0 ne 'null'}">
	<tr>
		<td>사진</td>
		<td><input type="text" name="pic0" value="${dto.pic0}"><img src="upload/${dto.pic0}"></td>
	</tr>
	</c:if>

	<c:if test="${dto.pic1 ne 'null'}">
		<tr>
		<td>사진</td>
		<td><input type="text" name="pic1" value="${dto.pic1}"><img src="upload/${dto.pic1}"></td>
	</tr>
	</c:if>

	<c:if test="${dto.pic2 ne 'null'}">
		<tr>
		<td>사진</td>
		<td><input type="text" name="pic2" value="${dto.pic2}"><img src="upload/${dto.pic2}"></td>
	</tr>
	</c:if>
	<c:if test="${dto.pic3 ne 'null'}">
		<tr>
		<td>사진</td>
		<td><input type="text" name="pic3" value="${dto.pic3}"><img src="upload/${dto.pic3}"></td>
	</tr>
	</c:if>

	<tr>
		<td>내용</td>
		<td><textarea rows="10" cols="50" name="content" id="_content">${dto.content}</textarea></td>
	</tr>
</table><br>
<span><button id="rupdatebtn">수정하기</button></span>
<span><button id="likebtn"">추천하기</button></span>
<br>

</div>
</form>

<script>
$("#likebtn").click(function() {
	alert('추천하기');
	$("#_frmForm").attr({ "target":"_self", "action":"rlike.do?rseq=${dto.rseq}"}).submit();
});

$("#rupdatebtn").click(function() {
	alert('수정하기');
	$("#_frmForm").attr({ "target":"_self", "action":"rupdate.do?rseq=${dto.rseq}"}).submit();
});
</script>