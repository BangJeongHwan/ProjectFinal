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
<button class="w4-bar-item w4-button tablink" onclick="location.href='sharecp.do'">공유 쿠폰 등록</button>
<button class="w4-bar-item w4-button tablink" onclick="location.href='challengecp.do?style=none'">도전 쿠폰 등록</button>
<button class="w4-bar-item w4-button tablink" onclick="location.href='timecp.do'">타임 쿠폰 등록</button>
<button class="w4-bar-item w4-button tablink" onclick="location.href='ramdomcp.do'">랜덤 쿠폰 등록</button>
<button class="w4-bar-item w4-button tablink" onclick="location.href='makecoupon.do'">쿠폰 만들기</button>

