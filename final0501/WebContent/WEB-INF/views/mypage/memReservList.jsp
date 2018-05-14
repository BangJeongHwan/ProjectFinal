<%@page import="kh.com.a.model.MakeupDto"%>
<%@page import="kh.com.a.model.StudioDto"%>
<%@page import="kh.com.a.model.CardDetailDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kh.com.a.model2.PaymentViewParam"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>

<h3>예약/결제 리스트</h3>
<br>
<style type="text/css">
.list_table table {
	border: 1px solid #EBEBEB;
	align-content: center;
	width: 300px;
}
.list_table td font{
	font-size:12px;color:#0000ff;margin:8px 0 0 8px;letter-spacing:-0.5px;
}
.list_table tr{
	height: 60px;
	padding:  20px 20px;
}
.list_table td{
	 align-content: center;
}
/* .list_table td:nth-child(even) {
    background-color:white;
} */

/* 혜영 추가 */
.payTbl table {
	border: 1px solid #808182;
	align-content: center;
	cursor: default;
}
.payTbl tr{
	padding:  20px 20px;
	height: 60px;
}
.payTbl th{
	background-color:#EBEBEB;
	align-content: center;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
}
.payTbl td{
	background-color:#fff;
	align-content: center;
	text-align: center;
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


<!-- 혜영추가  -->
<div align="left"><h3>결제 내역 확인</h3></div>
	<br>
	<table class="payTbl" style="width:85%;">
		<colgroup>
			<col width="5%"><col width="15%"><col width="15%"><col width="40%"><col width="10%"><col width="15%">
		</colgroup>
		<tr>
			<th>번호</th>
			<th>상품정보</th>
			<th>품목</th>
			<th>옵션</th>
			<th>가격</th>
			<th>결제일</th>
		</tr>
		<c:if test="${ empty payList }">
				<tr>
					<td colspan="6">결제 내역이 없습니다.</td>
				</tr>
		</c:if>
		<%
		List<Integer> grnumList = (List<Integer>)request.getAttribute("grnumList");
		List<PaymentViewParam> payList = (List<PaymentViewParam>)request.getAttribute("payList");
		
		for(int i = 0; i < grnumList.size(); i++) {
			int grnum = grnumList.get(i);
			List<Integer> grIndexList = new ArrayList<Integer>();
			for(int j = 0; j < payList.size(); j++) {
				if (grnum == payList.get(j).getGrnum()) {
					grIndexList.add(j);
				}
			}
			int totalPrice = 0;
			for(int j = 0; j < grIndexList.size(); j++) {
				int index = grIndexList.get(j);
				PaymentViewParam pay = payList.get(index);
				int pdseq = pay.getPdseq();
				totalPrice += pay.getTotal_price();
				
				out.println("<tr>");
				if (j == 0) {
					out.println("<td rowspan='" + grIndexList.size() +"' style='vertical-align: top;padding-top:15px'>" + (i + 1) +"</td>");
				}
				out.println("<td>");
				out.println("<a href='viewPdseqPage.do?pdseq=" + pdseq +"'>");
				if (pdseq >= 2000 && pdseq < 3000) {
					out.println(((CardDetailDto)pay.getPdDto()).getTitle());
				} else if (pdseq >= 3000 && pdseq < 4000) {
					out.println(((StudioDto)pay.getPdDto()).getCname());
				} else {
					out.println(((MakeupDto)pay.getPdDto()).getCname());
				}
				out.println("</a>");
				out.println("</td>");
				out.println("<td>");
				if (pdseq >= 2000 && pdseq < 3000) {
					out.println("청첩장");
				} else if (pdseq >= 3000 && pdseq < 4000) {
					out.println("스튜디오");
				} else {
					out.println("메이크업");
				}
				out.println("</td>");
				out.println("<td style='text-align: left'>");
				for(int k = 0; k < pay.getOptionList().size(); k++) {
					if (k == 0) {
						out.println(pay.getOptionList().get(k));
					} else {
						out.println("&nbsp;/&nbsp;" + pay.getOptionList().get(k));
					}
				}
				if (pay.getReservDto() != null) {
					out.println("&nbsp;/&nbsp;" + pay.getReservDto().getRedate());
					out.println("&nbsp;/&nbsp;" + pay.getReservDto().getRetime());
				}
				out.println("</td>");
				out.println("<td>");
				out.println(pay.getTotal_price());
				out.println("</td>");
				if (j == 0) {
					out.println("<td rowspan='" + grIndexList.size() +"'>" + pay.getBuydate() + "</td>");
				}
				out.println("</tr>");
			}
			out.println("<tr>");
			out.println("<td colspan='3'></td>");
			out.println("<td style='text-align: right'>총 금액&nbsp;</td>");
			out.println("<td>" + totalPrice +"</td>");
			out.println("<td></td>");
			out.println("</tr>");
			out.println("<tr style='padding:0px;height:1px;'>");
			out.println("<td colspan='6' style='padding:0px;height:1px;background-color: #808182'></td>");
			out.println("</tr>");
		}
		
		%>
	</table>
</div>


<script>
function goPage(pageNumber) {
	//alert("goPage");
	$("#_pageNumber").val(pageNumber);
	$("#_frmFormSearch").attr("target","_self").attr("action","memReservList.do").submit();
}
</script>


