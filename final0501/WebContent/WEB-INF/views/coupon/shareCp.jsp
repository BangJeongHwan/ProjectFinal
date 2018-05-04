<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/table.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/tables.css" />
<fmt:requestEncoding value="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<style type="text/css">
.regititle{
	float: left;
    border: 1px solid black;
}
.regicontent{
	float: left;
    border: 1px solid black;
}
.seldiv{
	float: left;
	width: 39%;
	 border: 1px solid black;
	 padding: 15px;
	 font-size: 25px;
}
</style>



<h1 style="text-align: center;">현재 적용된 공유 쿠폰</h1>
<div style="width: 70%;margin-left: 10%;">
		<div>
			<div class="regititle" style="width: 20%;">제목</div>
			<div class="regititle" style="width: 30%;">시작 날짜</div>
			<div class="regititle" style="width: 30%;">마감 날짜</div>
			<div class="regititle" style="width: 20%;">할인율</div>
		</div>
	<div>
		<c:choose>
			<c:when test="${empty registedCoupon}">
				<p style="text-align: center; font-size: 20px;">등록된 쿠폰이 없습니다.</p>
			</c:when>
		
			<c:when test="${!empty registedCoupon}">
				<div class="regicontent" style="width: 20%;">${registedCoupon.title}</div>
				<div class="regicontent" style="width: 30%;">${registedCoupon.opendate}</div>
				<div class="regicontent" style="width: 30%;">${registedCoupon.closedate}</div>
				<div class="regicontent" style="width: 20%;">${registedCoupon.discount}%</div>

				<div style="text-align: right;">
				
					<select id="_extend" name="extend" style="width: 90px;">
						<option value="0">연장</option>
							<c:forEach var="i" begin="1" end="30">
								<option value="${i}">${i}일</option>
							</c:forEach>
					</select>
					
					<button style="background: none; border: 3px solid inherit; border-radius: 5px; padding: 5px 15px;">연장하기</button>
					
				</div>
				
			</c:when>
		</c:choose>
	</div>
</div>
<br><br><br>


<div style="text-align: center;margin-left: 10%">
	<div class="seldiv" style="background-color: gray; color: white;" onclick="sel(1)" id="seldiv1">등록 가능 쿠폰</div>
	<div class="seldiv" style="color: gray;" onclick="sel(2)" id="seldiv2">모든 쿠폰</div>
</div>
<table class="list_table" style="width:70%;margin-left: 10%;" id="tab1">

	<thead>
		<tr>
			<th>선택</th> <th>제목</th> <th>시작 날짜</th> <th>마감 날짜</th> <th>할인율</th>
		</tr>
	</thead>

	<tbody>	
		<c:if test="${empty couponlist}">
			<tr>
				<td colspan="5">작성된 쿠폰이 없습니다.</td>
			</tr>	
		</c:if>
	
		<c:forEach items="${couponlist}" var="coupon" varStatus="vs">
		<tr class="_hover_tr">
			<td><input type="radio" name="choice" id="_choice" value="${coupon.seq}"></td> 
			<td>${coupon.title}</td> 
			<td>${coupon.opendate}</td>
			<td>${coupon.closedate}</td>
			<td>${coupon.discount}</td>
		</tr>
		</c:forEach>
	</tbody>

</table>

<table class="list_table" style="width:70%;margin-left: 10%;" id="tab2">

	<thead>
		<tr>
			<th>적용여부</th> <th>제목</th> <th>시작 날짜</th> <th>마감 날짜</th> <th>할인율</th>
		</tr>
	</thead>

	<tbody>	
		<c:if test="${empty alllist}">
			<tr>
				<td colspan="5">작성된 쿠폰이 없습니다.</td>
			</tr>	
		</c:if>
	
		<c:forEach items="${alllist}" var="all" varStatus="vs">
		<tr class="_hover_tr">
		<c:if test="${all.del == 1}">
			<td style="text-align: center;">
				<img src="assets/images/others/regiimg.png">
			 </td> 
		</c:if>
		<c:if test="${all.del != 1}">
			<td></td>
		</c:if>
			<td>${all.title}</td> 
			<td>${all.opendate}</td>
			<td>${all.closedate}</td>
			<td>${all.discount}</td>
		</tr>
		</c:forEach>
	</tbody>

</table>

<button style="position: fixed; margin-left: 72%; background: none; border: 3px solid inherit; border-radius: 5px; padding: 5px 15px; margin-top: 20%;" id="_regit">드응로크</button>


<script type="text/javascript">
	$("#_regit").click(function () {
		var seq = $("#_choice:checked").val();
		if(seq == null){
			alert("쿠폰 먼저 작성 해주새요");
		}else{
			location.href="regcoupon.do?seq=" + seq + "&sort=1";	
		}
	});
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
</script>
