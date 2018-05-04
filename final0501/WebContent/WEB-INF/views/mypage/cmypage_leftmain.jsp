<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h5 class="w3-bar-item">company mypage</h5>
<button class="w3-bar-item w3-button tablink" onclick="commypage()">정보수정</button>
<button class="w3-bar-item w3-button tablink" onclick="reserView()">예약승인</button>
<button class="w3-bar-item w3-button tablink" onclick="">판매목록</button>

<script>
function commypage() {
	location.href = "memmypage.do";
}
function reserView() {
	location.href = "reservationDressList.do";
}
</script>


