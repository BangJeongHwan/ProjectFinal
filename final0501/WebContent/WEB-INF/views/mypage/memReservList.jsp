<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>

<h3>예약/결제 리스트</h3>
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
<table class="list_table" style="width:85%;" >
<colgroup>
<col width="50"/><col width="75"/><col width="75"/><col width="75"/>
<col width="75"/><col width="50"/><col width="100"/>
</colgroup>
<thead>
<tr>
<th>번호</th><th>내 아이디</th><th>예약 날짜</th><th>예약 시간</th>
<th>예약 업체</th><th>예약 상태</th><th>비고</th>
</tr>
</thead>

<c:forEach var="rd" items="${rDtoList}" varStatus="i">
<tr>
<td>${i.count}</td>
<td>${rd.mid}</td>
<td>${rd.redate.substring(0,10)}</td>
<td>${rd.retime}</td>
<c:if test="${rd.pdseq>=1000 && rd.pdseq<2000}">
<td>웨딩홀</td>
</c:if>
<c:if test="${rd.pdseq>=2000 && rd.pdseq<3000}">
<td>청첩장</td>
</c:if>
<c:if test="${rd.pdseq>=3000 && rd.pdseq<4000}">
<td><a href="studioDetail.do?stseq=${rd.pdseq}">스튜디오</a></td>
</c:if>
<c:if test="${rd.pdseq>=4000 && rd.pdseq<5000}">
<td><a href="dressDetail.do?dsseq=${rd.pdseq}&pdseq=${rd.pdseq}&usid=${rd.mid}">드레스</a></td>
</c:if>
<c:if test="${rd.pdseq>=5000 && rd.pdseq<6000}">
<td><a href="muDetailView.do?museq=${rd.pdseq}">메이크업</a></td>
</c:if>

<td>${rd.status}</td>
<td>${rd.content}</td>
</tr>
</c:forEach>

</table>

<!-- 페이징 처리 -->
	
<div style="text-align: center">
<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
	<jsp:param value="${pageNumber }" name="pageNumber"/>
	<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
	<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
	<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
</jsp:include>
</div>
	
<form name="frmForm1" id="_frmFormSearch" method="post" action="">
	<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
</form>

</div>

<script>
function goPage(pageNumber) {
	//alert("goPage");
	$("#_pageNumber").val(pageNumber);
	$("#_frmFormSearch").attr("target","_self").attr("action","memReservList.do").submit();
}
</script>


