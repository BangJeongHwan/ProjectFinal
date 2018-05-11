<%@page import="kh.com.a.model2.LoginDto"%>
<%@page import="kh.com.a.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 
<title>웨딩</title>
	

	<!-- css -->
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/materialdesignicons.min.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/prettyPhoto.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/unslider.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/template.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body data-target="#nino-navbar" data-spy="scroll">

<%
LoginDto mem = (LoginDto)session.getAttribute("login");
if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>

	<!-- Header
    ================================================== -->
	<header id="nino-header">
		<div id="nino-headerInner">					
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
						<a class="navbar-brand" href="index.jsp">For You, With Us</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="nino-menuItem pull-right">
						<div class="collapse navbar-collapse pull-left" id="nino-navbar-collapse">
							<ul class="nav navbar-nav">
								<li class="active"><a href="#nino-header"><i class="fa fa-home" style="font-size:23px"></i> <span class="sr-only">(current)</span></a></li>
								<li><a href="#" onclick="wdh()">웨딩홀</a></li>
								<li><a href="#" onclick="sdm()">스드메</a></li>
								<li><a href="#" onclick="location.href='findhoney.do'">신혼여행</a></li><!--todo hm  -->
								<li><a href="#" onclick="location.href='pagingclist.do'">청첩장</a></li>
								<li><a href="#" onclick="location.href='couponmain.do'">이벤트</a></li>
								<li hidden><a href="#nino-latestBlog" id="liservice"></a><li>
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
						<%} %>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="bbtn" id="_login"><span>로그인 </span></button>
						<button class="bbtn" onclick="location.href='SelectRegi.do'"><span>회원가입 </span></button>
					</div>
				</div><!-- /.container-fluid -->
			</nav>
		<section id="banner" data-video="assets/images/banner">
				<div class="inner">
					<!-- <h1>웨딩</h1> -->
				</div>
			</section>
			
		</div>
	</header><!--/#header-->
	
	
    <!-- 웨딩홀 1
    ================================================== -->
    <section id="nino-uniqueDesign">
    	<div class="container">
    		<h2 class="nino-sectionHeading" >
				<span class="nino-subHeading" >Will you marry me?</span>
				wedding-hall
			</h2>
			<div class="sectionContent">
				<div class="nino-devices">
					<img class="tablet" src="assets/images/unique-design/img-1.png" alt="">
					<img class="mobile" src="assets/images/unique-design/img-2.png" alt="">
				</div>
			</div>
    	</div>
    </section><!--/#nino-uniqueDesign-->

 <!-- 웨딩홀2
    ================================================== -->
    <section id="nino-latestBlog">
    	<div class="container">
    		<h2 class="nino-sectionHeading" onclick="location.href='views/hall/weddinghall.jsp'">
				<span class="nino-subHeading">Will you marry me?</span>
				WEDDING-HALL
			</h2>
			<div class="sectionContent">
				<div class="row">
					<div class="col-md-4 col-sm-4">
						<article>
							<div class="articleThumb">
								<img src="assets/images/weddinghall/img-1.jpg" alt="" onmouseover="initMap(37.515622,127.064773)">
								<div class="date">
									<span class="number">글올린날짜</span>
									<span class="text">글올린날짜</span>
								</div>
							</div>
							<h3 class="articleTitle"><a href="">꿈꿔왔던 그 이상의 웨딩 노블발렌티</a></h3>
							<p class="articleDesc">
								영국의 대저택 컨셉의 노블발렌티는 빅토리아 양식의 웅장하고 클래식한 느낌의 세리머니홀과 모던 클랙식 컨벱의 개별공간
							</p>
							<div class="articleMeta">
								<a href="#"><i class="mdi mdi-eye nino-icon"></i> 리드카운트</a>
								<a href="#"><i class="mdi mdi-comment-multiple-outline nino-icon"></i> 댓글카운트</a>
							</div>
						</article>
					</div>
					<div class="col-md-4 col-sm-4">
						<article>
							<div class="articleThumb">
								<img src="assets/images/weddinghall/img-2.jpg" alt="" onmouseover="initMap(-25.363,131.044)">
								<div class="date">
									<span class="number">14</span>
									<span class="text">Jan</span>
								</div>
							</div>
							<h3 class="articleTitle"><a href="">웨딩홀회사 이름</a></h3>
							<p class="articleDesc">
								웨딩홀 회사 내용
							</p>
							<div class="articleMeta">
								<a href="#"><i class="mdi mdi-eye nino-icon"></i> 995</a>
								<a href="#"><i class="mdi mdi-comment-multiple-outline nino-icon"></i> 42</a>
							</div>
						</article>
					</div>
					<div class="col-md-4 col-sm-4">
						<article>
							<div class="articleThumb">
								<img src="assets/images/weddinghall/img-3.jpg" alt="" id="wed3">
								<div class="date">
									<span class="number">12</span>
									<span class="text">Jan</span>
								</div>
							</div>
							<h3 class="articleTitle"><a href="">사진을 리스트에 랜덤숫자 받아서 뿌려도되고 자율적선택</a></h3>
							<p class="articleDesc">
								마우스 오버기능 추가 사진에 갖다 대면 그 웨딩홀의 위도경도 넣어주기
							</p>
							<div class="articleMeta">
								<a href="#"><i class="mdi mdi-eye nino-icon"></i> 1264</a>
								<a href="#"><i class="mdi mdi-comment-multiple-outline nino-icon"></i> 69</a>
							</div>
						</article>
					</div>
					
				</div>
			</div>
    	</div>
    </section><!--/#nino-latestBlog-->
    <div align="right" style="align-content:flex-end;">
					<a href="views/hall/weddinghall.jsp"><i class="fa fa-angle-double-right" style="font-size: 60px; color: white;"></i></a>
					</div>
    <!-- Map
    ================================================== -->
    <section id="nino-map">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
    			<i class="mdi mdi-map-marker nino-icon"></i>
    			<span class="text">Open map</span>
    			<span class="text" style="display: none;">Close map</span>
    		</h2>
    		<div class="mapWrap">
	    		<div id="wedmap" style="width: 100%; height: 200px; border: 0;" ></div>
	    		<!-- <iframe src="https://www.google.com/maps/embed?pb=!1m23!1m12!1m3!1d79466.26604960626!2d-0.19779784176715043!3d51.50733004537892!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m8!3e6!4m0!4m5!1s0x47d8a00baf21de75%3A0x52963a5addd52a99!2sLondon%2C+UK!3m2!1d51.5073509!2d-0.1277583!5e0!3m2!1sen!2s!4v1469206441744" width="800" height="600" frameborder="0" style="border:0" allowfullscreen></iframe> --> 
	    	</div>
    	</div>
    </section><!--/#nino-map-->

<!-- Story About Us
    ================================================== -->
	<section id="nino-story">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">What we do</span>
				Studio Dress Make-up
			</h2>
			<p class="nino-sectionDesc">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
			<div class="sectionContent">
				<div class="row nino-hoverEffect">
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<a class="overlay" href="views/studio/studio.jsp">
								<span class="content">
									 <i class="fa fa-camera nino-icon "></i>
									Studio
								</span>
								<img src="assets/images/story/img-1.jpg" alt="">
							</a>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<a class="overlay" href="views/dress/dress.jsp">
								<span class="content">	
									 <i class="fa fa-heart nino-icon "></i>
									Dress
								</span>
								<img src="assets/images/story/img-2.jpg" alt="">
							</a>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<a class="overlay" href="views/makeup/makeup.jsp">
								<span class="content">
									<i class="material-icons nino-icon">tag_faces</i>
									Make-up
								</span>
								<img src="assets/images/story/img-3.jpg" alt="">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</section><!--/#nino-story-->

	<!-- Counting
    ================================================== -->
    <section id="nino-counting">
    	<div class="container">
    		<div layout="row" class="verticalStretch">
    			<div class="item">
    				<div class="number">42</div>
    				<div class="text">Web Design Projects</div>
    			</div>
    			<div class="item">
    				<div class="number">123</div>
    				<div class="text">happy client</div>
    			</div>
    			<div class="item">
    				<div class="number">15</div>
    				<div class="text">award winner</div>
    			</div>
    			<div class="item">
    				<div class="number">99</div>
    				<div class="text">cup of coffee</div>
    			</div>
    			<div class="item">
    				<div class="number">24</div>
    				<div class="text">members</div>
    			</div>
    		</div>
    	</div>
    </section><!--/#nino-counting-->


   

    <!-- Testimonial
    ================================================== -->
    <section class="nino-testimonial">
    	<div class="container">
    		<div class="nino-testimonialSlider">
				<ul>
					<li>
						<div layout="row">
							<div class="nino-symbol fsr">
								<i class="mdi mdi-comment-multiple-outline nino-icon"></i>
							</div>
							<div>
								<p class="quote">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation."</p>
								<span class="name">Jon Doe</span>
							</div>
						</div>
					</li>
					<li>
						<div layout="row">
							<div class="nino-symbol fsr">
								<i class="mdi mdi-wechat nino-icon"></i>	
							</div>
							<div>
								<p class="quote">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation."</p>
								<span class="name">Jon Doe</span>
							</div>
						</div>
					</li>
					<li>
						<div layout="row">
							<div class="nino-symbol fsr">
								<i class="mdi mdi-message-text-outline nino-icon"></i>
							</div>
							<div>
								<p class="quote">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation."</p>
								<span class="name">Jon Doe</span>
							</div>
						</div>
					</li>
				</ul>
			</div>
    	</div>
    </section><!--/#nino-testimonial-->

   <!-- Our Team
    ================================================== -->
	<section id="nino-ourTeam">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">We must go</span>
				Honeymoon
			</h2>
			<p class="nino-sectionDesc">
				Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
			</p>
			<div class="sectionContent">
				<div class="row nino-hoverEffect">
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<div class="overlay" href="#">
								<div class="content">
									<a href="#" class="nino-icon"><i class="mdi mdi-facebook"></i></a>
									<a href="#" class="nino-icon"><i class="mdi mdi-twitter"></i></a>
									<a href="#" class="nino-icon"><i class="mdi mdi-pinterest"></i></a>
									<a href="#" class="nino-icon"><i class="mdi mdi-instagram"></i></a>
								</div>
								<img src="assets/images/honeymoon/img-1.jpg" alt="">
							</div>
						</div>
						<div class="info" onclick="location.href='findhoney.do'">
							<h4 class="name">나의 허니문 찾기</h4>
							<span class="regency">관광형 , 휴양형 , 먹방형</span>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<div class="overlay" href="#">
								<div class="content">
									<a href="#" class="nino-icon"><i class="mdi mdi-facebook"></i></a>
									<a href="#" class="nino-icon"><i class="mdi mdi-twitter"></i></a>
									<a href="#" class="nino-icon"><i class="mdi mdi-pinterest"></i></a>
									<a href="#" class="nino-icon"><i class="mdi mdi-instagram"></i></a>
								</div>
								<img src="assets/images/honeymoon/img-2.jpg" alt="">
							</div>
						</div>
						<div class="info" onclick="location.href='compareHoney.do'">
							<h4 class="name">지역비교해서 가기</h4>
							<span class="regency">지역 VS 지역</span>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<div class="overlay" href="#">
								<div class="content">
									<a href="#" class="nino-icon"><i class="mdi mdi-facebook"></i></a>
									<a href="#" class="nino-icon"><i class="mdi mdi-twitter"></i></a>
									<a href="#" class="nino-icon"><i class="mdi mdi-pinterest"></i></a>
									<a href="#" class="nino-icon"><i class="mdi mdi-instagram"></i></a>
								</div>
								<img src="assets/images/honeymoon/img-3.jpg" alt="">
							</div>
						</div>
						<div class="info" onclick="location.href='hm_bbslist.do'">
							<h4 class="name">여행지 공유하기 </h4>
							<span class="regency">신혼여행지 정보 공유</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#nino-ourTeam-->

	<!-- Brand
    ================================================== -->
    <section id="nino-brand">
    	<div class="container">
    		<div class="verticalCenter fw" layout="row">
    			<div class="col-md-2 col-sm-4 col-xs-6"><a href="#"><img src="assets/images/brand/img-1.png" alt=""></a></div>
    			<div class="col-md-2 col-sm-4 col-xs-6"><a href="#"><img src="assets/images/brand/img-2.png" alt=""></a></div>
    			<div class="col-md-2 col-sm-4 col-xs-6"><a href="#"><img src="assets/images/brand/img-3.png" alt=""></a></div>
    			<div class="col-md-2 col-sm-4 col-xs-6"><a href="#"><img src="assets/images/brand/img-4.png" alt=""></a></div>
    			<div class="col-md-2 col-sm-4 col-xs-6"><a href="#"><img src="assets/images/brand/img-5.png" alt=""></a></div>
    			<div class="col-md-2 col-sm-4 col-xs-6"><a href="#"><img src="assets/images/brand/img-6.png" alt=""></a></div>
    		</div>
    	</div>
    </section><!--/#nino-brand-->

	<!-- Portfolio
    ================================================== -->
	<section id="nino-portfolio">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">What we do</span>
				Wedding-Card
			</h2>
			<p class="nino-sectionDesc">
				Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
			</p>
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

	

    <!-- Footer
    ================================================== -->
    <footer id="footer">
        <div class="container">
        	<div class="row">
        		<div class="col-md-4">
        			<div class="colInfo">
	        			<div class="footerLogo">
	        				<a href="#" >Wedding</a>	
	        			</div>
	        			<p>
	        				Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
	        			</p>
	        			<div class="nino-followUs">
	        				<div class="totalFollow"><span>15k</span> followers</div>
	        				<div class="socialNetwork">
	        					<span class="text">Follow Us: </span>
	        					<a href="" class="nino-icon"><i class="mdi mdi-facebook"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-twitter"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-instagram"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-pinterest"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-google-plus"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-youtube-play"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-dribbble"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-tumblr"></i></a>
	        				</div>
	        			</div>
	        			<form action="" class="nino-subscribeForm">
	        				<div class="input-group input-group-lg">
								<input type="email" class="form-control" placeholder="Your Email" required>
								<span class="input-group-btn">
									<button class="btn btn-success" type="submit">Subscribe</button>
								</span>
							</div>
	        			</form>
        			</div>
        		</div>
        		<div class="col-md-4 col-sm-6">
        			<div class="colInfo">
	        			<h3 class="nino-colHeading">Blogs</h3>
	        			<ul class="listArticles">
	        				<li layout="row" class="verticalCenter">
	        					<a class="articleThumb fsr" href="#"><img src="assets/images/weddinghall/img-4.jpg" alt=""></a>
	        					<div class="info">
	        						<h3 class="articleTitle"><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing</a></h3>
	        						<div class="date">Jan 9, 2016</div>
	        					</div>
	        				</li>
	        				<li layout="row" class="verticalCenter">
	        					<a class="articleThumb fsr" href="#"><img src="assets/images/weddinghall/img-5.jpg" alt=""></a>
	        					<div class="info">
	        						<h3 class="articleTitle"><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing</a></h3>
	        						<div class="date">Jan 9, 2016</div>
	        					</div>
	        				</li>
	        				<li layout="row" class="verticalCenter">
	        					<a class="articleThumb fsr" href="#"><img src="assets/images/weddinghall/img-6.jpg" alt=""></a>
	        					<div class="info">
	        						<h3 class="articleTitle"><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing</a></h3>
	        						<div class="date">Jan 9, 2016</div>
	        					</div>
	        				</li>
	        			</ul>
        			</div>
        		</div>
        		<div class="col-md-4 col-sm-6">
        			<div class="colInfo">
	        			<h3 class="nino-colHeading">instagram</h3>
	        			<div class="instagramImages clearfix">
	        				<a href="#"><img src="assets/images/instagram/img-1.jpg" alt=""></a>
	        				<a href="#"><img src="assets/images/instagram/img-2.jpg" alt=""></a>
	        				<a href="#"><img src="assets/images/instagram/img-3.jpg" alt=""></a>
	        				<a href="#"><img src="assets/images/instagram/img-4.jpg" alt=""></a>
	        				<a href="#"><img src="assets/images/instagram/img-5.jpg" alt=""></a>
	        				<a href="#"><img src="assets/images/instagram/img-6.jpg" alt=""></a>
	        				<a href="#"><img src="assets/images/instagram/img-7.jpg" alt=""></a>
	        				<a href="#"><img src="assets/images/instagram/img-8.jpg" alt=""></a>
	        				<a href="#"><img src="assets/images/instagram/img-9.jpg" alt=""></a>
	        				<a href="#"><img src="assets/images/instagram/img-3.jpg" alt=""></a>
	        				<a href="#"><img src="assets/images/instagram/img-4.jpg" alt=""></a>
	        				<a href="#"><img src="assets/images/instagram/img-5.jpg" alt=""></a>
	        			</div>
	        			<a href="#" class="morePhoto">View more photos</a>
        			</div>
        		</div>
        	</div>
			<div class="nino-copyright">Copyright &copy; 2016 <a target="_blank" href="http://www.ninodezign.com/" title="Ninodezign.com - Top quality open source resources for web developer and web designer">Ninodezign.com</a>. All Rights Reserved. <br/> MoGo free PSD template by <a href="https://www.behance.net/laaqiq">Laaqiq</a></div>
        </div>
    </footer><!--/#footer-->

	
    <!-- Scroll to top
    ================================================== -->
	<a href="#" id="nino-scrollToTop">Go to Top</a>
	
	<!-- javascript -->
	<script type="text/javascript" src="assets/js/jquery.min.js"></script>	
	<script type="text/javascript" src="assets/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.hoverdir.js"></script>
	<script type="text/javascript" src="assets/js/modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="assets/js/unslider-min.js"></script>
	<script type="text/javascript" src="assets/js/template.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDIZ4hkMflbjiUrfDA_2S-AAyUvyKJxdc0&callback=initMap"></script>	<!-- 구글 맵  -->
	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<!-- css3-mediaqueries.js for IE less than 9 -->
	<!--[if lt IE 9]>
	    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->
		
		<script type="text/javascript">
		var auth = "<%=mem.getAuth()%>";
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
		
		$("#cart").click(function () {				//장바구니 클릭시
			if(auth=="guest"){
				alert("접근권한이 없습니다.");
			}else {
				location.href = "basketListView.do";
			}
		});

		
		$("#_login").click(function () {
			location.href = "javascript:void(window.open('login.do', '로그인','top=200px, left=500px, width=450, height=450,scrollbars=no,resizable=no' ))";
			
		});
		
		</script>
		
		
		<script type="text/javascript">						/*  구글맵에 대한 스크립트 */
			var itv;
		$("#liweding").click(function () {
			itv = setInterval("onservice()",2000);
		});
		function onservice() {
			$("#liservice").click();
			clearInterval(itv);
		}
		
		
	      function initMap(wido,kyungdo) {
	        var uluru = {lat: wido, lng: kyungdo};					// 위도 경도
	        var map = new google.maps.Map(document.getElementById('wedmap'), {	// wedmap에 뿌려줄거임
	          zoom: 16,								// 숫자가 올라갈수록 지도 확대
	          center: uluru						
	        });
	        var marker = new google.maps.Marker({		
	          position: uluru,
	          map: map
	        });
	      }
	      
	      function sdm(){
	    	  location.href="studiomain.do";
	      }
	      function wdh(){
	    	  location.href="weddingHallView.do";
	      }
	    </script>
	    
	    <script type="text/javascript">
	
		function mypage(){
			var auth = "<%=mem.getAuth()%>";
			
			if(auth=="member"){
				location.href="memmypage.do";
			}else if(auth="admin"){
				location.href="adminpage.do";
			}
		}
		function mrlist() {
			$("#_frmForm").attr({ "target":"_self", "action":"myrlist.do"}).submit();
		}
	</script>
	    

</body>
</html>