<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1" />
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta name="description" content="">
   <meta name="author" content="ninodezign.com, ninodezign@gmail.com">
   <meta name="copyright" content="ninodezign.com"> 
   <meta name="viewport" content="width=device-width, initial-scale=1" />
   
   <title>마이페이지</title>
   
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<!-- datepicker -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
   
   <!-- favicon -->
    <link rel="shortcut icon" href="images/ico/favicon.jpg">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
   
   <!-- css -->
   
   <link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.min.css" />
   <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
   <link rel="stylesheet" type="text/css" href="css/materialdesignicons.min.css" />
   <link rel="stylesheet" type="text/css" href="css/prettyPhoto.css" />
   <link rel="stylesheet" type="text/css" href="css/unslider.css" />
   <link rel="stylesheet" type="text/css" href="css/template.css" />
   <link rel="stylesheet" type="text/css" href="assets/css/template.css" />
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <link rel="stylesheet" href="assets/css/main.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>   -->
   <!-- 만든 css -->
   
   </head>
<body style="bgcolor: white" data-target="#nino-navbar" data-spy="scroll" >

<!-- header -->
<!-- header 완료 -->
<header id="nino-header">
   <div id="nino-headerInner" >         
      <tiles:insertAttribute name="header"/>
   </div>
</header>
<br><br><br>
<br><br>

<!-- leftmain -->
<!--  -->
<div style="width: 1700px">
   <div class="w3-bar-block w3-light-white w3-card" style="width:10%; height: 300px; padding-left: 10px; float: left;">
      <tiles:insertAttribute name="left_main"/>
   </div>
   
   <div style="width:5%;float:left;">&nbsp;</div>
   
   <!-- main -->
   <!-- main 완료 -->
   <!-- <div id="wrapper" style="padding-left: 5px; width: 70%; float: left;"> -->
   <div style="width:1400px; float:left;">
      <tiles:insertAttribute name="main"/>
   </div>
   
   <div style="width:5%;float:left;">&nbsp;</div>
</div>


<!-- footer -->
<!-- footer 완료 -->
<br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>

<footer id="footer">
   <div class="container">
      <tiles:insertAttribute name="footer"/>
   </div>
</footer>


<!-- javascript -->

<!-- <script src="assets/js/jquery.min.js"></script> -->
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="assets/js/main.js"></script>
<!-- <script type="text/javascript" src="js/jquery.min.js"></script>    -->
<script type="text/javascript" src="js/isotope.pkgd.min.js"></script>
<script type="text/javascript" src="js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.hoverdir.js"></script>
<script type="text/javascript" src="js/modernizr.custom.97074.js"></script>
<script type="text/javascript" src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="js/unslider-min.js"></script>
<script type="text/javascript" src="js/template.js"></script>


<script>
function w3_open() {
  document.getElementById("main").style.marginLeft = "25%";
  document.getElementById("mySidebar").style.width = "25%";
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("openNav").style.display = 'none';
}
function w3_close() {
  document.getElementById("main").style.marginLeft = "0%";
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("openNav").style.display = "inline-block";
}
</script>

<!-- 기타 -->
<!-- Search Form - Display when click magnify icon in menu
 ================================================== -->
 <form action="" id="nino-searchForm">
    <input type="text" placeholder="Search..." class="form-control nino-searchInput">
    <i class="mdi mdi-close nino-close"></i>
 </form><!--/#nino-searchForm-->

 <!-- Scroll to top
 ================================================== -->
<a href="#" id="nino-scrollToTop">Go to Top</a>


</body>
</html>