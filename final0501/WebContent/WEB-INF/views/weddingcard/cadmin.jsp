<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>

<style>
#main{
margin-left:100px;
margin-right:20px;
}
table th,td{
border: 1px solid black;
text-align: center;
}
button{
text-align: center;
align: center;
}

</style>
<div id="main">

<h2>업체목록</h2>

 <form name= "_frmForm" id = "_frmForm" method = "post" action="">
<table class="list_table" style="width:75%;">
	<colgroup>
		<col style="width:70px;" />
		<col style="width:auto;" />
		<col style="width:100px;" />
	</colgroup>

<thead>
	<tr>
		<th>번호</th><th>업체ID</th> <th>업체이름</th>  
	</tr>
</thead>

<tbody>	
	<c:if test="${empty clist}">
	<tr>
		<td colspan="3">등록된 업체가 없습니다.</td>
	</tr>	
	</c:if>

	<c:forEach items="${clist}" var="card" varStatus="cardS">

	<tr class="_hover_tr">
		<td>${card.wiseq}</td> 
		<td style="text-align: left"><a href='ccdetail.do?wiseq=${card.wiseq}'>
		${card.cid}</a></td>
		<td>${card.cname}</td> 
	</tr>
	</c:forEach>
</tbody>

</table>
<br><br>
</form>
<button onclick='location.href="cardwrite.do"'>업체올리기</button><br><br>
</div>


