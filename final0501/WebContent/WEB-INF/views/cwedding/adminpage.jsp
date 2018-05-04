<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<% 
	int b = 1;
	int a = 1;
	int c = 1;
%>


<c:if test="${ not empty flag && flag eq 'Gsuccess'}">
	<script type="text/javascript">
		alert("회원등급이 정상적으로 수정되었습니다.");
	</script>
</c:if>
<c:if test="${ not empty flag && flag eq 'Gfail'}">
	<script type="text/javascript">
		alert("등급 수정에 실패하였습니다. 다시 시도하여 주십시오");
	</script>
</c:if>

<c:if test="${ not empty delflag && delflag eq 'Delsuccess'}">
	<script type="text/javascript">
		alert("업체 탈퇴가 정상적으로 처리되었습니다.");
	</script>
</c:if>
<c:if test="${ not empty delflag && delflag eq 'Delfail'}">
	<script type="text/javascript">
		alert("업체 탈퇴에 실패하였습니다. 다시 시도하여 주십시오");
	</script>
</c:if>

<style type="text/css">
table {
	width: 1000px;
	border: 1px solid #EBEBEB;
	align-content: center;
	cursor: default;
}
tr{
	padding:  20px 20px;
	height: 60px;
}
th{
	background-color:#F8F8F8;
	align-content: center;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
}
td{
	align-content: center;
	text-align: center;
}
</style>


<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/hanna.css">

<div class="w3-container" style="color: black; width:1150px; float:left; padding-left:100px">
 <div class="w3-row">
    <a href="javascript:void(0)" onclick="openCity(event, 'London');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
      style="font-family: 'Hanna', Fantasy;">등록 완료 기업</div>
    </a>
    <a href="javascript:void(0)" onclick="openCity(event, 'Paris');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
      style="font-family: 'Hanna', Fantasy;">승인 대기 기업</div>
    </a>
    <a href="javascript:void(0)" onclick="openCity(event, 'Tokyo');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
      style="font-family: 'Hanna', Fantasy;">탈퇴 대기 기업</div>
    </a>
  </div>

  <div id="London" class="w3-container city" style="display:inline">
  <br><br>
    <div style="width: 650px">
    	<input type="hidden" name="cid" value="${cdto.cid }">
	    <table>
		    <colgroup>
		    	<col width=10%;><col width=20%;><col width=50%;><col width=20%;>
		    </colgroup>
		    
		    <tr>
				<th>번호</th>
				<th>업체 종류</th>
				<th>업체 이름</th>
				<th>사업자 등록 번호</th> 
		    </tr>
		    
			    <c:if test="${ empty companylist }">
					<tr>
						<td colspan="4">사이트에 등록된 업체가 없습니다.</td>
					</tr>
				</c:if>
			    
			    <c:forEach var="cdto" items="${companylist}" varStatus="i">
			    	<c:if test="${cdto.grade eq '1'}">
					    <tr>
					    	<td><%=b %></td>
					    	<td>${cdto.auth }</td>
						    <td>${cdto.cname }</td>
						    <td>${cdto.license }</td>
					    </tr>
					    	<%b++; %>
					</c:if>
			    </c:forEach>
	    </table>
    </div>
  </div>

  <div id="Paris" class="w3-container city" style="display:none">
  <br><br>
    <div style="width: 800px">
    	<input type="hidden" name="cid" value="${cdto.cid }">
	    <table>
		    <colgroup>
		    	<col width=10%;><col width=20%;><col width=35%;><col width=20%;><col width="15%">
		    </colgroup>
		    
		    <tr>
				<th>번호</th>
				<th>업체 종류</th>
				<th>업체 이름</th>
				<th>사업자 등록 번호</th> 
				<th>업체 등업</th>
		    </tr>
		    
		    <c:if test="${ empty companylist }">
				<tr>
					<td colspan="5">등록 대기 중인 업체가 없습니다.</td>
				</tr>
			</c:if>
		    <c:forEach var="cdto" items="${companylist}" varStatus="i">
		    	<c:if test="${cdto.grade eq '0'}">
				     <tr>
				    	<td><%=a %></td>
				    	<td>${cdto.auth }</td>
					    <td>${cdto.cname }</td>
					    <td>${cdto.license }</td>
					    <td><button type="button" name="cen" id="cen" value="${cdto.cid }" onclick="cen()" >등업 승인</button></td>
					 </tr>
					 <%a++; %>
				</c:if>
		    </c:forEach>
	    </table>
    </div>
  </div>

  <div id="Tokyo" class="w3-container city" style="display:none">
  <br><br>
    <div style="width: 800px">
    	<input type="hidden" name="cid" value="${cdto.cid }">
	    <table>
		    <colgroup>
		    	<col width=10%;><col width=20%;><col width=35%;><col width=20%;><col width="15%">
		    </colgroup>
		    
		    <tr>
				<th>번호</th>
				<th>업체 종류</th>
				<th>업체 이름</th>
				<th>사업자 등록 번호</th> 
				<th>탈퇴 승인</th>
		    </tr>
		    
		    <c:if test="${ empty companylist }">
				<tr>
					<td colspan="5">탈퇴 대기 중인 업체가 없습니다.</td>
				</tr>
			</c:if>
		    
		    <c:forEach var="cdto" items="${companylist}" varStatus="i">
		    	<c:if test="${cdto.grade eq '6'}">
				   <tr> 
			    	<td><%=c %></td>
			    	<td>${cdto.auth }</td>
				    <td>${cdto.cname }</td>
				    <td>${cdto.license }</td>
				    <td><button type="button" name="cdel" id="cdel" value="${cdto.cid }" onclick="cdel()" >탈퇴 승인</button></td>
			       </tr>
			       <%c++; %>
				</c:if>
		    </c:forEach>
	    </table>
    </div>
  </div>
  
</div>



<script>
function openCity(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
     tablinks[i].className = tablinks[i].className.replace(" w3-border-red", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.firstElementChild.className += " w3-border-red";
}
</script>

<script>
function cen(){
	var cid = $("#cen").val();
	location.href="companyenrollment.do?cid="+cid;
}

function cdel(){
	var cid = $("#cdel").val();
	location.href="companydelete.do?cid="+cid;
}
</script>
