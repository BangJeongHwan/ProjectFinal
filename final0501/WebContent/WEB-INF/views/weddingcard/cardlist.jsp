<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<%
LoginDto mem = (LoginDto)session.getAttribute("login");

if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>

<%
String scategory = (String)request.getAttribute("s_category");
if(scategory == null) scategory = "";
%>

<script type="text/javascript">
var str='<%=scategory               %>';
$(document).ready(function(){	
	document.frmForm1.s_category.value = str;
	
	if($("#_s_keyword").val().trim() == ""){
		document.frmForm1.s_category.value = "";
	}	
}); 

</script> 

<style>
.c_list{
margin-top: 50px;

}

.cardlist_main{
background-color: white;
}

.c_list_{
margin-top: 30px;
margin-left: 40px;
width: 20%;
height: 50%;
text-align: center;
float: left;

}

.cl_search{
margin-top: 20px;

}

img{
width:195px;
height:165px;
}


</style>
<form name="frmForm" id="_frmForm" method="post" action="">
<div class="cardlist_main">
<div class = "container">
<section id="nino-portfolio">
<c:if test="${login.id eq 'admin'}">
	<button id="card_admin">관리자</button>
</c:if>
	
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">What we do</span>
				Wedding-Card
			</h2>
		</div>
		<div class="sectionContent">
			<ul class="nino-portfolioItems">
				<li class="item">
					<a href="views/card/card.jsp">
						<img src="assets/images/card/img-1.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-crown nino-icon"></i>
								<h4 class="title">creatively designed</h4>
								<span class="desc">Lorem ipsum dolor sit</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="assets/images/card/img-2.jpg">
						<img src="assets/images/card/img-2.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-cube-outline nino-icon"></i>
								<h4 class="title">creatively designed</h4>
								<span class="desc">Lorem ipsum dolor sit</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="assets/images/card/img-3.jpg">
						<img src="assets/images/card/img-3.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-desktop-mac nino-icon"></i>
								<h4 class="title">creatively designed</h4>
								<span class="desc">Lorem ipsum dolor sit</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="assets/images/card/img-4.jpg">
						<img src="assets/images/card/img-4.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-flower nino-icon"></i>
								<h4 class="title">creatively designed</h4>
								<span class="desc">Lorem ipsum dolor sit</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="assets/images/card/img-5.jpg">
						<img src="assets/images/card/img-5.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-gamepad-variant nino-icon"></i>
								<h4 class="title">creatively designed</h4>
								<span class="desc">Lorem ipsum dolor sit</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="assets/images/card/img-6.jpg">
						<img src="assets/images/card/img-6.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-gnome nino-icon"></i>
								<h4 class="title">creatively designed</h4>
								<span class="desc">Lorem ipsum dolor sit</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="assets/images/card/img-7.jpg">
						<img src="assets/images/card/img-7.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-guitar-electric nino-icon"></i>
								<h4 class="title">creatively designed</h4>
								<span class="desc">Lorem ipsum dolor sit</span>
							</div>
						</div>
					</a>
				</li>
			</ul>
		</div>
	</section><!--/#nino-portfolio-->


	<div style="border-bottom:1px solid lightgray;" class="c_list">
	<h2>&nbsp;&nbsp;청첩장 업체보기</h2>
	<span>행복이 시작되는 아름다운 날 for you, with us와 함께하세요. </span><br>
	</div>
	<c:forEach var="clist" items="${clist}" varStatus="clistS">
	<div class="c_list_">
		<div class="c_list_1">
			<div class="c_image">
				<a href = 'pagingcdlist.do?wiseq=${clist.wiseq}'> <img src="upload/${clist.picture} ">
				</a>
			</div>
			<h4 class="c_name">${clist.cname}</h4>
			<p class="c_title">${clist.content} </p>
		</div>
	</div>
	</c:forEach>	

	</div>
</div>
</form>


<div id="paging_wrap">
<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
	<jsp:param value="${pageNumber }" name="pageNumber"/>
	<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
	<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
	<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
</jsp:include>
</div>

<div class="cl_search">
<form name="frmForm1" id="_frmFormSearch" method="post" action="">

<table style="margin-left:auto; margin-right:auto; margin-top:3px; margin-bottom:3px; border:0; padding:0;">
<tr>
	<td>검색 : </td>
	<td style="padding-left:5px;">
		<select id="_s_category" name="s_category">
			<option value="" selected="selected">선택</option>
			<option value="cname">업체이름</option>
			<option value="content">소개글</option>								
		</select>
	</td>
	<td style="padding-left:5px;"><input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/></td>
	<td style="padding-left:5px;"><span class="button blue"><button type="button" id="_btnSearch"> 검색 </button></span></td>
</tr>
</table>

<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>						

</form>
</div>

<div>
<c:if test="${not empty recentlist }"> 
			<div class="w3-allerta" style="border: 10px solid transparent; border-image: url(images/border.png) 30% round; 
			 margin-left: 380px; padding-left:30px; width:750px; height: 222px;">
				<div style="margin-left: 230px; margin-top:20px">     
					<h2>- 최근 본 상품 목록 -</h2> 
				</div>
				 
				<c:forEach var="recentDto" items="${recentlist }" varStatus="i">
					<div style="float: left; margin-left: 30px; margin-top: 10px; width:100px">
						<img style="width:100%; height: 80px;" src="upload/${recentDto.pic }" onclick="view(${recentDto.seq });">  
						<p style="padding-top: 5px; text-align: center; color: black"><font size="3px">${recentDto.cname }</font></p>  
					</div>   
				</c:forEach>         
			</div>
		</c:if>
</div>
<script>
$("#card_admin").click(function() {
	alert('관리자');
	$("#_frmForm").attr({ "target":"_self", "action":"cadmin.do"}).submit();
});

// $("#review").click(function() {
// 	alert('후기');
// 	$("#_frmForm").attr({ "target":"_self", "action":"pagingrlist.do"}).submit();
// });


$("#_btnSearch").click(function() {
	alert('search');						
	$("#_frmFormSearch").attr({ "target":"_self", "action":"pagingclist.do" }).submit();
	
});
function goPage(pageNumber) {	
	$("#_pageNumber").val(pageNumber) ;
	$("#_frmFormSearch").attr("target","_self").attr("action","pagingclist.do").submit();
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
