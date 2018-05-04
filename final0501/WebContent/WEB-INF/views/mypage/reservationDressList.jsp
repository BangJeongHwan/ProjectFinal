<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>

<h3>드레스 방문예약 승인리스트</h3>
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
<col width="75"/><col width="50"/><col width="75"/><col width="35">
</colgroup>
<thead>
<tr>
<th>번호</th><th>손님 아이디</th><th>예약 날짜</th><th>예약 시간</th>
<th>예약 업체</th><th>예약 상태</th><th>비고</th><th>승인</th>
</tr>
</thead>

<c:forEach var="rd" items="${rDtoList}" varStatus="i">
<tr>
<td>${i.count}</td>
<td>${rd.mid}</td>
<td>${rd.redate.substring(0,10)}</td>
<td>${rd.retime}</td>
<td>${rd.pdseq}</td><td>${rd.status}</td>
<td>${rd.content}</td>
<td>
<input type="button" name="checkResrve" id="_checkResrve" value="승인"
onclick="checkResrve(${rd.rvseq})"/>
<input type="button" name="checkResrve" id="_checkResrve" value="승인거절"
onclick="rejectionResrve(${rd.rvseq})"/>
</td>
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
function checkResrve(rvseq) {
	if(confirm("예약 승인하시겠습니까?")){
		location.href = "DressReserveAdmit.do?rvseq="+rvseq;
	}
}
function rejectionResrve(rvseq) {
	if(confirm("예약 거절하시겠습니까?")){
		location.href = "DressReserveReject.do?rvseq="+rvseq;
	}
}
function goPage(pageNumber) {
	//alert("goPage");
	$("#_pageNumber").val(pageNumber);
	$("#_frmFormSearch").attr("target","_self").attr("action","reservationDressList.do").submit();
}
</script>


