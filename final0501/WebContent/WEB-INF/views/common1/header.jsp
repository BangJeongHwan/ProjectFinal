<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<%
LoginDto mem = (LoginDto)session.getAttribute("login");
if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>
			
<nav id="nino-navbar" class="navbar navbar-default" role="navigation">
	<div class="container">

		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nino-navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.do">For You, With Us</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="nino-menuItem pull-right">
			<div class="collapse navbar-collapse pull-left" id="nino-navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="#" onclick="location.href='index.do'"><i class="fa fa-home" style="font-size:23px"></i></a></li>
					<li><a href="#" onclick="location.href='weddingHallView.do'">웨딩홀</a></li>
					<li class="active"><a href="#nino-services" onclick="sdm()">스드메 <span class="sr-only">(current)</span></a></li>
					<li><a href="#" onclick="location.href='findhoney.do'">신혼여행</a></li>
					<li><a href="#" onclick="location.href='pagingclist.do'">청첩장</a></li>
					<li><a href="#" onclick="location.href='couponmain.do'">이벤트</a></li>
				</ul>
			</div><!-- /.navbar-collapse -->
			<%
				if (!mem.getAuth().equals("guest")) {
			%>
			<ul class="nino-iconsGroup nav navbar-nav">
				<%
					if (mem.getAuth().equals("member")) {
				%>
				<li><a href="#" onclick="basketList()"><i class="mdi mdi-cart-outline nino-icon"></i></a></li>
				<%}%>
				<!-- <li><a href="#" class="nino-search"><i class="mdi mdi-magnify nino-icon"></i></a></li> -->
				<li>			
					<div class="dropdown" id="admindrop">
					  <button class="dropbtn"><i class="fa fa-user nino-icon"></i></button>
					   <div class="dropdown-content">
					    <span onclick="location.href='adminpage.do'">업체관리</span>
					    <span onclick="location.href='logout.do'">로그아웃</span>
					  </div>
					</div>
					<div class="dropdown" id="memdrop">
					  <button class="dropbtn"><i class="fa fa-user nino-icon"></i></button>
					  <div class="dropdown-content">
					    <span onclick="location.href='memmypage.do'">정보수정</span>
					    <span onclick="location.href='memReservList.do'">예약/결제내역</span>
					    <span onclick="location.href='jjimList.do'">찜한 목록</span>
					    <span onclick="mrlist()">나의 리뷰</span>
					    <span onclick="location.href='mecp.do'">내 쿠폰보기</span>
					    <span onclick="location.href='logout.do'">로그아웃</span>
					  </div>
					</div>
					<div class="dropdown" id="comdrop">
					  <button class="dropbtn"><i class="fa fa-user nino-icon"></i></button>
					  <div class="dropdown-content">
					    <span onclick="location.href='commypage.do'">정보수정</span>
					   <%if(mem.getAuth().equals("WH")){ %>
							<span onclick="location.href='reservationWhList.do'">예약승인</span>
						<%}else if(mem.getAuth().equals("DS")){ %>
							<span onclick="location.href='reservationDressList.do'">예약승인</span>
						<%} %>
					    <span onclick="location.href='comPayView.do'">판매목록</span>
					    <span onclick="location.href='logout.do'">로그아웃</span>
					  </div>
					</div>
							
				</li>
			</ul>
			<font style="color: white;"><b style="font-size: 20px"><%=mem.getId()%></b>님 환영합니다.</font>
			<%
				}
			%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="bbtn" id="_login"><span>로그인 </span></button>
			<button class="bbtn" onclick="location.href='SelectRegi.do'"><span>회원가입 </span></button>
		</div>
	</div><!-- /.container-fluid -->
</nav>

<section id="nino-slider" class="carousel slide container" data-ride="carousel">
	
	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Studio</span>
				Weather <br>Of Wedding
			</h2>
			<a href="#" class="nino-btn" onclick="location.href='studiomain.do'">more</a>
		</div>
		<div class="item">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Dress</span>
				Happy <br>Wedding
			</h2>
			<a href="#" class="nino-btn" onclick="location.href='dressMain.do'">more</a>
		</div>
		<div class="item">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Makeup</span>
				Full Of <br>Happiness
			</h2>
			<a href="#" class="nino-btn" onclick="location.href='muMainView.do'">more</a>
		</div>
		<div class="item">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Wedding Event</span>
				Compound <br>Discount
			</h2>
			<a href="#" class="nino-btn" onclick="location.href='couponmain.do'">more</a>
		</div>
	</div>

	<!-- Indicators -->
	<ol class="carousel-indicators clearfix">
		<li data-target="#nino-slider" data-slide-to="0" class="active">
			<div class="inner">
				<span class="number">01</span> 스튜디오	
			</div>
		</li>
		<li data-target="#nino-slider" data-slide-to="1">
			<div class="inner">
				<span class="number">02</span> 드레스
			</div>
		</li>
		<li data-target="#nino-slider" data-slide-to="2">
			<div class="inner">
				<span class="number">03</span> 메이크업
			</div>
		</li>
		<li data-target="#nino-slider" data-slide-to="3">
			<div class="inner">
				<span class="number">04</span> 이벤트
			</div>
		</li>
	</ol>
</section>


<script type="text/javascript">
var auth = "<%=mem.getAuth()%>";
function index() {
	location.href = "index.do";
}
function sdm() {
	location.href = "studiomain.do";
}
function basketList() {
	location.href = "basketListView.do";
}
function mypage(){
	if(auth=="member"){
		location.href="memmypage.do";
	}else if(auth="admin"){
		location.href="adminpage.do";
	}
}	
function mrlist() {
	$("#_frmForm").attr({ "target":"_self", "action":"myrlist.do"}).submit();
}


/* 로그인 회원가입 버튼 없애기 */
if(auth=="guest") $(".bbtn").show();
else $(".bbtn").hide();

if(auth=="admin"){
	$("#admindrop").show();
	$("#memdrop").hide();
	$("#comdrop").hide();
}else if(auth=="member"){
	$("#memdrop").show();
	$("#admindrop").hide();
	$("#comdrop").hide();
} else if (auth=="admin") {
	$("#memdrop").show();
	$("#admindrop").hide();
	$("#comdrop").hide();
} else {
	$("#comdrop").show();
	$("#memdrop").hide();
	$("#admindrop").hide();
}

$("#_login").click(function () {
	location.href = "javascript:void(window.open('login.do', '로그인','top=200px, left=500px, width=450, height=450,scrollbars=no,resizable=no' ))";
	
});

</script>
