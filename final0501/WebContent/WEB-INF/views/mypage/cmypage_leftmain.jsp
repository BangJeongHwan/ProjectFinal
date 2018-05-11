<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%LoginDto login = (LoginDto)request.getSession().getAttribute("login"); %>

<h5 class="w3-bar-item">company mypage</h5>

<button class="w3-bar-item w3-button tablink" onclick="commypage()">정보수정</button>
<%if(login.getAuth().equals("WH")){ %>
<button class="w3-bar-item w3-button tablink" onclick="whrecvView()">예약승인</button>
<%}else if(login.getAuth().equals("DS")){ %>
<button class="w3-bar-item w3-button tablink" onclick="reserView()">예약승인</button>
<%} %>
<button class="w3-bar-item w3-button tablink" onclick="comPayView()">판매목록</button>


<script>
function commypage() {
	location.href = "commypage.do";
}
// 웨딩
function whrecvView() {
	location.href = "reservationWhList.do";
}
// 드레스
function reserView() {
	location.href = "reservationDressList.do";
}

function comPayView() {
	location.href = "comPayView.do";
}
</script>


