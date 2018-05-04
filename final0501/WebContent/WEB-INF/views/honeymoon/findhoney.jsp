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
%>
<style type="text/css">
.tav{
	width: 500px;
	height: 200px;
	margin-left: 100px;
}
.tav tr{
	height: 70px;
}
.tav button{
    margin-left: 125px;
    padding: 10px 100px;
    border: none;
    border-radius: 5px;
}
.tav select{
	height: 56px;
	width: 415px;
	font-size: 17px;
}

</style>


		<form action=""  style="float: left;margin-left: 5%;" id="styleForm">
			<table border="1" class="tav">
				<tr>
					<th style="background-color: #C32E61;border: 1px solid #C32E61;">
						<h4 align="center" style="padding: 10px 0px;color: white;">내가 원하는 지역과 컨셉으로 상품 찾자!</h4>
					</th>
				</tr>		
				<tr>
				   <td><input type="text" readonly="readonly" size="30" value="허니문" style="height: 56px;font-size: 23px;font-weight:  bold;text-align:  center;color: #28A0FF;"><b style="font-size: 20px;">을</b></td>	
				</tr>
				<tr>
					<td>
						<select name="style" id="_style" >
							<option value="none">여행스타일을 선택하세요</option>
							<option value="huyang">휴양형</option>
							<option value="gwangwang">관광형</option>
							<option value="hugawn">휴양관광형</option>
							<option value="short">단거리형</option>
							<option value="long">장거리형</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><button type="button"  id="btn2" style="margin-left: 150px;">클릭</button></td>		
				</tr>
			</table>
		</form>
	
	
		<form action="compareHoney.do" id="areaForm"  style="float: left;" >
			<input type="hidden" name="area1" id="_area1">
			<input type="hidden" name="area2" id="_area2">
			<table border="1" style="margin-left: 50px;" class="tav">
				<tr>
					<th style="background-color: #28A0FF;border: 1px solid #28A0FF;">
						<h4 align="center" style="padding: 10px 0px;color: white;"> 지역 VS 지역 뭐가다르지? 비교하고 상품 찾자!</h4>
					</th>
				</tr>
				<tr>
					<td>
								<!--   지역 셀렉트   -->
						<select id="area1" >
						<option value="null">여행지역을 선택해주세요</option>
						<c:forEach var="area" items="${arealist}" varStatus="fori">	
							<option value="${area.name}">${area.name}</option>
						</c:forEach>
						</select> 
					</td>
				</tr>		
				<tr>
					<td>
								<!--   지역 셀렉트   -->
						<select id="area2" >
						<option value="null">여행지역을 선택해주세요</option>
						<c:forEach var="area" items="${arealist}" varStatus="fori">	
							<option value="${area.name}">${area.name}</option>
						</c:forEach>
						</select> 
					</td>
				</tr>
				<tr>
					<td><button type="button"  id="btn1">클릭</button></td>		
				</tr>
			</table>
		</form>
<script type="text/javascript">

$("#btn1").click(function () {
	var area1 = $("#area1 option:selected").val();
	var area2 = $("#area2 option:selected").val();
	if(area1=="null" || area2 =="null"){
		alert("여행지를 선택해주세요.");
	}else if(area1==area2){
		alert("서로 다른 여행지를 선택해주세요.");
	}else{
		$("#_area1").val(area1);
		$("#_area2").val(area2);
		$("#areaForm").attr({"target":"_self", "action":"compareHoney.do" }).submit();
	}
});	
$("#btn2").click(function () {
	var style = $("#_style option:selected").val();
	if(style=="none"){
		alert("여행하고 싶은 스타일을 선택해주세요.");
	}else{
		$("#styleForm").attr({"target":"_self", "action":"hmStyle.do" }).submit();
	}
});
</script>