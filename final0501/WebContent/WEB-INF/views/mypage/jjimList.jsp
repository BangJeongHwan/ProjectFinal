<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<%
	LoginDto mem = (LoginDto)session.getAttribute("login");
%>

<style type="text/css">
#main{
margin-left:100px;
margin-right:20px;
}
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

<div>
	<h3>내가 찜한 상품 목록</h3>
	<table class="list_table" style="width:85%;">
		<colgroup>
			<col width="15%"/><col width="25%"/><col width="60%"/>
		</colgroup>
		
		<thead>
			<tr>
				<th>번호</th><th>사진</th><th>업체명</th>
			</tr>
		</thead>
		
		<tbody>	
			<c:if test="${empty jjimlist}">
				<tr>
					<td colspan="5">찜한 상품이 존재하지 않습니다.</td>
				</tr>	
			</c:if>
		
			<c:forEach items="${JjimlistDto}" var="jjimlist" varStatus="i">
				<tr class="_hover_tr">
					<td>${i.count}</td> 
					
					<td><img src="upload/${JjimlistDto.pic}"/></td>
					
					<td style="text-align: left">					
						<c:if test="${JjimlistDto.seq >= 1000 && JjimlistDto.seq < 2000}">
							<!-- 웨딩홀 디테일 이동! 변경시켜주어야함-->
							<a href="studioDetail.do?stseq=${sdDto.stseq}&pdseq=${sdDto.stseq}&usid=<%=mem.getId()%>">
								${JjimlistDto.cname}
							</a>
						</c:if>
						
						<c:if test="${JjimlistDto.seq >= 2000 && JjimlistDto.seq < 3000}">
							<!-- 청첩장 디테일 이동! 변경시켜주어야함-->
							<a href="studioDetail.do?stseq=${sdDto.stseq}&pdseq=${sdDto.stseq}&usid=<%=mem.getId()%>">
								${JjimlistDto.cname}
							</a>
						</c:if>
						
						<c:if test="${JjimlistDto.seq >= 3000 && JjimlistDto.seq < 4000}">
							<!-- 스튜디오 디테일 이동! -->
							<a href="studioDetail.do?stseq=${sdDto.stseq}&pdseq=${sdDto.stseq}&usid=<%=mem.getId()%>">
								${JjimlistDto.cname}
							</a>
						</c:if>
						
						<c:if test="${JjimlistDto.seq >= 4000 && JjimlistDto.seq < 5000}">
							<!-- 드레스 디테일 이동! 변경시켜주어야함-->
							<a href="studioDetail.do?stseq=${sdDto.stseq}&pdseq=${sdDto.stseq}&usid=<%=mem.getId()%>">
								${JjimlistDto.cname}
							</a>
						</c:if>
						
						<c:if test="${JjimlistDto.seq >= 5000 && JjimlistDto.seq < 6000}">
							<!-- 메이크업 디테일 이동! 변경시켜주어야함-->
							<a href="studioDetail.do?stseq=${sdDto.stseq}&pdseq=${sdDto.stseq}&usid=<%=mem.getId()%>">
								${JjimlistDto.cname}
							</a>
						</c:if>						
					</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>