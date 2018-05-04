<%@page import="kh.com.a.model.CouponDto"%>
<%@page import="java.util.List"%>
<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/template.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/materialdesignicons.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/prettyPhoto.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/unslider.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<title>웨딩</title>
	
	<%
		List<CouponDto> list = (List<CouponDto>)request.getAttribute("challenge");
	int persent1;
	int persent2;
	int persent3;
	 int seq0=0;
	 int seq1=0;
	 int seq2=0;
	 int userremit0=0;
	 int userremit1=0;
	 int userremit2=0;
	 
	if(list.isEmpty()){
		 persent1 = 0;
		 persent2 = 0;
		 persent3 = 0;
	}else{
		 persent1 = list.get(0).getDiscount();
		 persent2 = list.get(1).getDiscount();
		 persent3 = list.get(2).getDiscount();
		 seq0 = list.get(0).getSeq();
		 seq1 = list.get(1).getSeq();
		 seq2 = list.get(2).getSeq();
		  userremit0 = list.get(0).getUserremit();
		  userremit1 = list.get(1).getUserremit();
		  userremit2 = list.get(2).getUserremit();
	}
		
	%>
<style type="text/css">
#nino-header{
	content: "";
    position: relative;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: none;
}
#nino-header:after {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: none;
}
#nino-navbar {
    background: white;
    border: none;
    border-radius: 0;
    padding: 20px;
}
#nino-navbar-collapse {
    margin-left: -10%;
    position: relative;
}

#nino-navbar .navbar-nav > li > a {
    color: #000;
    font-size: 25px;
    font-weight: 500;
    border-bottom: 3px solid transparent;
    padding: 16px 5px 5px;
    margin: 1px 65px;
    text-shadow: 0 0 black;
    line-height: 40px;
}
#nino-uniqueDesign {
   /*padding-bottom: 0; */
    margin-bottom: 0px; 
    background: #e0e0e0 url(<%=request.getContextPath()%>/assets/images/coupon/bgimg.jpg) repeat-x; /*center center / cover  */
    height: 970px;
}


.nino-sectionHeading .nino-subHeading {
    display: block;
    text-transform: none;
    font-weight: 800;
    font-family: 'Kaushan Script', cursive;
    font-size: 55px;
    margin-bottom: 20px;
}
.nino-sectionHeading {
    font-weight: 700;
    font-size: 45px;
    line-height: 1;
    position: relative;
    padding-bottom: 20px;
    margin-bottom: 30px;
    text-align: center;
    color: #333;
}
#nino-uniqueDesign .nino-devices .mobile {
    position: absolute;
    bottom: auto;
    left: 20%;
    margin-left: unset;
    cursor: pointer;
    width: 60%;
}
@media (max-width: 992px) {
	section {
		padding: 45px 0;
	}
}
@media (min-width: 768px){
	.navbar-nav>li {
	    float: left;
	    border-right: 1px solid #eaeaea;
	}
}
#nino-uniqueDesign .span{
	font-size: 20px;
    position: absolute;
    margin-top: 33%;
    margin-left: 15%;
}
#nino-latestBlog {
		text-align: center;
		background: #e0e0e0 url(<%=request.getContextPath()%>/assets/images/coupon/bgimg-2.jpg) no-repeat center center / cover;
		height: 1500px;
	}
.articleThumb img{
	margin-top: 50px;
	cursor: pointer;
}


#timesection{
	text-align: center;
	background: #e0e0e0 url(<%=request.getContextPath()%>/assets/images/coupon/bgimg-3.jpg) no-repeat center center / cover;
	height: 970px;



}
.progress {
  	height: 70px;
    margin-top: 30px;
    overflow: hidden;
    background-color: #f5f5f5;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,.1);
    box-shadow: inset 0 1px 2px rgba(0,0,0,.1);
}

.progress-bar {
    float: left;
    width: 0;
    height: 100%;
    color: #fff;
    text-align: center;
    background-color: #ffaaaa;
    -webkit-box-shadow: inset 0 -1px 0 rgba(0,0,0,.15);
    box-shadow: inset 0 -1px 0 rgba(0,0,0,.15);
    -webkit-transition: width .6s ease;
    -o-transition: width .6s ease;
    transition: width .6s ease;
}
.timeslate{
	font-size: 30px;
    line-height: 35px;
}


.nino-fixed-nav #nino-navbar {
    position: fixed;
    padding: 5px;
    top: 0;
    left: 0;
    width: 100%;
    background: rgba(241, 114, 114, 0.96);
    z-index: 2;
    -webkit-animation-duration: .5s;
    animation-duration: .5s;
    -webkit-animation-fill-mode: both;
    animation-fill-mode: both;
    -webkit-animation-name: fadeInDown;
    animation-name: fadeInDown;
}
.nino-fixed-nav #nino-navbar .navbar-nav > li > a {
        font-size: 15px;
    line-height: 1;
}
.nino-fixed-nav #nino-navbar .navbar-nav > li {
	border: none;
}
#scrollToHome {
    width: 70px;
    height: 70px;
    padding-top: 5px;
    text-align: center;
    text-decoration: none;
    position: fixed;
    bottom: 100px;
    right: 90px;
    display: none;
    cursor: pointer;
    z-index: 2;
    border: 3px solid white;
    border-radius: 45px;
}

.prodiv5{
	display: none;
    width: 204px;
    height: 93px;
    position: relative;
    background: #e0e0e0 url(<%=request.getContextPath()%>/assets/images/coupon/<%=persent1%>pro.jpg) no-repeat center center / cover;
}

.prodiv15{
	display: none;
    width: 14%;
    height: 7.5%;
    position: relative;
    background: #e0e0e0 url(<%=request.getContextPath()%>/assets/images/coupon/<%=persent2%>pro.jpg) no-repeat center center / cover;
}
.prodiv20{
	display: none;
    width: 7%;
    height: 3.75%;
    position: relative;
    background: #e0e0e0 url(<%=request.getContextPath()%>/assets/images/coupon/<%=persent3%>pro.jpg) no-repeat center center / cover;
    display: none;
}


</style>
</head>
<body data-target="#nino-navbar" data-spy="scroll">
<%
LoginDto mem = (LoginDto)session.getAttribute("login");
if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>
<!-- Header    ================================================== -->
	<div style="min-width: 1280px; height: 512px; background: url(<%=request.getContextPath()%>/assets/images/coupon/main_bg.jpg) repeat-x;">
		<img src="<%=request.getContextPath()%>/assets/images/coupon/main_visual.png" style="height: 100%;position: relative; margin-left: 20%;"> 
	</div>
	<header id="nino-header">
		<div id="nino-headerInner">					
			<nav id="nino-navbar" class="navbar navbar-default" role="navigation">
				<div class="container">

				<div class="nino-menuItem pull-right">
						<div class="collapse navbar-collapse pull-left" id="nino-navbar-collapse">
							<ul class="nav navbar-nav">
								<li><a href="#nino-uniqueDesign">
									<div align="center">
										웰컴!	<br> 웨딩 기프트 ▼
									</div>
								</a></li>
								<li><a href="#nino-latestBlog">
									<div align="center">
										핫딜!	<br> 웨딩 기프트 ▼
									</div>
								</a></li>
								<li><a href="#timesection">
									<div align="center">
										타임<br> 웨딩 기프트 ▼
									</div>
								</a></li>
								<li><a href="#nino-brand">
									<div align="center">
										매일<br> 웨딩 기프트 ▼
									</div>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</nav>
			
		</div>
	</header><!--/#header-->
	
	<!-- <a style=" position: fixed; z-index: 100;"><i class="fa fa-home" style="font-size:23px"></i></a> -->
	<a id="scrollToHome" href="index.do"><i class="fa fa-home" style="font-size:50px; color: white;"></i></a>
	
<section id="nino-uniqueDesign">
    	<div class="container">
    		<h2 class="nino-sectionHeading" >
				<span class="nino-subHeading" >웰컴!</span>
				 웨딩 기프트
			</h2>
			<div class="sectionContent">
				<div class="nino-devices">
					<img class="mobile" src="<%=request.getContextPath()%>/assets/images/coupon/welcome_img.png" data-toggle="modal" data-target="#myModal">
					<span style="position: absolute; font-size: 33px; right: 41%; margin-top: 21%; cursor: pointer;">
						<c:if test="${empty share}">
								쿠폰 등록 가즈아ㅏㅏ
						</c:if>
						<c:if test="${!empty share}">
							공유하고 <b>${share.discount}%</b> 쿠폰받자		
						</c:if>
						
					</span>
				</div>
			</div>
			<span class="span">
				
				<c:if test="${!empty share}">
				* 혜택 기간 내(&nbsp;${share.opendate}&nbsp;~&nbsp;${share.closedate}&nbsp;)&nbsp;&nbsp;&nbsp;<a>#ForYou,WithUs</a>&nbsp;&nbsp;&nbsp;
				해쉬태그&nbsp;&nbsp;&nbsp;공유하고&nbsp;&nbsp;&nbsp;혜택받자!!		
				</c:if>
				
			</span> 
    	</div>
    	<%if(mem.getAuth().equals("admin")){%>
    	<button onclick="location.href='sharecp.do'" 
    	style="position: absolute;right: 70px;border: 5px solid inherit;border-radius:  10px;background:  none;padding: 6px 20px;font-weight: bold;font-size: 20px;">쿠폰등록</button>
    	<%}	%>
    	
    </section>
    
    
       <!-- Modal content-->
     <div class="modal fade" id="myModal" role="dialog">
    	<div class="modal-dialog">
		      <!-- Modal content-->
     		 <div class="modal-content">
     		 
		        <div class="modal-header">
        		  <button type="button" class="close" data-dismiss="modal" onclick="moclose()">&times;</button>
         			 <h4 class="modal-title">Modal Header</h4>
        		</div>
        		<div class="modal-body">
          							<a href="#facebook" style="margin-left: 40px;"><i class="fa fa-facebook-square" style="font-size: 60px;"></i> </a>
									<a href="#twitter" style="margin-left: 40px;"><i class="fa fa-twitter" style="font-size: 60px;"></i></a>
									<a href="#google" style="margin-left: 40px;"><i class="fa fa-google-plus-square" style="font-size: 60px;"></i></a>
									<a href="#kakaostory" style="margin-left: 40px;"><img src="<%=request.getContextPath()%>/assets/images/coupon/kakao.png"/></a>
        		</div>
        		<div class="modal-footer">
          			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="moclose()">Close</button>
		        </div>
		        <input type="hidden" name="copy_url" id="copy_url" style="height:0;font-size:0;">#ForYou,WithUs
		        <input type="hidden" id="checkShare" value="">
		        
		        </div>
      		</div>
      
    </div>
			
<!--   ================================================== -->
    <section id="nino-latestBlog">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">핫딜!</span>
				웨딩 기프트
			</h2>
			
			<c:if test="${!empty challenge}">
			
				<div class="sectionContent">
					<div class="row">
						<div class="col-md-4 col-sm-4">
						
							<article id="_pro5">
								<div class="articleThumb">
									<img src="assets/images/coupon/<%=persent1%>pro.jpg" alt="">
								</div>
								<p class="articleDesc">
									<b><%=persent1%>%</b> 쿠폰 도전하기
								</p>
							</article>
						</div>
						<div class="col-md-4 col-sm-4">
							<article id="_pro15">
								<div class="articleThumb">
									<img src="assets/images/coupon/<%=persent2%>pro.jpg" alt="">
								</div>
								<p class="articleDesc">
									<b><%=persent2%>%</b> 쿠폰 도전하기
								</p>
							</article>
						</div>
						<div class="col-md-4 col-sm-4">
							<article id="_pro20">
								<div class="articleThumb">
									<img src="assets/images/coupon/<%=persent3%>pro.jpg" alt="">
								</div>
								<p class="articleDesc">
									<b><%=persent3%>%</b> 쿠폰 도전하기
								</p>
							</article>
						</div>
						
					</div>
				</div>
				<div style="margin-top: 70px; height: 900px; width: 1100px;" >
						<div class="prodiv5" onclick="flyclick(5)"></div>
						<div class="prodiv15" onclick="flyclick(15)"></div>
						<div class="prodiv20" onclick="flyclick(20)"></div>
				</div>
				
			</c:if>
			<c:if test="${empty challenge}">
				<img src="<%=request.getContextPath()%>/assets/images/coupon/nochal.png">
			</c:if>
    	</div>
    	<%if(mem.getAuth().equals("admin")){%>
    	<button onclick="location.href='challengecp.do'" 
    	style="position: absolute;right: 70px;border: 5px solid inherit;border-radius:  10px;background:  none;padding: 6px 20px;font-weight: bold;font-size: 20px;">쿠폰등록</button>
    </section><!--/#nino-latestBlog-->
    <%} %>
    
    
    
    
    <section id="timesection">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">타임!</span>
				웨딩 기프트 실시간 현황
			</h2>
			<div style="color: #FF5E93;">
				<p style="font-size: 35px; font-weight: bold;">남은 쿠폰수량</p>
				<p style="font-size: 80px; font-weight: bold;" id="timebarper"></p>
			</div>
			<div class="progress">
			    <div class="progress-bar progress-bar-striped active" id="timebar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
			    </div>
			</div>
				<br><br>
			<c:if test="${!empty time}">
				<div class="timeslate">
					<b id="lhtml"></b>
					<b id="lhour"></b>시
					<b id="lmin"></b>분
					<b id="lsec"></b>초<br>
					남았습니다.
				</div>
			</c:if>
			<c:if test="${empty time}">
				<div class="timeslate">
					<b>쿠폰등록 해주세요.</b>
				</div>
			</c:if>
    	</div>
    	<%if(mem.getAuth().equals("admin")){%>
    	<button onclick="location.href='timecp.do'" 
    	style="position: absolute;right: 70px;border: 5px solid inherit;border-radius:  10px;background:  none;padding: 6px 20px;font-weight: bold;font-size: 20px;">쿠폰등록</button>
    	 <%}else{ %>
    	<button id="timebtn" style="position: absolute;right: 70px;border: 5px solid inherit;border-radius:  10px;background:  none;padding: 6px 20px;font-weight: bold;font-size: 20px;">쿠폰받기</button>
    <%} %>
    
    </section>
   
    <section id="nino-brand">
    	<div class="container">
    		<div class="verticalCenter fw" layout="row">
    			<div class="col-md-2 col-sm-4 col-xs-6"><a href="#nino-brand"><img src="assets/images/coupon/gift.png" alt="" onclick="ranclick(1)"></a></div>
    			<div class="col-md-2 col-sm-4 col-xs-6"><a href="#nino-brand"><img src="assets/images/coupon/gift.png" alt="" onclick="ranclick(2)"></a></div>
    			<div class="col-md-2 col-sm-4 col-xs-6"><a href="#nino-brand"><img src="assets/images/coupon/gift.png" alt="" onclick="ranclick(3)"></a></div>
    			<div class="col-md-2 col-sm-4 col-xs-6"><a href="#nino-brand"><img src="assets/images/coupon/gift.png" alt="" onclick="ranclick(4)"></a></div>
    			<div class="col-md-2 col-sm-4 col-xs-6"><a href="#nino-brand"><img src="assets/images/coupon/gift.png" alt="" onclick="ranclick(5)"></a></div>
    		</div>
    	</div>
    	<%if(mem.getAuth().equals("admin")){%>
    	<button onclick="location.href='ramdomcp.do'" 
    	style="position: absolute;right: 70px;border: 5px solid inherit;border-radius:  10px;background:  none;padding: 6px 20px;font-weight: bold;font-size: 20px;">쿠폰등록</button>
    	<%} %>
    </section><!--/#nino-brand-->
    
    
    <script type="text/javascript">
    var memid = "<%=mem.getId()%>";
  //SNS에 공유하기 기능
 	 $(".modal-body a").click(function(e){
		e.preventDefault();
		var url = $('#copy_url').html();
		var share_type = $(this).attr("href").replace("#","");

		if(share_type == "facebook"){
			var share_url = "http://www.facebook.com/sharer/sharer.php?u="+"#";
		}else if(share_type == "google"){
			var share_url = "https://plus.google.com/share?url="+url;
		}else if(share_type == "twitter"){
			var share_url = "https://twitter.com/intent/tweet?url="+url;
		}else if(share_type == "kakaostory"){
			var share_url = "https://story.kakao.com/share?url="+url;
		}
		$("#checkShare").val(share_type);
		if(share_type != "clipboard"){
			window.open(share_url,share_type,'width=695,height=660,toolbar=no,scrollbars=no,status=no');
		}
	}); 

	
	
	$(window).scroll(function(){
		if ($(this).scrollTop() > 200) {
			$('#scrollToHome').css("display","block");
		}else {
			$('#scrollToHome').css("display","none");
		}
		
		if($(this).scrollTop() < 1552 || $(this).scrollTop() > 3032){
			 $(".prodiv5").stop(true);
			 $(".prodiv15").stop(true);
	    	 $(".prodiv20").stop(true);
	    	 $(".prodiv5").css("display","none");
	    	 $(".prodiv15").css("display","none");
	    	 $(".prodiv20").css("display","none");
		}
		
		/* console.log($(this).scrollTop()); */
	});
	//1532 3032
    $("#_pro5").click(function () {
    	 $(".prodiv15").stop(true);
    	 $(".prodiv20").stop(true);
    	 $(window).scrollTop(2180).focus();
    	 
    	 $(".prodiv5").css("display","block");
    	 $(".prodiv15").css("display","none");
    	 $(".prodiv20").css("display","none");
    		for (var i = 0; i < 300; i++) { 
    			var topNum = Math.floor((Math.random() * 800) + 1);
      	              var leftNum = Math.floor((Math.random() * 1000) + 1);
      	          $(".prodiv5").animate({ top:topNum,
      	                left:leftNum},1000);
      	     }
	});
    $("#_pro15").click(function () {
    	 $(".prodiv5").stop(true);
    	 $(".prodiv20").stop(true);
    	 $(window).scrollTop(2180).focus();
    	 
    	 $(".prodiv5").css("display","none");
    	 $(".prodiv15").css("display","block");
    	 $(".prodiv20").css("display","none");
    		for (var i = 0; i < 500; i++) { 
    			var topNum = Math.floor((Math.random() * 800) + 1);
      	              var leftNum = Math.floor((Math.random() * 1000) + 1);
      	          $(".prodiv15").animate({ top:topNum,
      	                left:leftNum},500);
      	     }
	});
    $("#_pro20").click(function () {
    	 $(".prodiv5").stop(true);
    	 $(".prodiv15").stop(true);
    	 $(window).scrollTop(2180).focus();
    	 
    	 $(".prodiv5").css("display","none");
    	 $(".prodiv15").css("display","none");
    	 $(".prodiv20").css("display","block");
    		for (var i = 0; i < 300; i++) { 
    			var topNum = Math.floor((Math.random() * 900) + 1);
      	              var leftNum = Math.floor((Math.random() * 1200) + 1);
      	          $(".prodiv20").animate({ top:topNum,
      	                left:leftNum},200);
      	     }
	});
    $(".mobile").click(function () {
    	$(".sns_share_layer").css("display","block");
	});
    
    ///////////////쿠폰 클릭
    function flyclick(pro) {
    	if(memid == "guest"){
    		location.href = "javascript:void(window.open('login.do', '로그인','top=200px, left=500px, width=450, height=450,scrollbars=no,resizable=no' ))";
    	}else{
    	 	if(pro == 5){
				$(".prodiv5").stop(true);
				alert(<%=persent1%>+"% 당첨");
				acqCp("<%=seq0%>","<%=userremit0%>");
			}else if(pro == 15){
				$(".prodiv15").stop(true);
				alert(<%=persent2%>+"% 당첨");
				acqCp("<%=seq1%>","<%=userremit1%>");
			}else{
				$(".prodiv20").stop(true);
				alert(<%=persent3%>+"% 당첨");
				acqCp("<%=seq2%>","<%=userremit2%>");
			}
    	}
    }
   $("#timebtn").hide();
	if("${time}" != ""){
    
	    var shour = '${time.shour}';
	    var smin = '${time.smin}';
	    var timeremit = '${time.timeremit}';
	    shour=Number(shour);
	    smin=Number(smin);
	    timeremit=Number(timeremit);
	    
	    var timer1 = setInterval("timer1start()", 1000);
	    var timer2;
	    
	    function timer1start() {
	    	var d = new Date();
	    	var hour = d.getHours();			//현재시간 시
	        var min = d.getMinutes();			//현재시간 분
	        var sec = d.getSeconds();			//현재시간 초
			
	        sTime = shour*60+smin;				//시작시간 모든시간 분단위로
	        srTime = shour*60+smin+timeremit;   //시작시간 모든시간 + 마감시간 분단위로
	        dTime = hour*60+min;				// 현재시간 분단위로
	        
	        if(sTime>dTime){					//타임 쿠폰 시작전
	        	var sdt = sTime-dTime;         // 시작시간 - 현재시간
	           var lhour = Math.floor(sdt / 60);
     		   var lmin = sdt % 60-1;
     	   	   var lsec = 60-sec;
     	   	   
	     	   	$("#lhour").html(lhour);
	      	   $("#lmin").html(lmin);
	      	   $("#lsec").html(lsec);
	      	  $("#lhtml").html("시작 하기 ");
	      	   $("#timebarper").html("100%");
	      	   $("#timebar").css("width","100%");
	        	
	        }else if(srTime>=dTime){ 				//타임 쿠폰 시작후
	        	var remit = srTime-dTime;
	        	$("#timebtn").fadeIn();
	        	$("#lhtml").html("마감 까지 ");
	        	
	        	var rhour = Math.floor(remit / 60); 
	        	var rmin = remit % 60;
	        	var rsec = 60-sec;
	        	
	        	var varper =  remit/timeremit*100;
	        	varper = Math.floor(varper);
	        	varper = varper+"%";
	        	
	        	
	        	$("#lhtml").html("마감 까지 ");
	        	$("#lhour").html(rhour);
	      	   $("#lmin").html(rmin);
	      	   $("#lsec").html(rsec);
	      	 $("#timebarper").html(varper);
	      	   $("#timebar").css("width",varper);
	      	   
	        }
	    }
	}
	
	var rnum = Math.floor((Math.random() * 5) + 1);
	function ranclick(num) {
		if(memid == "guest"){
    		location.href = "javascript:void(window.open('login.do', '로그인','top=200px, left=500px, width=450, height=450,scrollbars=no,resizable=no' ))";
    	}else{
			if(rnum == num){
				alert("당첨되셨습니다.");
				acqCp("${random.seq}","${random.userremit}");
			}else{
				alert("아쉽지만 꽝");
				acqCp("${random.seq}","-1");
			}
    	}
		
	}
	
	function moclose() {
		
		var shareFlag = $("#checkShare").val();
		if(shareFlag == ""){
			alert("공유실패");
		}else if(memid == "guest"){
			location.href = "javascript:void(window.open('login.do', '로그인','top=200px, left=500px, width=450, height=450,scrollbars=no,resizable=no' ))";
		}else{
			alert("공유성공");
			acqCp("${share.seq}","${share.userremit}");
		}
	}
	$("#timebtn").click(function () {
		if(memid == "guest"){
    		location.href = "javascript:void(window.open('login.do', '로그인','top=200px, left=500px, width=450, height=450,scrollbars=no,resizable=no' ))";
    	}else{
			acqCp("${time.seq}","${time.userremit}");
    	}
	});
	
	function acqCp(seq,userremit) {
		var cpdata={
				cp_seq:seq,
				mid:memid,
				remit:userremit
			};
		
		$.ajax({
			url:"acqCp.do",
			type:"post",
			data:cpdata,
			success:function(msg){
					if(msg == "true"){
						alert("쿠폰 성공");
					}else{
						alert("이미 받으신 쿠폰입니다.");
					}					
			},
			error:function(reqest, status, error){
				alert("실패");
			}
		});
	}
	

 
    </script>
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
</body>
</html>
	