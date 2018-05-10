<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
LoginDto mem = (LoginDto)session.getAttribute("login");
if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>

<!-- 검색 카테고리를 유지 start -->
<%
String category = (String)request.getAttribute("s_category");
if(category == null) category = "";
%>

<script type="text/javascript">
var str='<%=category %>';
$(document).ready(function(){	
	document.frmForm1.s_category.value = str;
	
	// text에 문자를 입력하지 않았을 경우, 초기화 해준다.
	if($("#_s_keyword").val().trim() == ""){
		document.frmForm1.s_category.value = "";
	}	
}); 
</script> 
<!-- 검색 카테고리를 유지 end -->


<!-- Main -->
<div id="main">
	<div class="inner">
	
		<c:if test="${not empty recentlist }">
			<div style="border:1px solid pink;width:750px; height: 120px; border: 1px; padding-left:200px;">
				<h3>최근 본 상품 목록</h3>
					<c:forEach var="recentDto" items="${recentlist }" varStatus="i">
						<div style="float: left">
							<img style="padding-left:10px; width:100px; hight: 100px;" src="upload/${recentDto.pic }" onclick="view(${recentDto.seq });">  
							<p style="size: 10px">${recentDto.cname }</p>
						</div>
					</c:forEach>
			</div>
		</c:if>
	
		<section class="tiles">
		<c:forEach var="sdDto" items="${sdDtolist}" varStatus="sdDtoS">
			<article class="style1">
				<span class="image">
					<img src="upload/${sdDto.pic1}" alt="" style="height: 200px; width: 250px"/>
				</span>
				<a href="studioDetail.do?stseq=${sdDto.stseq}&pdseq=${sdDto.stseq}&usid=<%=mem.getId()%>">
					<h2>${sdDto.cname}</h2>
					<div class="content">
						<p>${sdDto.content}</p>
					</div>
				</a>
			</article>
		</c:forEach>
		</section>
	</div>
</div>

<!-- 페이징 처리 -->
	<div style="text-align: center">
	<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
		<jsp:param value="${pageNumber }" name="pageNumber"/>
		<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
		<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
		<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
	</jsp:include>
	</div>

	<div>
	<form name="frmForm1" id="_frmFormSearch" method="post" action="">
	<table border="0" style="background-color: white">
	<tr>
		<td>
			<select id="_s_category" name="s_category">
				<option value="" selected="selected">선택</option>
				<option value="cid">기업이름</option>
				<option value="content">내용</option>									
			</select>
		</td>
		<td style="padding-left:5px;"><input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/></td>
		<td style="padding-left:5px;"><span><button type="button" id="_btnSearch"> 검색 </button></span></td>
	</tr>
	</table>
	
	<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>						
	
	</form>
	</div>
	
<!-- 스튜디오 등록 버튼 -->
<div class="w3-container" style="padding-left: 1200px;">
<c:if test="${ not empty login && login.auth == 'admin'}">
   <button class="w3-btn w3-white w3-border w3-border-red w3-round-large" 
      style="color: black; postion:" onclick="writeStudio()">업체등록</button>
</c:if>
</div>
<br>


<script>
<!-- 스튜디오 등록 버튼 해당 함수 -->
function writeStudio(){
   location.href="studioWrite.do"
}

$("#_btnSearch").click(function() {
	//alert('search');						
	$("#_frmFormSearch").attr({ "target":"_self", "action":"dressMain.do" }).submit();
	
});

function goPage(pageNumber) {	
	$("#_pageNumber").val(pageNumber) ;
	$("#_frmFormSearch").attr("target","_self").attr("action","dressMain.do").submit();
}

function view(x){
	if(x >= 1000 && x <2000){
		//웨딩홀 
	}else if(x >= 2000 && x < 3000){
		//청첩장
	}else if(x >= 3000 && x < 4000){
		//스튜디오
		location.href="studioDetail.do?stseq="+x+"&pdseq="+x+"&usid=<%=mem.getId()%>";
	}else if(x >= 4000 && x < 5000){
		//드레스
		location.href="dressDetail.do?dsseq="+x+"&pdseq="+x+"&usid=<%=mem.getId()%>";
	}else if(x >= 5000 && x < 6000){
		//메이크업
	}
	
}
</script>

<br><br><br><br><br>
