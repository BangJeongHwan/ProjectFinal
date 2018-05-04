<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>

<h2>업체 수정하기</h2>

<form name="frmForm" id="_frmForm" action="ccupdateAf.do" method="post" 
enctype="multipart/form-data">
<input type="hidden" name="wiseq" value="${ccd.wiseq}">
<table>
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>
	<tr>
		<td>업체아이디</td>
		<td>${ccd.cid}</td>
	</tr>
	<tr>
		<td>업체이름</td>
		<td><input type="text" name="cname" value="${ccd.cname}"></td>
	</tr>
	<tr>
		<td>업체사진</td>
		<td style="text-align: left"><input type="text" name='filename' value="${ccd.picture}" size="50" readonly="readonly"/>
	<input type="file" name="pname"  style=" width : 400px;"></td>
	</tr>
	<tr>
		<td>소개글</td>
		<td><textarea rows="10" cols="50" name="content" id="_content">${ccd.content}</textarea></td>
	</tr>
</table><br>
<span><button id = "updatebtn">수정하기</button></span>
<br>

</form>

<script type="text/javascript">
$("#updatebtn").click(function() {	
	alert('수정하기');	
	$("#_frmForm").attr({ "target":"_self", "action":"ccupdateAf.do" }).submit();
});

</script>