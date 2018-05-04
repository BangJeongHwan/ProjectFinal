<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<style>

.main{
	width: 90%;
	height: 100%;
	background-color: white;
	margin : 0 auto;
	align: center;
	text-align: center;
	margin-top: 50px;
}

#ccdetail_main{
	width: 90%;
	height: 100%;
	background-color: white;
	margin : 0 auto;
	align: center;
	text-align: center;
	margin-top: 50px;
}
 table { 
 	border: 1px solid #EBEBEB; 
 	width: 70%;
 }
 td font{
	font-size:12px;color:#0000ff;margin:8px 0 0 8px;letter-spacing:-0.5px;
}
tr{
	height: 60px;
	padding:  20px 20px;
}
th{
	 text-align: center;
}
td{
	 align-content: center;
}
td:nth-child(even) {
    background-color:white;
}
button{
text-align: center;
align: left;
width: 100px;
}
img{
	width:200px;
height:170px;
}



</style>

<div id = "ccdetail_main">
<h2>업체 상세보기</h2>

<table class="main">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>
	<tr>
		<td>업체아이디</td>
		<td>${ccd.cid}</td>
	</tr>
	<tr>
		<td>업체이름</td>
		<td>${ccd.cname}</td>
	</tr>
	<tr>
		<td>업체사진</td>
		<td><img src="upload/${ccd.picture}"></td>
	</tr>
	<tr>
		<td>소개글</td>
		<td><textarea rows="10" cols="50" name="content" id="_content">${ccd.content}</textarea></td>
	</tr>
</table><br>
<span><button onclick="location.href='ccupdate.do?wiseq=${ccd.wiseq}'">수정하기</button></span>
<br>

<h2>해당 업체 상품목록</h2>
<br>

<table class="list_table" style="width:85%;">
	<colgroup>
		<col style="width:50px;" />
		<col style="width:50px;" />
		<col style="width:100px;" />
	</colgroup>

<thead>
	<tr>
		<th>번호</th><th>업체ID</th> <th>상품이름</th>  
	</tr>
</thead>

<tbody>	
	<c:if test="${empty clist}">
	<tr>
		<td colspan="3">등록된 상품이 없습니다.</td>
	</tr>	
	</c:if>

	<c:forEach items="${clist}" var="card" varStatus="cardS">

	<tr class="_hover_tr">
		<td>${cardS.count}</td> 
		<td>
		${card.cid}</td>
		<td><a href='cccdetail.do?cdseq=${card.cdseq}'>${card.title}</a></td> 
	</tr>
	</c:forEach>
</tbody>

</table><br>
<span><button onclick='location.href="cdwrite.do?wiseq=${ccd.wiseq}"'>상품올리기</button></span>

<br><br>
</div>