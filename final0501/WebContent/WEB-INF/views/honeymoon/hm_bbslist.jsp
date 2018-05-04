<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/table.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/tables.css" />
<fmt:requestEncoding value="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<jsp:include page="honeymoon.jsp"/>
<%
LoginDto mem = (LoginDto)session.getAttribute("login");
if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%><!--  todohm-->
<table class="list_table" style="width:70%;margin-left: 12%;">
	<colgroup>
		<col style="width:10%;" />
		<col style="width:10%;" />
		<col style="width:auto;" />
		<col style="width:15%;" />
	</colgroup>

<thead>
	<tr>
		<th>순서</th> <th>지역</th> <th>제목</th> <th>작성자</th> 
	</tr>
</thead>

<tbody>	
	<c:if test="${empty bbslist}">
	<tr>
		<td colspan="3">작성된 글이 없습니다.</td>
	</tr>	
	</c:if>

	<c:forEach items="${bbslist}" var="bbs" varStatus="vs">
	<tr class="_hover_tr">
		<td>${vs.count}</td> 
		<td>${bbs.area}</td> 
		<td><a href='honeyBbsDetail.do?seq=${bbs.seq}'>${bbs.title}</a></td>
		<td>${bbs.id}</td> 
	</tr>
	</c:forEach>
</tbody>

</table>
<!-- 페이징 처리 -->
<div id="paging_wrap">
<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
	<jsp:param value="${pageNumber }" name="pageNumber"/>
	<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
	<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
	<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
</jsp:include>
<div align="right" style="padding-top: 50px; position: relative;z-index: 0;margin-left: 960px; width: 10%;">
	<button type="button" id="_btnAdd" style="border: 1px solid #4D6BB3; border-radius: 5px;background-color: #4D6BB3; padding: 4px 13px; color: white;">글쓰기</button>
</div>
</div>

<!--  -->

<div style="margin-top:5px; margin-bottom: 10px;">

<form name="frmForm1" id="_frmFormSearch" method="post" action="">

<table style="margin-left:auto; margin-right:auto; margin-top:3px; margin-bottom:3px; border:0; padding:0;">
<tr>
	<td>검색 : </td>
	<td style="padding-left:5px;">
		<select id="_s_category" name="s_category">
			<option value="" selected="selected">선택</option>
			<option value="title">제목</option>
			<option value="contents">내용</option>								
			<option value="writer">작성자</option>								
			<option value="area">지역</option>								
		</select>
	</td>
	<td style="padding-left:5px;"><input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/></td>
	<td style="padding-left:5px;"><span class="button blue"><button type="button" id="_btnSearch"> 검색 </button></span></td>
</tr>
</table>

<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>						

</form>
</div>
<!-- <a href='bbswrite.do'>글쓰기</a>  -->

<script type="text/javascript">
$(document).ready(function() {
	$("._hover_tr").mouseover(function() {
		$(this).children().css("background-color","#F0F5FF");
	}).mouseout(function() {
		$(this).children().css("background-color","#FFFFFF");
	});				
});
$("#_btnAdd").click(function() {
	var auth = "<%=mem.getAuth()%>";
	if(auth=="guest"){
		alert("로그인 하셔야합니다.");
	}else{
		location.href="honeybbswrite.do";	
	}
});
$("#_btnSearch").click(function() {
	//alert('search');						
	$("#_frmFormSearch").attr({ "target":"_self", "action":"hm_bbslist.do" }).submit();
	
});
function goPage(pageNumber) {	
	$("#_pageNumber").val(pageNumber) ;
	$("#_frmFormSearch").attr("target","_self").attr("action","hm_bbslist.do").submit();
}
</script>