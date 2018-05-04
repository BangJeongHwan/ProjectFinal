<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

				
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
					<li class="active"><a href="#nino-header">Home <span class="sr-only">(current)</span></a></li>
					<li><a href="#nino-story">Wedding</a></li>
					<li><a href="#nino-services" onclick="sdm()">S/D/M</a></li>
					<li><a href="#nino-ourTeam">Travel</a></li>
					<li><a href="#nino-portfolio">Card</a></li>
					<li><a href="#nino-latestBlog">Q&A</a></li>
				</ul>
			</div><!-- /.navbar-collapse -->
			<ul class="nino-iconsGroup nav navbar-nav">
				<li><a href="#" onclick="basketList()"><i class="mdi mdi-cart-outline nino-icon"></i></a></li>
				<li><a href="#" class="nino-search"><i class="mdi mdi-magnify nino-icon"></i></a></li>
			</ul>
		</div>
	</div><!-- /.container-fluid -->
</nav>

<section id="nino-slider" class="carousel slide container" data-ride="carousel">
	
	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Weather Of Wedding</span>
				Welcome <br>to Spring
			</h2>
			<a href="#" class="nino-btn">Learn more</a>
		</div>
		<div class="item">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Congraturation</span>
				Happy <br>Weeding
			</h2>
			<a href="#" class="nino-btn">Learn more</a>
		</div>
		<div class="item">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Wedding Event</span>
				Compound <br>Discount
			</h2>
			<a href="#" class="nino-btn">Learn more</a>
		</div>
		<div class="item">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">For you, With Us</span>
				Full Of <br>Happines
			</h2>
			<a href="#" class="nino-btn">Learn more</a>
		</div>
	</div>

	<!-- Indicators -->
	<ol class="carousel-indicators clearfix">
		<li data-target="#nino-slider" data-slide-to="0" class="active">
			<div class="inner">
				<span class="number">01</span> intro	
			</div>
		</li>
		<li data-target="#nino-slider" data-slide-to="1">
			<div class="inner">
				<span class="number">02</span> work
			</div>
		</li>
		<li data-target="#nino-slider" data-slide-to="2">
			<div class="inner">
				<span class="number">03</span> about
			</div>
		</li>
		<li data-target="#nino-slider" data-slide-to="3">
			<div class="inner">
				<span class="number">04</span> contacts
			</div>
		</li>
	</ol>
</section>


<script type="text/javascript">
function index() {
	location.href = "index.do";
}
function sdm() {
	location.href = "studiomain.do";
}
function basketList() {
	location.href = "basketListView.do";
}

</script>
