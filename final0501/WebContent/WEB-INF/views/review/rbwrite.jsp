<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<form name="frmForm" id="_frmForm" action="rwriteAf.do" method="post" 
enctype="multipart/form-data">
<input type="hidden" name="rpdseq" value="${rpdseq}">

<%
LoginDto mem = (LoginDto)session.getAttribute("login");

if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>
<table>
	<tr>
		<td>회원ID</td>
		<td><input type="text" name = "mname" value = "<%=mem.getId() %>" readonly="readonly"> </td>
	</tr>
	<tr>
		<td>이미지</td>
	<td><input type="button" onClick="addFile();" value="추가">
	   <table id="fileDiv">
	      <tr>
	         <td><input type="file" name="files[0]"/></td>
	      </tr>
	   </table>
	</td>
	</tr>
	<tr>
		<td>상품종류</td>
		<td>상품종류<select name="p_value">
			<option value="" selected="selected">종류 선택</option>
			<option value="hall">웨딩홀</option>
			<option value="studio">스튜디오</option>
			<option value="dress">드레스</option>
			<option value="makeup">메이크업</option>
			<option value="card">청첩장</option>
		</select>
		상품이름<select name="p_name">
			<option value="" selected="selected">이름 선택</option>
		</select>
		</td>
		<
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
<button id = "rwrite">글쓰기</button>
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
   html += "   <td><input type='file' name='files["+fileUploadCount+"]'/></td>";
   html += "</tr>";
   
   list.append(html);
   
}
</script>
