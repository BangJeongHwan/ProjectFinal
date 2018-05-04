<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.w4-bar-block .w4-bar-item {
    width: 100%;
    display: block;
    padding: 8px 16px;
    text-align: left;
    border: none;
    white-space: normal;
    float: none;
    outline: 0;
}

.w4-btn, .w4-button {
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
.w4-btn, .w4-button {
    border: none;
    display: inline-block;
    padding: 13px 16px;
    vertical-align: middle;
    overflow: hidden;
    text-decoration: none;
    color: inherit;
    background-color: inherit;
    text-align: center;
    cursor: pointer;
    white-space: nowrap;
    float: left;
    width: 100%;
}
.w4-button:hover{
	background-color: gray;
	color: black;
}
</style>

<h5 style="width: 100%;color: white; display: block; padding-top :16px; padding-bottom: 16px; white-space: normal; text-align: center; float: left; outline: 0;">허니문</h5>
<button class="w4-bar-item w4-button tablink" onclick="location.href='findhoney.do'">나의 허니문 찾기</button>
<button class="w4-bar-item w4-button tablink" onclick="location.href='hmStyle.do?style=none'">스타일비교</button>
<button class="w4-bar-item w4-button tablink" onclick="location.href='compareHoney.do'">지역비교</button>
<button class="w4-bar-item w4-button tablink" onclick="location.href='hm_bbslist.do'">여행지별 후기</button>
<button class="w4-bar-item w4-button tablink" id="_write">내 후기 올리기</button>
<script type="text/javascript">
<%
LoginDto mem = (LoginDto)session.getAttribute("login");
if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>
var auth = "<%=mem.getAuth()%>";
$("#_write").click(function () {
	if(auth == "guest"){
		if(confirm("로그인 하시겠습니까?")){
			location.href = "javascript:void(window.open('login.do', '로그인','top=200px, left=500px, width=450, height=450,scrollbars=no,resizable=no' ))";
		}
	}else {
		location.href = "honeybbswrite.do";
	}
});
</script>

    <!-- width: 100%;
    display: block;
    padding: 8px 16px;
    text-align: left;
    border: none;
    white-space: normal;
    float: none;
    outline: 0; -->