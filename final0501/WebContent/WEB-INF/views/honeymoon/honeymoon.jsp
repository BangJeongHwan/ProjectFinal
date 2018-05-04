<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
<link rel="stylesheet" type="text/css" href="assets/css/template.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<style type="text/css">

.honey_map {
	align-content: center;
    width: 100%;
    margin-top: 50px;
}
.honey_map .world {
    position: relative;
    width: 100%;
    height: 616px;
    background: url(assets/images/honeymoon/worldmap.png) no-repeat;
    margin-left: 10%;
}
.world img{
	width: 56px;
    height: 59px;
    cursor: pointer;
}
.world div{
width: 56px;
    height: 59px;
}
.world .uro {
    position: absolute;
    left: 150px;
    top: 180px;
}
.world .bali {
    position: absolute;
    left: 400px;
    top: 380px;
}
.world .baliz {
    position: absolute;
    left: 760px;
    top: 320px;
}
.world .croa {
    position: absolute;
    left: 120px;
    top: 220px;
}
.world .hawai {
    position: absolute;
    left: 590px;
    top: 303px;
}
.world .hoju {
    position: absolute;
    left: 430px;
    top: 420px;
}
.world .kancoon {
    position: absolute;
    left: 780px;
    top: 290px;
}
.world .moldiv {
    position: absolute;
    left: 270px;
    top: 370px;
}
.world .puket {
    position: absolute;
    left: 330px;
    top: 345px;
}
.world .stlucia {
    position: absolute;
    left: 830px;
    top: 310px;
}
.world .tahiti {
    position: absolute;
    left: 610px;
    top: 400px;
}
</style>

<%
String imagePath = "assets/images/honeymoon/mapicon-";
%>

<!-- Main -->
<div class="honey_map">

	<div class="world">
	
		<div class="stlucia" style="z-index: 0;">
			<a href="#">
				<img src="assets/images/honeymoon/mapicon-stlucia.png" id="stlucia">
			</a>	
		</div>
		
		<div class="uro" style="z-index: 0;">
		<a href="#">
			<img src="assets/images/honeymoon/mapicon-uro.png" id="uro">
			</a>
		</div>
		
		<div class="bali" style="z-index: 0;">
		<a href="#">
				<img src="assets/images/honeymoon/mapicon-bali.png" id="bali">
				</a>
		</div>
		<div class="baliz" style="z-index: 0;">
		<a href="#">
				<img src="assets/images/honeymoon/mapicon-baliz.png" id="baliz">
				</a>
		</div>
		<div class="croa" style="z-index: 0;">
			<a href="#">
				<img src="assets/images/honeymoon/mapicon-croa.png" id="croa">
			</a>
		</div>
		<div class="hawai" style="z-index: 0;">
			<a href="#">
				<img src="assets/images/honeymoon/mapicon-hawai.png" id="hawai">
			</a>
		</div>
		<div class="hoju" style="z-index: 0;">
			<a href="#">
				<img src="assets/images/honeymoon/mapicon-hoju.png" id="hoju">
			</a>
		</div>
		<div class="kancoon" style="z-index: 0;">
			<a href="#">
				<img src="assets/images/honeymoon/mapicon-kancoon.png" id="kancoon">
			</a>
		</div>
		<div class="moldiv" style="z-index: 0;">
			<a href="#">
				<img src="assets/images/honeymoon/mapicon-moldiv.png" id="moldiv">
			</a>
		</div>
		<div class="puket" style="z-index: 0;">
			<a href="#">
				<img src="assets/images/honeymoon/mapicon-puket.png" id="puket">
			</a>
		</div>
		<div class="tahiti" style="z-index: 0;">
			<a href="#">
				<img src="assets/images/honeymoon/mapicon-tahiti.png" id="tahiti">
			</a>
		</div>
		
	</div>
</div>

  

<script type="text/javascript">
var path = "<%=imagePath%>"; 
var imgName;
	$(".world img").mouseover(function () {		//지역이미지에 마우스 가져다 댔을경우
		imgName = $(this).attr('id');				// 이미지 파일이름 가져오고
		$(this).attr('src',path+imgName+"Over.png");				// 변경할 이미지
		$('.'+imgName).css('z-index','100');					// 최상위로 보이기
	});
	$(".world img").mouseout(function () {		//지역이미지에 마우스  나왔을경우
		$(this).attr('src',path+imgName+".png");	// 변경할 이미지
		$('.'+imgName).css('z-index','0');					// 최하위로 보이기
	}); 
	
	$(".world a").click(function () {
		var area = $(this).parent().attr("class").trim();
		
		 location.href="hmareaselect.do?selarea="+area;
	});

	
</script>

