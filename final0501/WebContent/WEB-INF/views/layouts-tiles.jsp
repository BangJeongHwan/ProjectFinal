<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 
	<title>웨딩</title>
	
	
	<!-- favicon -->
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/assets/images/ico/favicon.jpg">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=request.getContextPath() %>/assets/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=request.getContextPath() %>/assets/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=request.getContextPath() %>/assets/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="<%=request.getContextPath() %>/assets/images/ico/apple-touch-icon-57-precomposed.png">
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/materialdesignicons.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/prettyPhoto.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/unslider.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/template.css" />
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
	<!-- 만든 css -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/pictures.css" />
</head>
<body data-target="#nino-navbar" data-spy="scroll">

<!-- header -->
<header id="nino-header">
	<div id="nino-headerInner">					
		<nav id="nino-navbar" class="navbar navbar-default" role="navigation">
			<div class="container">
			
				<tiles:insertAttribute name="header"/>
			
			</div><!-- /.container-fluid -->
		</nav>
	</div>
</header>

<!-- main -->
<section id="nino-whatWeDo" style="padding-top: 0px">
	<tiles:insertAttribute name="main"/>
</section>

<!-- footer -->
<footer id="footer" style="z-index: 999; position: relative;">
	<div class="container">
		<tiles:insertAttribute name="footer"/>
	</div>
</footer>

<!-- javascript -->
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery.min.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/isotope.pkgd.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery.hoverdir.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/modernizr.custom.97074.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/unslider-min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/template.js"></script>
<!-- <script src=js/jquery.scrolly.min.js"></script> -->
<script src="<%=request.getContextPath() %>/assets/js/jquery.scrollex.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/skel.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/util.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/main.js"></script>      
</body>
</html>
