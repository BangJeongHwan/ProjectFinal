<%@page import="kh.com.a.util.myCal"%>
<%@page import="kh.com.a.model.ReservationDto"%>
<%@page import="kh.com.a.model.WHallPictureDto"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Array"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- fullcalender -->
<!-- 
<link rel='stylesheet' href='FullCalendar/fullcalendar.css' />
<link rel='stylesheet' media="print" href='FullCalendar/fullcalendar.print.min.css' />
<script src='FullCalendar/lib/jquery.min.js'></script>
<script src='FullCalendar/lib/moment.min.js'></script>
<script src='FullCalendar/lib/jquery-ui.min.js'></script>
<script src='FullCalendar/fullcalendar.min.js'></script>
<script src='FullCalendar/locale-all.js'></script>	한국어 변환

 -->
<!-- modal -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<style type="text/css">

/* selectBox */
.selectBox table{
	width: 100%;
}
.selectBox th{
	 border: 1px solid black;
	 border-top : 3px solid black;
	 padding: 10px 0px;
	 text-align: center;
	 background-color: #EAEAEA;
}

.modal-backdrop {
    z-index: -1;
}
.modalContent {
    font-size: 18px;
    color: black;
}

/* main내용 */
.mainhallTable{
	width: 100%;
}

.mainhallTable td{
	padding: 10px 0px;
}
.star th{
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	padding: 10px 0px;
}

/* 테이블 및 홀이름 갯수 css */
.explainTable table{
	width: 100%;	
}
.explainTable thead th{
	text-align:center;
	padding: 6px 0px;
	border: 1px solid #D5D5D5;
}
.explainTable tbody th{
	padding: 10px 0px;
	border-bottom: 1px solid #D5D5D5;
	border-top: 1px solid #D5D5D5;
}
.explainTable tbody td{
	padding: 15px 0px;
	border: 1px solid #D5D5D5;
	text-align:center;
}

ul li{
	display:inline;                         /*  세로나열을 가로나열로 변경 */
    border-left:1px solid #999;             /* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */
    font:bold 15px;                     /* 폰트 설정 - 12px의 돋움체 굵은 글씨( Dotum)로 표시 */
    padding:0 10px; 
}

li.line:hover{
   text-decoration: underline; /* 언더라인(아래줄) 스타일 부여 */
   cursor: pointer;			/* 손 모양 */
}

 /* 이미지 css */
.imgScroll td{
	width: 10%; 
	height: 5%;
	align-content: center;
	text-align: center;
}

.clickimg{
	border:4px solid #ef8bc5;
}

/* 후기 */
table.type11 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    margin: 20px 10px;
}
table.type11 th {
    width: 100px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    text-align: center;
    color: #fff; 
    background: #4D6BB3; /* 핑크 #ce4869  */
}
table.type11 td {
    width: 155px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
}

/* 그냥 캘린더 css */

.calTable tbody td, .calTable tbody th{
	border: 1px solid black;
}

.sunday{
color: red; 
text-align: left;
vertical-align: top;
/* background-color: #ccccff; */
}
.satday{
color: blue; 
text-align: left;
vertical-align: top;
/* background-color: #ccccff; */
}
.otherday{
color: black; 
text-align: left;
vertical-align: top;
}
.days2{
font-size:20px;
color: #4D6BB3; 
text-align: center;
vertical-align: middle;
}
.days3{
font-size:20px;
color: #4D6BB3; 
text-align: center;
vertical-align: middle;
background-color:#4D6BB3; color:#FFFFFF; line-height:1.7em; font-weight:normal;
}

.innerTable {
    border: 0px ;
}
.innerTable td, tr{
	border: 0px ;
}

.modalTable {
	text-align: center;
}

/* 화면 흐리게 css */
#mask{
  position:absolute;  
  left:0;
  top:0;
  z-index:9000;  
  background-color:#000;  
  display:none;  
}
</style>

<!-- 홀 메인 -->
 
<div class="container" style="padding-top: 10px;">
	<h2 class="nino-sectionHeading">
		${wd.cname }
	</h2>
	
	<!-- 관리자일 경우 -->
	<c:if test="${login.id=='admin'}">
		<div align="right">
			<button onclick="delwedding()" style="background-color: white;">업체 삭제</button>
			<button onclick="addhall()" style="background-color: white;">홀 추가</button>
			<button onclick="modhall()" style="background-color: white;">홀 수정</button>
		</div>
	</c:if>
	<br>
	
	
	<div class="sectionContent" style="border-top: 6px solid black; padding-left: 30px;">
		<div class="row" style="padding-top: 30px">				
			<div class="col-md-6">
				<table class="mainhallTable">
					<colgroup>
						<col width="30%"><col width="70%">
					</colgroup>
					
					<thead class="star">
						<tr>
							<th colspan="2">별점</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>주소</th>
							<td>${wd.address }</td>
						</tr>
						<tr>
							<th>홀타입</th>
							<td>${wd.htype }</td>
						</tr>
						<tr>
							<th>식사비용</th>
							<td>${wd.mincook }~${wd.maxcook }</td>
						</tr>
						<tr>
							<th>메뉴종류</th>
							<td>${wd.menutype }</td>
						</tr>
						<tr>
							<th>보증인원</th>
							<td>최소 보증인원 ${wd.minpeople }명 / 최대 보증인원 ${wd.maxpeople }명</td>
						</tr>
					</tbody>
				</table>		
					<div class="text-center">
					</div>
			</div>
			<div class="col-md-6">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="padding-left: 50px">
					<img src="upload/${ wd.picture }"  width="450px" height="250px"><br><br>
					<div align="center">
						<button style="width: 100px;height: 40px; background-color: white;" onclick="location.href='#hallpic'"><b>사진 더보기</b></button>&nbsp;&nbsp;
						<button style="width: 100px;height: 40px; background-color: white;" onclick="location.href='#halllocation'"><b>홀 위치</b></button>&nbsp;&nbsp;
						<button style="width: 100px;height: 40px;  background-color: red;" onclick="location.href='#hallregi'"><font color="white"><b>예약하기</b></font></button>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>



<!-- 홀 설명 -->
<div class="container" id="hallstory">
	<br><br>
	<div class="selectBox">
	<table>
		<tr>
			<th style="border-bottom: 0px; border-left:0px; background-color: white;"><a href="#hallstory"><font color="#ff0000">홀 설명</font></a></th>
			<th><a href="#hallpic">홀 사진</a></th>
			<th><a href="#halllocation">홀 위치</a></th>
			<th><a href="#hallreview">홀 리뷰</a></th>
			<th style="border-right: 0px"><a href="#hallregi">홀 예약</a></th>
		</tr>
	</table>
	</div>
	
	<div>	
		<br><br>
		<p style="color: red">※ 아래 정보는 웨딩홀에서 제공한 정보를 기준으로 하며, 웨딩홀의 사정에 따라 메뉴, 가격 등이 변경될 수 있습니다. </p>
		<b>주소 : ${wd.address }</b><br>
		<b>교통 : ${wd.transpo }</b>
		<br><br>
		
		<div class="explainTable">
		<table>
			<colgroup>
				<col width="15%"> <!-- 형태/시설구분 -->	
				<col width="20%"> <!-- 인원 -->
				<col width="10%"> <!-- 간격 -->
				<col width="10%"> <!-- 사용료 -->
				<col width="15%"> <!-- 메뉴 -->
				<col width="15%"> <!-- 식대 -->
				<col width="15%"> <!-- 음주류 -->
			</colgroup>
			<thead>
				<tr>
					<th style="border-left-color: white;">형태/시설구분</th><th>인원</th><th>간격</th><th>사용료</th><th>메뉴</th><th>식대</th><th style="border-right-color: white;">음주류</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="hall" items="${hallList }">
					<tr>
						<th colspan="7" style="background-color: #F5F5F5;">&nbsp;&nbsp;${hall.hallname }  / ${hall.floor }층</th>
					</tr>
					<tr>
						<td style="border-left-color: white;">${hall.format }<br>/<br>${hall.facility }</td>
						<td><b>최소</b> : ${hall.minpeople }명<br><b>착석</b> : ${hall.setpeople }명<br><b>최대</b> : ${hall.maxpeople}명</td>
						<td>${hall.wstep }</td>
						<td>${hall.pay }만원</td>
						<td>${hall.menutype }</td>
						<td>${hall.mincook }원<br>~${hall.maxcook }원</td>
						<td style="border-right-color: white;"><b>${hall.drink }</b></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
</div>
	
<!-- 홀 사진 -->
<div class="container" id="hallpic">
	<br><br>
	<div class="selectBox">
	<table>
		<tr>
			<th style="border-left:0px;"><a href="#hallstory">홀 설명</a></th>
			<th style="border-bottom: 0px; border-left:0px; background-color: white;"><a href="#hallpic"><font color="#ff0000">홀 사진</font></a></th>
			<th><a href="#halllocation">홀 위치</a></th>
			<th><a href="#hallreview">홀 리뷰</a></th>
			<th style="border-right: 0px"><a href="#hallregi">홀 예약</a></th>
		</tr>
	</table>	
	</div>
	
	<br><br>
	<div align="center" style="border:1px solid #D5D5D5; width: 100%; background-color: #F5F5F5; padding: 40px 0px;">	
		<ul>
			<li class="line" onclick="hnameChange('all')" id="_hsum0">전체<font color="#ff0000">(${piclist.size() })</font></li>
			<c:if test="${not empty hallSumList && hallSumList.size() ne 0}">
				<c:forEach var="hsum" items="${hallSumList }" varStatus="i" begin="0">
					<li class="line" onclick="hnameChange('${hsum.hallname }')" id="_hsum${i.index+1 }">${hsum.hallname }<font color="#ff0000">(${hsum.sumpic })</font></li>
				</c:forEach>
			</c:if>
		</ul>
		
		<br><br>
		
		<!-- 여러 이미지 추가 -->
		
		<div>
			<table>
				<tr id="_PicSel" class="imgScroll"></tr>
			</table>
			
			<br><br>
			
			<!-- 메인 이미지 -->
			<c:if test="${ empty piclist || piclist.size() eq 0}">
				<img src="upload/${ wd.picture }" id="bigimg" style="width: 70%; height: 50%">
			</c:if>
			<c:if test="${ not empty piclist && piclist.size() ne 0}">
				<img src="upload/${ pic1 }" id="bigimg" style="width: 70%; height: 50%"/>
			</c:if>
			
		</div>
		
		
	</div>	
</div>	


<!-- 홀 위치 -->
<div class="container" id="halllocation">
	<br><br>
	<div class="selectBox">
	<table>
		<tr>
			<th style="border-left:0px;"><a href="#hallstory">홀 설명</a></th>
			<th><a href="#hallpic">홀 사진</a></th>
			<th style="border-bottom: 0px; border-left:0px; background-color: white;"><a href="#halllocation"><font color="#ff0000">홀 위치</font></a></th>
			<th><a href="#hallreview">홀 리뷰</a></th>
			<th style="border-right: 0px"><a href="#hallregi">홀 예약</a></th>
		</tr>		
	</table>
	</div>
	
	<br><br>
	<div align="center" style="border:1px solid #D5D5D5; width: 100%; background-color: #F5F5F5; padding: 40px 0px;">
		<div onload="initMap()" align="center">
			<div id="map1" style="width:90%; height: 500px; border: 1px solid black;"></div>
		</div>
		<br>
		
		<div style="margin-left: 60px" align="left">
			<b>주소 : ${wd.address }</b><br>
			<b>교통 : ${wd.transpo }</b>
			<br><br>
			<p style="color: red">※ 본 지도는 참고 정보로만 활용하시기 바라며 정확한 위치는 홈페이지를 통해 확인하시기 바랍니다.</p>
		</div>
	</div>
</div>	


<!-- 홀 리뷰 -->
<div class="container" id="hallreview">
	<br><br>
	<div class="selectBox">
	<table>
		<tr>
			<th style="border-left:0px;"><a href="#hallstory">홀 설명</a></th>
			<th><a href="#hallpic">홀 사진</a></th>
			<th><a href="#halllocation">홀 위치</a></th>
			<th style="border-bottom: 0px; background-color: white;"><a href="#hallreview"><font color="#ff0000">홀 리뷰</font></a></th>
			<th style="border-right: 0px"><a href="#hallregi">홀 예약</a></th>
		</tr>
	</table>
	</div>
	
	<div style="font-family: 'Hanna', serif;">
			<br><br><br>
			<div align="center">
				<table class="type11" style="width:85%; font-family: 'Hanna', serif;">
					<col width="110"><col width="300"><col width="100">	
					<tr style="border-bottom: solid; border-bottom-color: lightgray">
						<th align="center">작성일</th><th>댓글</th><th>작성자</th>
					</tr>
				
					<c:if test="${empty dlist}">
						<tr style="border-bottom: solid; border-bottom-color: lightgray">
							<td colspan="3" style="text-align: center">작성된 댓글이 없습니다</td>
						</tr>
					</c:if>
				
					<c:forEach var="list" items="${dlist}" varStatus="i">
						<tr style="border-bottom: solid; border-bottom-color: lightgray">
							<td>${list.rdate.substring(0,10) }</td>
							<td>${list.content }</td>
							<td>${list.mid }</td>
						</tr>
					</c:forEach>
				</table>
				<br>
				<form action="whreview.do" onsubmit="return checkReviewSubmit('${login.id}')" id="_formcomment">
					<input type="hidden" name="rpdseq" value="${wd.whseq}">
					<input type="hidden" name="pname" value="${wd.cname}">
					<input type="hidden" name="mid" value="${login.id }">
					<input type="hidden" name="title" value="${wd.cname}">
					
					<table class="type11" style="width:85%; font-family: 'Hanna', serif;" >
					<tr style="border: 0; border-bottom-color: lightgray">
						<td colspan="2">
							<input type="text" name="content" size="80">
						</td>
						<td>
							<input class="w3-btn w3-white w3-border w3-border-red w3-round-large" id="_addcomment" value="댓글">
						</td>
					</tr>
					
					</table>
				</form>
			</div>
		</div>
</div>	


<!-- 홀 예약 -->

<!-- 달력 -->
<div class="container" id="hallregi">
	<br><br>
	<div class="selectBox">
	<table>
      <tr>
         <th  style="border-left:0px;"><a href="#hallstory">홀 설명</a></th>
         <th><a href="#hallpic">홀 사진</a></th>
         <th><a href="#halllocation">홀 위치</a></th>
         <th><a href="#hallreview">홀 리뷰</a></th>
         <th style="border-bottom: 0px; border-right: 0px; background-color: white;"><a href="#hallregi"><font color="#ff0000">홀 예약</font></a></th>
      </tr>
      </table>
	</div>
   
   <!-- 달력 -->
   <br><br>
	<div align="center" style="width: 100%;">
      <%-- 
      <div style="text-align: left"><a href='<%=url%>'><%=year+"년 "+month+"월 " %>일정보기</a></div>
       --%>
      <div class="box_border" style="margin-top:5px; margin-bottom: 10px;">
      
      <table style="width:85%;" class="calTable">
      <col width="100px"/>
      <col width="100px"/>
      <col width="100px"/>
      <col width="100px"/>
      <col width="100px"/>
      <col width="100px"/>
      <col width="100px"/>
      
      
      <thead  id="_calender1">
      </thead>
      
      <tbody id="_calender">
      </tbody>
      </table>
      </div>
   </div>    
   <!-- 
   <div align="center">
      <div id='calendar' style="width:90%; height: 895px; margin-top:20px;" ></div>
   </div>
    -->
</div>

<!-- 뒤에 검하게하기 -->
<div id="mask"></div>
<!--  -->

<!-- Modal -->
<div class="modal fade" id="_regiModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="width:300px">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <div align="center">
      	  <h4 class="modal-title" id="myModalLabel">예약내역확인</h4>
        </div>
      </div>
      <div class="modal-body">
      	<!-- <input type="text" id="_index" value="0"> -->
      	<div id="_modalContent" class="modalContent"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>

<!-- modal -->
<script>
var dayOfWeek = ${jcal.dayOfWeek};
var lastDayOfMonth = ${jcal.lastDay};
var year = ${jcal.year};
var month = ${jcal.month};
var list;

function SET_MODAL_CENTER(){
	function reposition() {
		var modal = $(this),
		dialog = modal.find('.modal-dialog');
		modal.css('display', 'block');
		dialog.css("margin-top", Math.max(0, ($(window).height() - dialog.height())/2));
    }
	 
	$('.modal').on('show.bs.modal', reposition);
	$(window).on('resize', function() {
		$('.modal:visible').each(reposition);
	});
}
SET_MODAL_CENTER();

function funct(syear, smonth, sday) {
	
	if((""+smonth).length<2){
		smonth = "0"+smonth; 
	}
	if(sday<10){
		sday = "0"+sday; 
	}
	
	var dates = year+"-"+smonth+"-"+sday;// yy/mm/dd
	
	var str = "";
	
	str += "<table class='modalTable'>";
	str += "<col width='100px'><col width='140px'><col width='100px'>";
	str += "<tr><th>홀이름</th><th>예약시간</th><th>예약자</th></tr>"
	for(var k=0;k<list.length;k++){ //향상된 for
		if(list[k].redate.substring(0,10)==dates){
			var name = list[k].mname.substring(0,1)+"*"+list[k].mname.substring(2,3);
						
			str += "<tr>";
			str += "<td>"+list[k].content+"</td>";
			str += "<td>"+list[k].retime+"</td>";
			str += "<td>"+name+"</td>";
			str +="</tr>";
		}
	}
	str +="</table>";
	
	$("#_modalContent").html(str);
	$("#myModalLabel").text(dates);
	$("#_regiModal").modal("show");
	$("#_regiModal").css("z-index", "1500");
}
</script>

<!-- 댓글 -->
<script>
$("#_addcomment").click(function () {
	$("#_formcomment").submit();
});

function checkReviewSubmit(id) {
	if (id == "guest") {
		alert("로그인 후 이용해주세요.");
		return false;
	}
	return true;
}
</script>

<!-- 달력 처리 -->
<script>
makeCalender(month);
function makeCalender(mon){
	var data = {
		year:year,
		month:mon,
		pdseq:${wd.whseq}
	}
	$.ajax({
		url:"calenderDate.do",
		data:data,
		success:function(msg){
			// 초기화
			dayOfWeek = msg.jcal.dayOfWeek;
			lastDayOfMonth = msg.jcal.lastDay;
			year = msg.jcal.year;
			month = msg.jcal.month;
			list = msg.flist;
			
			// 헤더 부분
			$("#_calender1").empty()
			var tagStr1 = "";
			tagStr1 += "<tr height='50px'>";
			tagStr1 += 	"<td class='days2' colspan='7'>";
			tagStr1 += 	"<input type='text' value='<이전달' style='border: 0px;cursor:pointer' size='4' readonly onclick='makeCalender("+(month-1)+")'>&nbsp;";
			tagStr1 += 	"<font color='black' style='font-size: 24'><input type='text' value='"+year+"' size='2' readonly>&nbsp;&nbsp;";
			tagStr1 += 		"<input type='text' value='"+month+"월' size='1' readonly>";
			tagStr1 += 	"</font>&nbsp;<input type='text' value='다음달>' style='border: 0px;cursor:pointer' size='4' readonly onclick='makeCalender("+(month+1)+")'></td>";
			tagStr1 += "</tr>";
			
			tagStr1 += "<tr height='40px'>";
			tagStr1 += 	"<th class='days3'>일</th><th class='days3'>월</th>";
			tagStr1 += 	"<th class='days3'>화</th><th class='days3'>수</th><th class='days3'>목</th>";
			tagStr1 += 	"<th class='days3'>금</th><th class='days3'>토</th>";
			tagStr1 += "</tr>";
			
			// 날짜 부분
			$("#_calender").empty()
			var tagStr = "";
			
			tagStr += "<tr height='100px'>";
			
			for(var i=1;i<dayOfWeek;i++){
				tagStr += "<td>&nbsp;</td>";
			}
			for(var i=1;i<=lastDayOfMonth;i++){
				
				var day = i;
				
				if((""+month).length<2){
					month = "0"+month; 
				}
				if((""+day)<2){
					day = "0"+day; 
				}
				
				var dates = year+"-"+month+"-"+day;// yy/mm/dd
				
				if((i+dayOfWeek-1)%7==0){		// 토요일
					
					var count=0;
					tagStr += "<td class='satday' onmouseover='mouse("+i+")' id='_day"+i+"'>";

					// 날짜
					tagStr += "<div id='_daytext"+i+"'>"+i+"&nbsp</div>";	
					
					// 예약 목록
					tagStr += "<div id='_intable"+i+"'>"
					tagStr += "<table class='innerTable'>";
					tagStr += "<col width='120px'/>";
					for(var j=0;j<list.length;j++){ //향상된 for
						if(list[j].redate.substring(0,10)==dates){
							//alert(dates);
							
							var name = list[j].mname.substring(0,1)+"*"+list[j].mname.substring(2,3);
						
							var contents = "["+list[j].content+"홀] ";
							contents += list[j].retime.substring(0,5)+" ";
							contents += name;
							
							if(contents.length>15){
								contents = contents.substring(0,15) + ".."
							}
							if(count<3){
								tagStr += "<tr bgcolor='#B2EBF4'>";
								tagStr += "<td>";         
								tagStr +="<font style='font-size:8px;color:#090000'>"; //글씨작게해서15자 들어가게끔	 
								tagStr += contents;
								tagStr +="</font>";
								tagStr +="</td>";
								tagStr +="</tr>";
							}
							count++;
						}
					}
					tagStr +="</table></div>";
					
					// 예약 표시
					tagStr += "<div style='z-index: 5; display: none;' id='_resv"+i+"' align='center'>";
					tagStr +=		"<br><a href='#' onclick='request("+i+")'>";
					tagStr +=			"<img alt='예약하기' src='assets/images/others/resv.jpg'>";
					tagStr +=		"</a>";
					tagStr += "</div>";
					
					// 나머지
					var remain=0;
					if(count>3){
						remain = count-3;
					}
					
					// 더보기
					if(remain!=0){
						tagStr += "<div align='right'>";
						tagStr += "<font style='font-size:8px;color:#980000;cursor:pointer;' onclick='funct("+year+","+month+","+day+")'>+더보기("+remain+")</font>";
						tagStr += "</div>";
					}
					tagStr += "</td>";
					
				}else if((i+dayOfWeek-1)%7==1){	// 일요일
					
					var count=0;
					tagStr += "<td class='sunday' onmouseover='mouse("+i+")' id='_day"+i+"'>";
					
					// 날짜
					tagStr += "<div id='_daytext"+i+"'>"+i+"&nbsp</div>";	
					
					// 예약 목록
					tagStr += "<div id='_intable"+i+"'>"
					tagStr += "<table class='innerTable'>";
					tagStr += "<col width='120px'/>";
					for(var j=0;j<list.length;j++){ //향상된 for
						if(list[j].redate.substring(0,10)==dates){
							//alert(dates);
							
							var name = list[j].mname.substring(0,1)+"*"+list[j].mname.substring(2,3);
						
							var contents = "["+list[j].content+"홀] ";
							contents += list[j].retime.substring(0,5)+" ";
							contents += name;
							
							if(contents.length>15){
								contents = contents.substring(0,15) + ".."
							}
							if(count<3){
								tagStr += "<tr bgcolor='#B2EBF4'>";
								tagStr += "<td>";         
								tagStr +="<font style='font-size:8px;color:#090000'>"; //글씨작게해서15자 들어가게끔	 
								tagStr += contents;
								tagStr +="</font>";
								tagStr +="</td>";
								tagStr +="</tr>";
							}
							count++;
						}
					}
					tagStr +="</table></div>";
					
					// 예약 표시
					tagStr += "<div style='z-index: 5; display: none;' id='_resv"+i+"' align='center'>";
					tagStr +=		"<br><a href='#' onclick='request("+i+")'>";
					tagStr +=			"<img alt='예약하기' src='assets/images/others/resv.jpg'>";
					tagStr +=		"</a>";
					tagStr += "</div>";
					
					// 나머지
					var remain=0;
					if(count>3){
						remain = count-3;
					}
					
					// 더보기
					if(remain!=0){
						tagStr += "<div align='right'>";
						tagStr += "<font style='font-size:8px;color:#980000;cursor:pointer;' onclick='funct("+year+","+month+","+day+")'>+더보기("+remain+")</font>";
						tagStr += "</div>";
					}
					tagStr += "</td>";
				}else{							// 평일
					
					var count=0;
					tagStr += "<td class='otherday' onmouseover='mouse("+i+")' id='_day"+i+"'>";
					
					// 날짜
					tagStr += "<div id='_daytext"+i+"'>"+i+"&nbsp</div>";	
					
					// 예약 목록
					tagStr += "<div id='_intable"+i+"'>"
					tagStr += "<table class='innerTable'>";
					tagStr += "<col width='120px'/>";
					for(var j=0;j<list.length;j++){ //향상된 for
						if(list[j].redate.substring(0,10)==dates){
							//alert(dates);
							
							var name = list[j].mname.substring(0,1)+"*"+list[j].mname.substring(2,3);
						
							var contents = "["+list[j].content+"홀] ";
							contents += list[j].retime.substring(0,5)+" ";
							contents += name;
							
							if(contents.length>15){
								contents = contents.substring(0,15) + ".."
							}
							if(count<3){
								tagStr += "<tr bgcolor='#B2EBF4'>";
								tagStr += "<td>";         
								tagStr +="<font style='font-size:8px;color:#090000'>"; //글씨작게해서15자 들어가게끔	 
								tagStr += contents;
								tagStr +="</font>";
								tagStr +="</td>";
								tagStr +="</tr>";
							}
							count++;
						}
					}
					tagStr +="</table></div>";
					
					// 예약 표시
					tagStr += "<div style='z-index: 5; display: none;' id='_resv"+i+"' align='center'>";
					tagStr +=		"<br><a href='#' onclick='request("+i+")'>";
					tagStr +=			"<img alt='예약하기' src='assets/images/others/resv.jpg'>";
					tagStr +=		"</a>";
					tagStr += "</div>";
					
					// 나머지
					var remain=0;
					if(count>3){
						remain = count-3;
					}
					
					// 더보기
					if(remain!=0){
						tagStr += "<div align='right'>";
						tagStr += "<font style='font-size:8px;color:#980000;cursor:pointer;' onclick='funct("+year+","+month+","+day+")'>+더보기("+remain+")</font>";
						tagStr += "</div>";
					}
					tagStr += "</td>";
				}
				if((i+dayOfWeek-1)%7==0 && i != lastDayOfMonth){
					tagStr += "</tr><tr height='100px'>";
				}
				//inTable(year, month, i);
			}
			for(var i=0;i<(7-(dayOfWeek+lastDayOfMonth-1)%7)%7;i++){
				tagStr += "<td>&nbsp;</td>";
			}
			tagStr += "</tr>";
			
			$("#_calender1").append(tagStr1);
			$("#_calender").append(tagStr);
		},
		error:function(reqest, status, error){
            alert("실패");
        }
	});
}
</script>


<script>
var winopen="";

// 달력에 마우스 over시
function mouse(num){
	var tagStr = "";
	for(var i=1;i<=lastDayOfMonth;i++){
		if(i==num){
			$("#_day"+i).css("background-color","#FFFAF0");
			$("#_daytext"+i).css("color","#D5D5D5");
			$("#_intable"+i).css("display","none");
			$("#_resv"+i).css("display","");
			
		}else{
			$("#_day"+i).css("background-color","");
			$("#_daytext"+i).css("color","");
			$("#_intable"+i).css("display","");
			$("#_resv"+i).css("display","none");
		}
	}
}

// 부모의 window 이름
window.name = 'parentview';

// 달력을 클릭시
function request(day){
	if((""+month).length<2){
		month = "0" + month;
	}
	if((""+day).length<2){
		day = "0" + day;
	}
	//alert(year+" "+month+" "+day);
	
	var url = 'resv.do?year='+year+'&month='+month+'&day='+day+'&whseq='+${wd.whseq};
	
	var width=550, height=910;
	var left = (screen.availWidth - width)/2;
	var top = (screen.availHeight - height)/2;
	var specs = "width=" + width;
	specs += ",height=" + height;
	specs += ",left=" + left;
	specs += ",top=" + top;
	specs += ",scrollbars=no";
	
	//var specs = "channelmode=yes,left=500,top=250,width=600,height=500";
	// 화면의 높이와 너비를 구한다.
	var maskHeight = $(document).height();
	var maskWidth = $(window).width();
	
	// 마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	$('#mask').css({'width':maskWidth, 'height':maskHeight});
	
	// 애니메이션 효과
	//$('#mask').fadeIn(1000); 1초 동안 검정화면
	$('#mask').fadeTo('slow',0.8);	// 80% 어둡기로 고정
	
	winopen = window.open(url,'팝업',specs);
}

$('#mask').click(function () {
	$(this).hide();
	winopen.close();
});

</script>

 
<!-- 홀별 사진 변경 -->
<script type="text/javascript">
var hallname = 'all';
var picMaxSize = 0;
var picIndex = 0;
var selIndex = 0;
var initIndex =0;
var picArray = new Array();

imgScroll();

function hnameChange(name) {
	selIndex = 0;
    picIndex = 0;
	hallname = name;
	imgScroll();
}


function imgScroll(){
	var data = {
		"hallname":hallname,
		"whseq":${wd.whseq}
	}
	
	$.ajax({
		url:"hallPicList.do",
        data:data,      // parameter 타입으로 이동
        success:function(res){
        	picMaxSize = res.picArr.length;
        	
        	picArray = new Array(picMaxSize);
        	for(var i=0;i<picMaxSize;i++){
        		picArray[i] = res.picArr[i];
        	}
        	
        	if(picMaxSize!=0){
	        var tagStr = "<td style='width:50px;height:59px;cursor:pointer' onclick='scrMoveLeft()'>◀</td>";
	        for(var i = picIndex; i <= (picIndex+4); i++) {
        		if (i == selIndex) {
	        			selIndex = i;
	        			tagStr += "<td class='clickimg' id='_simg"+i+"'>";
	        		} else {
	        			tagStr += "<td id='_simg"+i+"'>";
	        		}
	        		if (i >= 0 && i < picMaxSize) {
	        			var onclickStr = "imgChange(" + i +")";
	        			tagStr += "<img src='upload/"+ picArray[i] +"' onclick='"+ onclickStr +"' style='width:100px;height:70px;cursor:pointer'>";
	        		}
	        		tagStr += "</td>";
	        	}
	        	tagStr += "<td style='width:50px;height:59px;cursor:pointer' onclick='scrMoveRight()'>▶</td>";
	        	
	        	$("#_PicSel").empty();
	        	$("#_PicSel").append(tagStr);
        	}
        },
        error:function(reqest, status, error){
            alert("실패");
        }
	});
}

function scrMoveLeft() {
	initIndex = selIndex; 
	initIndex--;
	if (initIndex < 0) initIndex = 0;
	if((initIndex+1)%5==0){
		picIndex = initIndex-4;
	}
	imgChange(initIndex);
}
function scrMoveRight() {
	initIndex = selIndex; 
	initIndex++;
	if (initIndex == picMaxSize){
		initIndex = (picMaxSize - 1);
	}
	if(initIndex%5==0){
		picIndex = initIndex;
	}
	imgChange(initIndex);
}
function imgChange(index) {
	var src = "upload/" + picArray[index];
	$("#bigimg").attr("src", src);
	var selectedId = "#_simg" + selIndex;
	var newId = "#_simg" + index;
	$(selectedId).removeAttr("class");
	$(newId).attr("class", "clickimg");
	selIndex = index;
	imgScroll();
}
</script>

<!-- fullcalendar에 대한 스크립트 -->
<!-- 
<script type="text/javascript">
$(function() {
	// 한국어 변환
	var initialLocaleCode = 'ko';
	
	// 현재 날짜 설정
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth()+1;
	var y = date.getFullYear();
	var rdate = y+"-0"+m+"-"+d;	
	//alert(rdate);
	
	// fullcalender 시작
	$('#calendar').fullCalendar({
		
		// 한국어 변환
	 	locale: initialLocaleCode,
	 	   
		// header 설정
  		header: {
  	        left: 'prev,next today',	// 달 이동
  	        center: 'title',			// 제목
  	        right: 'month,agendaWeek,agendaDay,listMonth'	// 월별, 주별, 일별, list
  	    },
  		// 현재 보여줄 화면
  	    defaultDate: rdate,	
  	    // show the prev/next text <, >
 	    buttonIcons: false,
 	    // 1년간의 주를 나타내 (주)는 부분
 	   	weekNumbers: true,
  	    // 날짜 클릭 가능(true), 불가(false)
  	    navLinks: true,   	    
  	    // 일정 옮기기 가능
  	    editable: true,  	    
  		// 4개 이상 "more" 창 나타내기(true), 나타내지 않기(false)
  	    eventLimit: true, 
  	    
 		// 일정 넣는 부분
  	    events: [				
  	      {
  	        title: 'All Day Event1',		// 제목
  	        start: '2018-04-01',			// 시작일
  	        end: '2018-04-10'				// 종료일
  	      },
  	      {
    	   	title: 'All Day Event2',
    	    start: '2018-04-01'
    	  },
    	  {
      	   	title: 'All Day Event3',
      	    start: '2018-04-01T20:00:00'	//YYYY-MM-DDThh:mm:ss
      	  },
      	  {
          	title: 'All Day Event4',
            start: '2018-04-01'
          },
          {
           	title: 'All Day Event5',
            start: '2018-04-01'
          },
          {
            title: 'All Day Event6',
            start: '2018-04-01'
          }
  	    ],
  	});
});
</script>
 -->

 <!-- 구글맵에 대한 스크립트 -->
<script type="text/javascript">
function initMap() {
	var x = ${wd.latitude};
	var y = ${wd.longitude};
	var uluru = {lat: x, lng: y};					// 위도 경도
 	var map = new google.maps.Map(document.getElementById('map1'), {	// wedmap에 뿌려줄거임
	   	zoom: 18,								// 숫자가 올라갈수록 지도 확대
	   	center: uluru
	   	//disableDefaultUI:true,
	   	//mapTypeId:google.maps.MapTypeId.ROADMAP,
	   	//draggable:true  	
 	});
	
	var marker = new google.maps.Marker({		
	    position: uluru,
	    map: map,
	    title:'${wd.cname}'
	});
	
}
// 바로 맵 실행
google.maps.event.addDomListener(window, 'load', initMap);
</script>

<script>
function delwedding(){
	location.href="Weddingdel.do?whseq="+${wd.whseq};
}
/* 홀 추가 */
function addhall(){
	location.href="Hallwrite.do?whseq="+${wd.whseq};
}
/* 홀 수정 */
function modhall(){
	location.href="Hallmod.do?whseq="+${wd.whseq};
}
</script>

