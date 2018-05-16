<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<%
LoginDto mem = (LoginDto)session.getAttribute("login");
if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>

<!-- Main -->
<div id="main">
<form name="frmForm1" id="_frmFormSearch" method="post" action="">
	<input type="hidden" name="orderCondition" id="_orderCondition" value="${ orderCondition }">
	<div>
	
	<!-- 최근 본 목록 추가 부분 -->
		<c:if test="${not empty recentlist }"> 
			<div class="w3-allerta" style="border: 10px solid transparent; border-image: url(images/border.png) 30% round; 
			 margin-left: 380px; padding-left:30px; width:750px; height: 222px;">
				<div style="margin-left: 230px; margin-top:20px">     
					<h3>- 최근 본 상품 목록 -</h3> 
				</div>
				 
				<c:forEach var="recentDto" items="${recentlist }" varStatus="i">
					<div style="float: left; margin-left: 30px; margin-top: 10px; width:100px">
						<img style="width:100%; height: 80px;" src="upload/${recentDto.pic }" onclick="view(${recentDto.seq });">  
						<p style="padding-top: 5px; text-align: center; color: black"><font size="3px">${recentDto.cname }</font></p>  
					</div>   
				</c:forEach>         
			</div>
		</c:if>
	<!-- /최근 본 목록 추가 부분 -->
	
		<div align="right">
			<button onclick="orderBy('museq')">최신순</button>
			<button onclick="orderBy('readcnt')">조회순</button>
			<!-- <a href="#" onclick="orderBy('museq')">최신순</a>
			<a href="#" onclick="orderBy('readcnt')">조회순</a> -->
		</div>
	</div>
	<div align="center">
		<c:if test="${ not empty s_keyword && not empty s_category }">
			<c:if test="${ s_category == 'cname' }">
				<br>[회사명] ${ s_keyword } 검색 결과
			</c:if>
			<c:if test="${ s_category == 'content' }">
				<br>[내용] ${ s_keyword } 검색 결과
			</c:if>
		</c:if>
	</div>
	<c:if test="${ empty muList }">
		<section style="align-content: center;align-self: center;text-align: center">
			게시물이 존재하지 않습니다.
		</section>
	</c:if>
	<section class="tiles" style="padding-top: 0px;padding-bottom: 0px">
		<!-- 리스트 출력 -->	
		<c:forEach items="${ muList }" var="mu" varStatus="i">
			<article>
				<span class="image">
					<c:if test="${ empty mu.pic1 || mu.pic1 eq ''}">
						<img src="images/pic01.jpg" alt="" style="width: 300px;height: 180px"/>
					</c:if>
					<c:if test="${ not empty mu.pic1 && mu.pic1 ne ''}">
						<img src="upload/${ mu.pic1 }" alt="" style="width: 300px;height: 180px" />
					</c:if>
				</span>
				<a href="#" onclick="detailView(${mu.museq})">
					<h2>${ mu.cname }</h2>
					<div class="content">
						<p>${ mu.content }</p>
					</div>
				</a>
			</article>
		</c:forEach>
	</section>
	
	<br><br>
	<!-- 검색관련 -->
	<section align="center">
		<div align="center">
			<div align="center" style="width:70%;">
				<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
				<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>						
				<select id="_s_category" name="s_category">
					<option value="" selected="selected">선택</option>
					<option value="cname">회사명</option>
					<option value="content">내용</option>							
				</select>
				<input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/>
				<button type="button" id="_btnSearch" onclick="search()">검색 </button>
			</div>
			<div align="center" style="width:70%;padding-left: 30px">
				<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
					<jsp:param value="${pageNumber }" name="pageNumber"/>
					<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
					<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
					<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
				</jsp:include>
			</div>
			<!-- 업체 등록 버튼 -->
			<c:if test="${login.auth eq 'admin'}">
				<div class="w3-container" style="align-content: center">
				   <button class="w3-btn w3-white w3-border w3-border-red w3-round-large" 
				      style="color: black; postion:" onclick="addMuView()">업체등록</button>
				</div>
			</c:if>
		</div>
	</section>
</form>
</div>

<script type="text/javascript">
var attrS_category = "${s_category}";
var attrS_keyword = "${s_keyword}";
// script로 검색 카테고리 선택되도록
if (attrS_keyword != "") {		// 검색한 경우
	$("select[name='s_category'] option[value='" + attrS_category +"']").attr("selected",true);
	
}

function detailView(museq) {
	location.href = "muDetailView.do?museq=" + museq;
}

function addMuView() {
	$("#_frmFormSearch").attr("target","_self").attr("action","addMuView.do").submit();
}

function search() {
	<% // TODO 검색시 페이지를 0으로 바꿔준다.%>
	$("#_pageNumber").val(0);
	$("#_frmFormSearch").attr({ "target":"_self", "action":"muMainView.do" }).submit();
}

function goPage(pageNumber) {	
	$("#_pageNumber").val(pageNumber);
	$("#_frmFormSearch").attr("target","_self").attr("action","muMainView.do").submit();
}

function orderBy(condition){
	$("#_orderCondition").val(condition);
//	alert($("#_orderCondition").val());
	$("#_pageNumber").val(0);
	$("#_frmFormSearch").attr({ "target":"_self", "action":"muMainView.do" }).submit();
}

function view(x){
	if(x >= 1000 && x <2000){
		//웨딩홀 
		location.href = "hallView.do?whseq="+x+"&pdseq="+x+"&usid=<%=mem.getId()%>";
	}else if(x >= 2000 && x < 3000){
		//청첩장
		location.href="carddetail.do?cdseq="+x+"&usid=<%=mem.getId()%>";
	}else if(x >= 3000 && x < 4000){
		//스튜디오
		location.href="studioDetail.do?stseq="+x+"&pdseq="+x+"&usid=<%=mem.getId()%>";
	}else if(x >= 4000 && x < 5000){
		//드레스
		location.href="dressDetail.do?dsseq="+x+"&pdseq="+x+"&usid=<%=mem.getId()%>";
	}else if(x >= 5000 && x < 6000){
		//메이크업
		location.href="muDetailView.do?museq="+x;
	}
}

</script>






