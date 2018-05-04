<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  

<br>
<style type="text/css">
table {
	border: 1px solid #EBEBEB;
	align-content: center;
	width: 300px;
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

<div align="center">
<h5>회원님의 개인정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주십시오</h5>
<table class="list_table" style="width:25%;" >
	<colgroup>
		<col width="20"/><col width="40"/>
	</colgroup>
	
	<tr>
		<td>아이디</td>
		<th><input type="text" name="id" id="_id" size="10" value="${id }" readonly="readonly" style="border: 0"></th>
	</tr>
	
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="pwd" id="_pwd" size="10">
		</td>
	</tr>
	
	<tr style="text-align: center">
		<td colspan="2">
			<button id="_btnCheck">확인</button>
		</td>
	</tr>
	
	</table>
</div>
<br><br><br>
<script>
$("#_btnCheck").click(function() {
	if($("#_pwd").val() == ""){
		alert("패스워드를 입력해 주십시오" );
		$("#_pwd").focus();
	}else{
		go();
	}	
});

function go() {
	var id = $("#_id").val();
	var pwd = $("#_pwd").val();
	console.log("id = " + id);
	console.log("pwd = " + pwd);
	$.ajax({
		type:"post",
		url:"checkPwd.do",
		data:"id=" + id+"&pwd=" + pwd,
		async:true,
		success:function(data){
			if(data=="true"){
				location.href="memMypageUpdate.do";
			}else{
				$("#_pwd").val("");
				alert("ID와 PWD가 맞지않습니다.");
			}
		}		
	});
}

</script>











