<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h5 class="w3-bar-item">company mypage</h5>
<button class="w3-bar-item w3-button tablink" onclick="commypage()">정보수정</button>
<c:if test="${auth=='WH'}">
<button class="w3-bar-item w3-button tablink" onclick="whrecvView()">예약승인</button>
</c:if>
<c:if test="${auth=='DS'}">
<button class="w3-bar-item w3-button tablink" onclick="reserView()">예약승인</button>
</c:if>

<button class="w3-bar-item w3-button tablink" onclick="comPayView()">판매목록</button>


<script>
function commypage() {
	location.href = "commypage.do";
}
// 웨딩
function whrecvView() {
	location.href = "reservationDressList.do";
}
// 드레스
function reserView() {
	location.href = "reservationDressList.do";
}

function comPayView() {
	location.href = "comPayView.do";
}
</script>


