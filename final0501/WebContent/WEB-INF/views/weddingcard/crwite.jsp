<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<form name="frmForm" id="_frmForm" action="crwriteAf.do" method="post" 
enctype="multipart/form-data">
<table>
	<tr>
		<td>회원ID</td>
		<td><input type="text" name = "cid"></td>
	</tr>
	<tr>
		<td>이미지</td>
		<td><input type = "file" name="picture" style=" width : 400px;"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="10" cols="50" name="content" id="_content"></textarea></td>
	</tr>
</table>
<button id = "card_write">글쓰기</button>
</form>

<script>
$("#card_write").click(function () {
	alert("글쓰기");
	$("#_frmForm").submit();
});
function submitContents(elClickedObj) {
	   // 에디터의 내용이 textarea에 적용된다.
	   oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
	 
	   // 에디터에 입력된 내용의 검증은 이곳에서
	   // document.getElementById("ir1").value 값을 이용해서 처리한다.
	 
	   try{
	       // 이 라인은 현재 사용 중인 폼에 따라 달라질 수 있다.
	       //elClickedObj.form.submit();
	       elClickedObj.submit();
	   }catch(e){}
	}

	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "_content",
	    sSkinURI: "./se2/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
</script>
