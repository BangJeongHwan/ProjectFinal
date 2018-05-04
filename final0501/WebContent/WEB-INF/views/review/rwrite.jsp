<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</style>

<form name="frmForm" id="_frmForm" action="rwriteAf.do" method="post" 
enctype="multipart/form-data">
<input type="hidden" name="rpdseq" value="${rpdseq}">

<%
//다운로드할 경로
String fupload = request.getServletContext().getRealPath("/upload");
%>
<input type="hidden" name="upDir" value="<%=fupload %>"/>
<%
LoginDto mem = (LoginDto)session.getAttribute("login");

if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>
<div class="main">
<table>
	<tr>
		<td>회원ID</td>
		<td><input type="text" name = "mid" value = "<%=mem.getId() %>" readonly="readonly"> </td>
	</tr>
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
		<td>상품이름</td>
		<td><input type="text" name="pname" value="${pname}"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="10" cols="50" name="content" id="_content"></textarea></td>
	</tr>
</table>
<br><br>
<button id = "rwrite">글쓰기</button>
</div>
</form>

<script>
$("#rwrite").click(function () {
	alert("글쓰기");
	$("#_frmForm").submit();
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
</script>
