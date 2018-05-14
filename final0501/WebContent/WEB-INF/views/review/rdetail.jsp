<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<%
LoginDto mem = (LoginDto)session.getAttribute("login");
if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>
<style>
#ccdetail_main{
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
<form name="frmForm" id="_frmForm" action="" method="post" >
<div id = "ccdetail_main">
<h2>�ı� �󼼺���</h2>

<table>
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>
	<tr>
		<td>���̵�</td>
		<td><input type="text" name="mid" value="${dto.mid}"></td>
	</tr>
	<tr>
		<td>��ǰ�̸�</td>
		<td>${dto.pname}</td>
	</tr>
	<tr>
		<td>��õ��</td>
		<td>${dto.rlike}</td>
	</tr>
	<tr>
		<td>�������</td>
		<td>${dto.rdate}</td>
	</tr>
	<tr>
		<td>����</td>
		<td>${dto.title}</td>
	</tr>

	<c:if test="${dto.pic0 ne 'null'}">
	<tr>
		<td>����</td>
		<td><input type="text" name="pic0" value="${dto.pic0}"><img src="upload/${dto.pic0}"></td>
	</tr>
	</c:if>

	<c:if test="${dto.pic1 ne 'null'}">
		<tr>
		<td>����</td>
		<td><input type="text" name="pic1" value="${dto.pic1}"><img src="upload/${dto.pic1}"></td>
	</tr>
	</c:if>

	<c:if test="${dto.pic2 ne 'null'}">
		<tr>
		<td>����</td>
		<td><input type="text" name="pic2" value="${dto.pic2}"><img src="upload/${dto.pic2}"></td>
	</tr>
	</c:if>
	<c:if test="${dto.pic3 ne 'null'}">
		<tr>
		<td>����</td>
		<td><input type="text" name="pic3" value="${dto.pic3}"><img src="upload/${dto.pic3}"></td>
	</tr>
	</c:if>

	<tr>
		<td>����</td>
		<td><textarea rows="10" cols="50" name="content" id="_content">${dto.content}</textarea></td>
	</tr>
</table><br>
<span><button id="rupdatebtn">�����ϱ�</button></span>
<span><button onclick="like()" id="likebtn">��õ�ϱ�</button></span>
<br>

</div>
</form>

<script type="text/javascript">
function like(){
	var rseq = ${dto.rseq};
	var mid = "<%=mem.getId()%>";
	$.ajax({
		url:"rlike.do",
		type:"get",
		data:"rseq="+rseq+"&mid="+mid,
		success:function(msg){
			if(msg){
				alert("���ƿ䰡 �߰��Ǿ����ϴ�.");
			}else{
				alert("���ƿ䰡 �����Ǿ����ϴ�.");
			}
		},
		error:function(reqest, status, error){
			alert("���ƿ䰡 �߰����� �ʾҽ��ϴ�.");
		}
	});	
}


$("#rupdatebtn").click(function() {
	alert('�����ϱ�');
	$("#_frmForm").attr({ "target":"_self", "action":"rupdate.do?rseq=${dto.rseq}"}).submit();
});
</script>