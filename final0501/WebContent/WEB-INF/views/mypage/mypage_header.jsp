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
					<li class="active"><a href="#" onclick="location.href='index.do'"><i class="fa fa-home" style="font-size:23px"></i> <span class="sr-only">(current)</span></a></li>
					<li><a href="#" onclick="location.href='weddingHallView.do'">웨딩홀</a></li>
					<li><a href="#nino-services" onclick="sdm()">스드메</a></li>
					<li><a href="#" onclick="location.href='findhoney.do'">신혼여행</a></li>
					<li><a href="#" onclick="location.href='pagingclist.do'">청첩장</a></li>
					<li><a href="#" onclick="location.href='couponmain.do'">이벤트</a></li>
				</ul>
			</div><!-- /.navbar-collapse -->
			<ul class="nino-iconsGroup nav navbar-nav">
				<li><a href="#" onclick="basketListView()"><i class="mdi mdi-cart-outline nino-icon"></i></a></li>
				<li><a href="#" class="nino-search"><i class="mdi mdi-magnify nino-icon"></i></a></li>
			</ul>
		</div>
		</div>
</nav>


<script type="text/javascript">
function index() {
	location.href = "index.do";
}
function sdm() {
	location.href = "studiomain.do";
}
function basketListView() {
	location.href = "basketListView.do";
}
function wdh(){
	location.href = "weddingHallView.do";
}

</script>