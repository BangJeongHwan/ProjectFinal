<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>

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
button{
text-align: center;
align: center;
width: 100px;
}

</style>
<div id="main" align="center">

<h2>나의 후기 게시판</h2>

 <form name= "_frmForm" id = "_frmForm" method = "post" action="">
<table class="list_table" style="width:85%;">
	<colgroup>
		<col width="50"/><col width="100"/><col width="75"/><col width="75"/>
	</colgroup>

<thead>
	<tr>
		<th>번호</th><th>제목</th><th>상품이름</th><th>등록일자</th>  
	</tr>
</thead>

<tbody>	
	<c:if test="${empty mrlist}">
	<tr>
		<td colspan="5">등록된 리뷰가 없습니다.</td>
	</tr>	
	</c:if>

	<c:forEach items="${mrlist}" var="mrlist" varStatus="mrlistS">

	<tr class="_hover_tr">
		<td>${mrlistS.count}</td> 
		<td style="text-align: left"><a href='rdetail.do?rseq=${mrlist.rseq}'>${mrlist.title}</a></td>
		<td>${mrlist.pname}</td>
		<td>${mrlist.rdate}</td> 
	</tr>
	</c:forEach>
</tbody>

</table>
<br><br>
</form>

<div class="cl_search">
<form name="frmForm1" id="_frmFormSearch" method="post" action="">

<table style="margin-left:auto; margin-right:auto; margin-top:3px; margin-bottom:3px; border:0; padding:0;">
<tr>
	<td></td>
	<td style="padding-left:5px;">
		<select id="_s_category" name="s_category">
			<option value="" selected="selected">선택</option>
			<option value="title">제목</option>
			<option value="content">소개글</option>								
		</select>
	</td>
	<td style="padding-left:5px;"><input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/></td>
	<td style="padding-left:5px;"><span class="button blue"><button type="button" id="_btnSearch"> 검색 </button></span></td>
</tr>
</table>
<button onclick='location.href="rbwrite.do"'>후기올리기</button><br><br>

<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>						

</form>

<div id="paging_wrap">
<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
	<jsp:param value="${pageNumber }" name="pageNumber"/>
	<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
	<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
	<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
</jsp:include>
</div>
</div>

</div>

<script>

$("#review").click(function() {
	alert('후기');
	$("#_frmForm").attr({ "target":"_self", "action":"pagingrlist.do"}).submit();
});


$("#_btnSearch").click(function() {
	alert('search');						
	$("#_frmFormSearch").attr({ "target":"_self", "action":"pagingclist.do" }).submit();
	
});

function goPage(pageNumber) {	
	$("#_pageNumber").val(pageNumber) ;
	$("#_frmFormSearch").attr("target","_self").attr("action","pagingclist.do").submit();
}

</script>
