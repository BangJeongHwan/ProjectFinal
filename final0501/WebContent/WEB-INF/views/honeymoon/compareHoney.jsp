<%@page import="kh.com.a.model.HoneyMoonDto"%>
<%@page import="java.util.List"%>
<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/table.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/tables.css" />
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="honeymoon.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
th:nth-child(even) {
    background-color:gray;
    color: white;
}
.btn2{
	padding: 15px 175px;
	border-radius: 5px;
	font-size: 15px;
	font-weight: bold;
}
</style>
  
<%
List<HoneyMoonDto> arealist = (List<HoneyMoonDto>)request.getAttribute("arealist");
/* String area1 = (String)request.getAttribute("area1");
String area2 = (String)request.getAttribute("area2"); */
%>


<div style="background-color: lightblue;color: white;">
<h1 align="center">가고싶은데는 한개가 아니다</h1>
</div>

<div align="center">
<select id="area1">
<option value="null">여행지역을 선택해주세요</option>
<c:forEach var="area" items="${arealist}" varStatus="fori">	
	<option value="${area.name}">${area.name}</option>
</c:forEach>
</select> 
&nbsp;&nbsp;&nbsp; VS &nbsp;&nbsp;&nbsp;
<select id="area2">
<option value="null">여행지역을 선택해주세요</option>
<c:forEach var="area" items="${arealist}" varStatus="fori">	
	<option value="${area.name}">${area.name}</option>
</c:forEach>
</select> 
<button id="btn1" onclick="clic()">클릭</button>



<table border="1" style="max-width: 1000px;width: 1000px;">
<col width="40%"><col width="20%"><col width="40%"> 
<tr style="height: 50px">
	<th>
		<p id="selectArea1">여행지역을 선택해주세요</p>
	</th>
	<th>지역</th>
	<th>
	<p id="selectArea2">여행지역을 선택해주세요</p>
	</th>
</tr>
<tr style="height: 50px">
	<th>
		<p id="selectStyle1"></p>
	</th>
	<th>여행 스타일</th>
	<th>
		<p id="selectStyle2"></p>
	</th>
</tr>
<tr style="height: 50px">
	<th>
		<p id="selectPrice1"></p>
	</th>
	<th>상품가격대</th>
	<th>
		<p id="selectPrice2"></p>
	</th>
</tr>
<tr style="height: 300px">
	<th >
	<p id="selectContent1"></p> 
	</th>
	<th>추천 여행일정</th>
	<th >
	<p id="selectContent2"></p>
	</th>
</tr>
<tr style="height: 50px">
	<th>
		<p id="selectVisa1"></p>
	</th>
	<th>VISA 유무</th>
	<th>
		<p id="selectVisa2"></p>
	</th>
</tr>
<tr style="height: 50px">
	<th>
		<p id="selectAirport1"></p>
	</th>
	<th>주요항공편</th>
	<th>
		<p id="selectAirport2"></p>
	</th>
</tr>
<tr style="height: 50px">
	<th><button class="btn2" onclick="goreview(1)">보기</button></th>
	<th>이 지역 후기보기</th>
	<th><button class="btn2" onclick="goreview(2)">보기</button></th>
</tr>




</table>
</div>
<br><br><br><br>
<script type="text/javascript">
	prearea1 ="<%=(String)request.getAttribute("prearea1")%>"; 
	prearea2 ="<%=(String)request.getAttribute("prearea2")%>"; 
	if(prearea1 != "null"){
		$("#area1").val(prearea1).prop("selected", true);
		$("#area2").val(prearea2).prop("selected", true);
		$("#btn1").click();
	}
	console.log(prearea1);
	function clic(){
		var area1 = $("#area1 option:selected").val();
		var area2 = $("#area2 option:selected").val();
		
		if(area1=="null" || area2 =="null"){
			alert("여행지를 선택해주세요.");
		}else if(area1==area2){
			alert("서로 다른 여행지를 선택해주세요.");
		}else{
			
			<%
			for(int i =0; i < arealist.size(); i++){%>
				if(area1=="<%=arealist.get(i).getName()%>"){
					$("#selectArea1").html(area1);
					$("#selectStyle1").html("<%=arealist.get(i).getStyle()%>");
					$("#selectPrice1").html("<%=arealist.get(i).getPrice1()%>만원 ~ <%=arealist.get(i).getPrice2()%>만원");
					$("#selectContent1").html("<%=arealist.get(i).getContent()%>");
					$("#selectVisa1").html("<%=arealist.get(i).getVisa()%>");
					$("#selectAirport1").html("<%=arealist.get(i).getAirport()%>");
				}
				if(area2=="<%=arealist.get(i).getName()%>"){
					$("#selectArea2").html(area2);
					$("#selectStyle2").html("<%=arealist.get(i).getStyle()%>");
					$("#selectPrice2").html("<%=arealist.get(i).getPrice1()%>만원 ~ <%=arealist.get(i).getPrice2()%>만원");
					$("#selectContent2").html("<%=arealist.get(i).getContent()%>");
					$("#selectVisa2").html("<%=arealist.get(i).getVisa()%>");
					$("#selectAirport2").html("<%=arealist.get(i).getAirport()%>");
				}
			<%}	%>			
		}
	}
	function goreview(i) {
		var sendarea;
		if(i==1){
			sendarea = $("#selectArea1").html();
		}else{
			sendarea = $("#selectArea2").html();
		}
		
		if(sendarea =="여행지역을 선택해주세요"){
			alert("여행지를 선택해주세요.");
		}else{
				location.href="hm_bbslist.do?sendarea="+sendarea;
		}


		
	}

</script>

