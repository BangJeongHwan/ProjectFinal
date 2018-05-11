<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
LoginDto mem = (LoginDto)session.getAttribute("login");

if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>

 <form name= "_frmForm" id = "_frmForm" method = "post" action="">
 	<input type="hidden" name="mid" value="<%=mem.getId() %>">
 </form>

<h5 class="w3-bar-item">member mypage</h5>
<button class="w3-bar-item w3-button tablink" onclick="memmypage()">정보수정</button>
<button class="w3-bar-item w3-button tablink" onclick="memReservList()">예약/결제내역</button>
<button class="w3-bar-item w3-button tablink" onclick="mrlist()">내 글 목록</button>
<button class="w3-bar-item w3-button tablink" onclick="">찜한 목록</button>
<button class="w3-bar-item w3-button tablink" onclick="">내 쿠폰 보기</button>

<script>
function memmypage() {
	location.href = "memmypage.do";
}

function memReservList() {
	location.href = "memReservList.do";
}

function jjimlist(){
	location.href = "jjimList.do"
}

function mrlist() {
	$("#_frmForm").attr({ "target":"_self", "action":"myrlist.do"}).submit();
}
</script>


