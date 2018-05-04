<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  

<style>
.main{
	width: 80%;
	height: 100%;
	background-color: white;
	margin : 0 auto;
	align: center;
	text-align: center;
	margin-top: 50px;
}
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
<div class="main">
<form name="frmForm" id="_frmForm" action="cardwriteAf.do" method="post" 
enctype="multipart/form-data">
<table>
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>
	<tr>
		<td>업체아이디</td>
		<td><input type="text" name = "cid"></td>
	</tr>
	<tr>
		<td>업체사진</td>
		<td><input type = "file" name="pname" style=" width : 400px;"></td>
	</tr>
	<tr>
		<td>소개글</td>
		<td><textarea rows="10" cols="50" name="content" id="_content"></textarea></td>
	</tr>
	<tr>
	<td colspan="2">
	<span><a href="#none" id="card_write" title="확인">확인</a></span>
	</td>
	</tr>
</table>

</form>
</div>
<script type="text/javascript">
$("#card_write").click(function() {
	alert("글쓰기");
	$("#_frmForm").submit();
});

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
					$("#_addre").val(msg.message.address);
					cidFlag = true;
				}
			},
			error:function(reqest, status, error){
				alert("실패");
			}
		});
	});
		
});
// $("#cid").blur(function () {
// 	$.ajax({
// 		url:"cidcheck.do",
// 		type:"get",
// 		data:"cid=" + $("#cid").val(),
// 		success:function(msg){
// 			if(msg.message =="null"){
// 				$("#cidcheck").text("존재하지 않는 회사입니다.");
// 			}else if(msg.message =="false"){
// 				$()
// 			}
// 		}
		
// 	});
// });


</script>
