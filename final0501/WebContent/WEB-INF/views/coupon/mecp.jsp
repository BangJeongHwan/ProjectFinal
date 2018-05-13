<%@page import="kh.com.a.model2.LoginDto"%>
<%@page import="kh.com.a.model.MemberDto"%>
<%@page import="java.time.Year"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/table.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/tables.css" />

<style type="text/css">
.regititle{
	float: left;
    border: 1px solid black;
}
.regicontent{
	float: left;
    border: 1px solid black;
    text-align: center;
}
.seldiv{
	float: left;
	width: 39%;
	 border: 1px solid black;
	 padding: 15px;
	 font-size: 25px;
}
.mbtn{
    border: 5px solid inherit;
    background: none;
    border-radius: 20px;
    font-size: 13px;
    padding: 1px 25px;
}
</style>
<%LoginDto login = (LoginDto)session.getAttribute("login"); %>
	<div style="text-align: center;margin-left: 10%">
	<div class="seldiv" style="background-color: gray; color: white;" onclick="sel(1)" id="seldiv1">사용 가능 쿠폰</div>
	<div class="seldiv" style="color: gray;" onclick="sel(2)" id="seldiv2">마감된 쿠폰</div>
</div>

	<table class="list_table" style="width:70%;margin-left: 10%;" id="tab1">
		<colgroup>
					<col width="40%"><col width="40%"><col width="20%">
		</colgroup>
		<thead >
	 		<tr>
				<th>사용기한</th> <th>쿠폰이름</th> <th>할인율</th>
			</tr>
		</thead>
		<tbody>	
			<c:if test="${!empty unuselist}">	
				<c:forEach items="${unuselist}" var="cp" varStatus="i">
						<tr>
							<td> ${cp.remit}</td>
							<td><input type="text" readonly="readonly" style="background: none; border: none;" id="cptitle" value="${cp.title}"></td>
							<td><input type="text" readonly="readonly" style="background: none; border: none;" id="cpdiscount" value="${cp.discount}%"></td>
						</tr>
				</c:forEach>
			</c:if> 
			
			<c:if test="${empty unuselist}">
				<tr><td colspan="3">사용 가능 하신 쿠폰이 없습니다.</td> </tr>
			</c:if>	
		</tbody>								
	</table>

	<table class="list_table" style="width:70%;margin-left: 10%;" id="tab2">
		<colgroup>
					<col width="20%"><col width="40%"><col width="20%"><col width="20%">
		</colgroup>
		<thead >
	 		<tr>
				<th>사용기한</th> <th>쿠폰이름</th> <th>할인율</th> <th>사용처</th>
			</tr>
		</thead>
		<tbody>	
			<c:if test="${!empty uselist}">	
				<c:forEach items="${uselist}" var="cp" varStatus="i">
					
					<tr>
						<td> ${cp.remit}</td>
						<td><input type="text" readonly="readonly" style="background: none; border: none;" id="cptitle" value="${cp.title}"></td>
						<td><input type="text" readonly="readonly" style="background: none; border: none;" id="cpdiscount" value="${cp.discount}%"></td>
					<c:if test="${cp.bkseq != 0}">	
						<%-- <td><input type="text" readonly="readonly" style="background: none; border: none;" id="cpbk${i.index}" value="retutn cpbkseqename(${cp.bkseq})"></td> --%>
						<td><button class="mbtn" onclick="cpbkseqename(${cp.bkseq})">상품정보</button> </td>
					</c:if>
					<c:if test="${cp.bkseq == 0}">	
						<td>미사용 기간만료</td>
					</c:if>
					</tr>
					
					<script type="text/javascript">
					
					
					</script>
				</c:forEach>
			
				
			</c:if> 
			
			<c:if test="${empty uselist}">
				<tr><td colspan="4">사용하신 쿠폰이 없습니다.</td> </tr>
			</c:if>	
		</tbody>								
	</table>


	<script type="text/javascript">
	$("#tab2").hide();
	function sel(num) {
		if(num==1){
			$("#tab1").show();
			$("#tab2").hide();
			$("#seldiv1").css({"background-color": "gray", "color": "white"});
			$("#seldiv2").css({"background-color": "white", "color": "gray"});
		}else{
			$("#tab1").hide();
			$("#tab2").show();
			$("#seldiv2").css({"background-color": "gray", "color": "white"});
			$("#seldiv1").css({"background-color": "white", "color": "gray"});
		}
		
	}
	
	function cpbkseqename(cpbkseq) {
		$.ajax({
			url:"bkseqdata.do",
			type:"post",
			data:"bkseq="+cpbkseq,
			async : true,
			success : function(pdseq){
				
				 if(pdseq>=1000 && pdseq<2000) {
					 location.href="#"
				 }else if(pdseq>=2000 && pdseq<3000){
					 location.href="#"
				 }else if(pdseq>=3000 && pdseq<4000){
					 location.href="studioDetail.do?stseq="+pdseq;
				 }else if(pdseq>=4000 && pdseq<5000){
					 location.href="dressDetail.do?dsseq="+pdseq+"&pdseq="+pdseq+"&usid=<%=login.getId()%>";
				 }else if(pdseq>=5000 && pdseq<6000){
					 location.href="muDetailView.do?museq="+pdseq;
				 }
			 }
		});
	}
	</script>