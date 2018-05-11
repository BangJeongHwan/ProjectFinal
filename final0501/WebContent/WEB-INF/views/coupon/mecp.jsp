<%@page import="kh.com.a.model2.LoginDto"%>
<%@page import="kh.com.a.model.MemberDto"%>
<%@page import="java.time.Year"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style type="text/css">
.acpbtn{
    background: none;
    border-radius: 14px;
    padding: 0px 25px;
}
.mcycptable{
	width: 1000px;
	border: 1px solid #EBEBEB;
	align-content: center;
	cursor: default;
}
.mcycptable tbody {
 	cursor: pointer;
}
.mcycptable tbody tr:nth-child(even) {
    background-color:#FBFBFB;
}
.mcycptable tr{
	padding:  20px 20px;
	height: 60px;
}
.mcycptable th{
	background-color:#F8F8F8;
	align-content: center;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
}
.mcycptable td{
	align-content: center;
	text-align: center;
	cursor: pointer;
}
.upbtn{
    background: #00bb00;
    color: white;
    border: none;
    border-radius: 10px;
    padding: 4px 10px;
    font-weight: bold;
}
.delbtn{
	background: #ff5555;
    color: white;
    border: none;
    border-radius: 10px;
    padding: 4px 10px;
    font-weight: bold;
    margin-left: 7px;
}
</style>

	<table class="mcycptable" style="width: 100%">
		<colgroup>
					<col width="40%"><col width="40%"><col width="20%">
		</colgroup>
		<thead >
	 		<tr>
				<th>사용기한</th> <th>쿠폰이름</th> <th>할인율</th>
			</tr>
		</thead>
		<tbody>	
			<c:if test="${!empty list}">	
				<c:forEach items="${list}" var="cp" varStatus="i">
					
					<tr id="1" onclick="trclick(${cp.seq})">
						<td> ${cp.remit}</td>
						<td><input type="text" readonly="readonly" style="background: none; border: none;" id="cptitle" value="${cp.title}"></td>
						<td><input type="text" readonly="readonly" style="background: none; border: none;" id="cpdiscount" value="${cp.discount}"></td>
					</tr>
				</c:forEach>
			
				
			</c:if> 
			
			<c:if test="${empty list}">
				<tr><td colspan="4">받으신 쿠폰이 없습니다.</td> </tr>
			</c:if>	
		</tbody>								
	</table>


