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
<link rel='stylesheet' href='FullCalendar/fullcalendar.css' />
<link rel='stylesheet' media="print" href='FullCalendar/fullcalendar.print.min.css' />
<script src='FullCalendar/lib/jquery.min.js'></script>
<script src='FullCalendar/lib/moment.min.js'></script>
<script src='FullCalendar/lib/jquery-ui.min.js'></script>
<script src='FullCalendar/fullcalendar.min.js'></script>
<script src='FullCalendar/locale-all.js'></script>	<!-- 한국어 변환 -->


<!-- 테이블 및 홀이름 갯수 css -->
<style>
.tb2 table{
	width: 100%;	
	border: 1px solid #F5F5F5;
}
.tb2 tr{
	padding: 20px 20px;
}
.tb2 th,td{
	align-content: center;
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
</style>

<!-- 이미지 css -->
<style type="text/css">
.imgScroll td{
	width: 10%; 
	height: 5%;
	align-content: center;
	text-align: center;
}

.clickimg{
	border:4px solid #ef8bc5;
}
</style>

<!-- 그냥 캘린더 css -->
<style>
table, td, th {
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
</style>

<!-- 화면 흐리게 css -->
<style>
#mask{
  position:absolute;  
  left:0;
  top:0;
  z-index:9000;  
  background-color:#000;  
  display:none;  
}
</style>

<!-- 달력 -->
<%--
List<ReservationDto> list= new ArrayList<ReservationDto>();
Object Oflist=request.getAttribute("flist");
if(Oflist!=null){
	list=(List<ReservationDto>)Oflist;
}

myCal jcal=(myCal)request.getAttribute("jcal");

int dayOfWeek=jcal.getDayOfWeek();//1일 요일1~7
int lastDayOfMonth=jcal.getLastDay();

int year=jcal.getYear();
int month=jcal.getMonth();
--%>
<%!
//1자라면 0을 붙여 두자로 만들기 1->01
public String two(String msg){
	return msg.trim().length()<2?"0"+msg:msg.trim();
}//
//15자 이상되면 ... 를 이용하여 줄임표시
public String dot3(String msg){
	String s="";
	if(msg.length()>=15){
		s=msg.substring(0,15);
		s+="...";
	}else{
		s=msg.trim();
	}
	return s;
}
public String makeTable(int year,int month, int day,
		List<ReservationDto> lcdtos){
	String s="";
	String dates=(year + "") + two(month + "") + two(day + "");//년월일 8글자 만드는거
		
	s="<table class='innerTable'>";
	s+="<col width='100px'/>";
	for(ReservationDto lcd:lcdtos){ //향상된 for
		if(lcd.getRedate().substring(0,8).equals(dates)){
			s+="<tr bgcolor='#4D6BB3'>";
			s+="<td>";			
			s+="<a href='caldetail.do?seq="+lcd.getRvseq()+"'>";
			s+="<font style='font-size:8px;color:#090000'>"; //글씨작게해서15자 들어가게끔
			s+=dot3(lcd.getRetime()+lcd.getMid());
			s+="</font>";
			s+="</a>";
			s+="</td>";
			s+="</tr>";
		}
	}
	s+="</table>";
	return s;
}
%>


<div class="container" style="padding-top: 10px">
	<h2 class="nino-sectionHeading">
	<!-- <span class="nino-subHeading"></span> -->
		${wd.cname }
	</h2>
	
	<div align="right">
		<button onclick="addhall()">홀 추가</button>
	</div>
	
	<div class="sectionContent" style="border-top: 6px solid black; padding-left: 30px">
		<div class="row" style="padding-top: 30px">				
			<div class="col-md-6">
				<table style="width: 100%;">
					<colgroup>
						<col width="30%"><col width="70%">
					</colgroup>
					<tr>
						<td colspan="2"  height="1" bgcolor="gray"></td>
					</tr>
					<tr>
						<td>별점</td>
					</tr>
					<tr>
						<td colspan="2"  height="1" bgcolor="gray"></td>
					</tr>
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
				</table>		
					<div class="text-center">
					</div>
			</div>
			<div class="col-md-6">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<img src="upload/${ wd.picture }"  width="400px" >
				</div>
			</div>
			
		</div>
	</div>
</div>



<!-- 홀 설명 -->
<div class="container" id="hallstory">
	<br><br>
	<div class="selectTB">
	<table style="width: 100%; border: 1px solid black;">
		<tr style="height:20px;">
			<th><a href="#hallstory"><font color="#ff0000">홀 설명</font></a></th>
			<th><a href="#hallpic">홀 사진</a></th>
			<th><a href="#halllocation">홀 위치</a></th>
			<th><a href="#hallreview">홀 리뷰</a></th>
			<th><a href="#hallregi">홀 예약</a></th>
		</tr>
	</table>
	</div>
	
	<div>	
		<br><br>
		<p style="color: red">※ 아래 정보는 웨딩홀에서 제공한 정보를 기준으로 하며, 웨딩홀의 사정에 따라 메뉴, 가격 등이 변경될 수 있습니다. </p>
		<b>주소 : ${wd.address }</b><br>
		<b>교통 : ${wd.transpo }</b>
		<br><br>
		
		<div class="tb2">
		<table>
			<colgroup>
				<col width="10%"> <!-- 요일 -->
				<col width="15%"> <!-- 형태/시설구분 -->	
				<col width="15%"> <!-- 인원 -->
				<col width="10%"> <!-- 간격 -->
				<col width="10%"> <!-- 사용료 -->
				<col width="10%"> <!-- 메뉴 -->
				<col width="15%"> <!-- 식대 -->
				<col width="15%"> <!-- 음주류 -->
			</colgroup>
			
			<tr>
				<th>요일</th><th>형태/시설구분</th><th>인원</th><th>간격</th><th>사용료</th><th>메뉴</th><th>식대</th><th>음주류</th>
			</tr>
			<c:forEach var="hall" items="${hallList }">
				<tr>
					<td colspan="8" style="background-color: #F5F5F5;">${hall.hallname }/${hall.floor }</td>
				</tr>
				<tr>
					<td>월~일</td>
					<td>${hall.format }<br>/<br>${hall.facility }</td>
					<td>최소 : ${hall.minpeople }명<br>착석 : ${hall.setpeople }명<br>최대 : ${hall.maxpeople}명</td>
					<td>${hall.wstep }</td>
					<td>${hall.pay }</td>
					<td>${hall.menutype }</td>
					<td>${hall.mincook }<br>${hall.maxcook }</td>
					<td>${hall.drink }</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
</div>
	
<!-- 홀 사진 -->
<div class="container" id="hallpic">
	<br><br>
	<div class="selectTB">
	<table style="width: 100%; border: 1px solid black;">
		<tr style="height:20px;">
			<th><a href="#hallstory">홀 설명</a></th>
			<th><a href="#hallpic"><font color="#ff0000">홀 사진</font></a></th>
			<th><a href="#halllocation">홀 위치</a></th>
			<th><a href="#hallreview">홀 리뷰</a></th>
			<th><a href="#hallregi">홀 예약</a></th>
		</tr>
	</table>	
	</div>
	
	
	
	<div align="center" style="width: 100%; background-color: #F5F5F5;">	
		<br><br>
		
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
	<div class="selectTB">
	<table style="width: 100%; border: 1px solid black;">
		<tr style="height:20px;">
			<th><a href="#hallstory">홀 설명</a></th>
			<th><a href="#hallpic">홀 사진</a></th>
			<th><a href="#halllocation"><font color="#ff0000">홀 위치</font></a></th>
			<th><a href="#hallreview">홀 리뷰</a></th>
			<th><a href="#hallregi">홀 예약</a></th>
		</tr>		
	</table>
	</div>

	<div style="width: 100%; background-color: #F5F5F5; ">
		<br><br>
		<div onload="initMap()" align="center">
			<div id="map1" style="width:90%; height: 500px; border: 1px solid black;"></div>
		</div>
		<br>
		
		<div style="margin-left: 60px">
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
	<div class="selectTB">
	<table style="width: 100%; border: 1px solid black;">
		<tr style="height:20px;">
			<th><a href="#hallstory">홀 설명</a></th>
			<th><a href="#hallpic">홀 사진</a></th>
			<th><a href="#halllocation">홀 위치</a></th>
			<th><a href="#hallreview"><font color="#ff0000">홀 리뷰</font></a></th>
			<th><a href="#hallregi">홀 예약</a></th>
		</tr>
	</table>
	</div>
</div>	


<!-- 홀 예약 -->
<!-- 
table {
    border-collapse: collapse;    
}

table, td, th {
    border: 1px solid black;
    font-weight: bold;
    font-size: 20px;
}
 -->
<div class="container" id="hallregi">
	<br><br>
	<div class="selectTB">
	<table style="width: 100%; border: 1px solid black;">
		<tr style="height:20px;">
			<th><a href="#hallstory">홀 설명</a></th>
			<th><a href="#hallpic">홀 사진</a></th>
			<th><a href="#halllocation">홀 위치</a></th>
			<th><a href="#hallreview">홀 리뷰</a></th>
			<th><a href="#hallregi"><font color="#ff0000">홀 예약</font></a></th>
		</tr>
	</table>
	</div>
	
	<!-- 달력 -->
	<div align="center">
		<%-- 
		<div style="text-align: left"><a href='<%=url%>'><%=year+"년 "+month+"월 " %>일정보기</a></div>
		 --%>
		<div class="box_border" style="margin-top:5px; margin-bottom: 10px;">
		<table style="width:85%;" class="calender">
		<col width="100px"/>
		<col width="100px"/>
		<col width="100px"/>
		<col width="100px"/>
		<col width="100px"/>
		<col width="100px"/>
		<col width="100px"/>
		
		
		<thead  id="_calender1">
		<tr height="50px">
			<td class="days2" colspan="7">
			<input type="text" value="<이전달" style="border: 1px solid black;cursor:pointer" size="4" readonly onclick="makeCalender(${jcal.month-1})">&nbsp;
			<font color="black" style="font-size: 24"><input type="text" value="${jcal.year}" size="2" readonly>&nbsp;&nbsp;
				<input type="text" value="${jcal.month }월" size="1" readonly>
			</font>&nbsp;<input type="text" value="다음달>" style="border: 1px solid black;cursor:pointer" size="4" readonly onclick="makeCalender(${jcal.month+1})"></td>
		</tr>
		
		<tr height="40px">
			<th class="days3">일</th><th class="days3">월</th>
			<th class="days3">화</th><th class="days3">수</th><th class="days3">목</th>
			<th class="days3">금</th><th class="days3">토</th>
		</tr>
		</thead>
		
		<tbody id="_calender">
		<tr height="100px">	
		<c:forEach varStatus="i" begin="1" end="${jcal.dayOfWeek - 1 }">
			<td>&nbsp;</td>
		</c:forEach>
		
		<c:forEach varStatus="i" begin="1" end="${jcal.lastDay}">
			<input type="hidden" value="${i.index }" id="_tabval${i.index}">
			<c:if test="${(i.index+jcal.dayOfWeek-1)%7==0}">
				<td class="satday" onmouseover="mouse(${i.index})" id="_day${i.index }">
					<font id="_daytext${i.index }">${i.index }&nbsp;</font>
					
					<table class='innerTable' id="_intable${i.index }" >
						<col width='100px'/>
						<c:forEach items="${flist }" var="list">
							<c:if test="${list.redate eq jcal.dateStr}">
								<tr bgcolor='#4D6BB3'>
									<td>
										<font style='font-size:8px;color:#090000'>
										${list.retime }${list.mid }
							</c:if>
						</c:forEach>
					</table>
					<%-- 
					s="<table class='innerTable'>";
					s+="<col width='100px'/>";
					for(ReservationDto lcd:lcdtos){ //향상된 for
						if(lcd.getRedate().substring(0,8).equals(dates)){
							s+="<tr bgcolor='#4D6BB3'>";
							s+="<td>";			
							s+="<a href='caldetail.do?seq="+lcd.getRvseq()+"'>";
							s+="<font style='font-size:8px;color:#090000'>"; //글씨작게해서15자 들어가게끔
							s+=dot3(lcd.getRetime()+lcd.getMid());
							s+="</font>";
							s+="</a>";
							s+="</td>";
							s+="</tr>";
					 --%>
					<div style="z-index: 5; display: none;" id="_resv${i.index }" align="center">
						<a href="#" onclick="request(${i.index})">
							<img alt="예약하기" src="assets/images/others/resv.jpg">
						</a>
					</div>
				</td>
			</c:if>
			<c:if test="${(i.index+jcal.dayOfWeek-1)%7==1}">
				<td class="sunday" onmouseover="mouse(${i.index})" id="_day${i.index }">
					<font id="_daytext${i.index }">${i.index }&nbsp;</font>
					
					<table id="_intable${i.index }" >
					</table>
					
					<div style="z-index: 5; display: none;" id="_resv${i.index }" align="center">
						<a href="#" onclick="request(${i.index})">
							<img alt="예약하기" src="assets/images/others/resv.jpg">
						</a>
					</div>
				</td>
			</c:if>
			<c:if test="${(i.index+jcal.dayOfWeek-1)%7!=0 && (i.index+jcal.dayOfWeek-1)%7!=1}">
				<td class="otherday" onmouseover="mouse(${i.index})" id="_day${i.index }">
					<font id="_daytext${i.index }">${i.index }&nbsp;</font>
					
					<table id="_intable${i.index }" >
					</table>
					
					<div style="z-index: 5; display: none;" id="_resv${i.index }" align="center">
						<a href="#" onclick="request(${i.index})">
							<img alt="예약하기" src="assets/images/others/resv.jpg">
						</a>
					</div>
				</td>
			</c:if>
			<c:if test="${((i.index+jcal.dayOfWeek-1)%7==0 && i.index != jcal.lastDay) }">
				</tr><tr height="100px">
			</c:if>
		</c:forEach>
		<c:forEach varStatus="i" begin="0" end="${(7-(jcal.dayOfWeek+jcal.lastDay-1)%7)%7-1 }">
			<td>&nbsp;</td>
		</c:forEach>
		</tr>
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

<!-- 달력 처리 -->
<script>
var dayOfWeek = ${jcal.dayOfWeek};
var lastDayOfMonth = ${jcal.lastDay};
var year = ${jcal.year};
var month = ${jcal.month};

$(function () {
	function test1(){
		alert("test1");
	}	
});

function makeCalender(month){
	var data = {
		year:year,
		month:month,
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
			
			// 헤더 부분
			$("#_calender1").empty()
			var tagStr1 = "";
			tagStr1 += "<tr height='50px'>";
			tagStr1 += 	"<td class='days2' colspan='7'>";
			tagStr1 += 	"<input type='text' value='<이전달' style='border: 1px solid black;cursor:pointer' size='4' readonly onclick='makeCalender("+(month-1)+")'>&nbsp;";
			tagStr1 += 	"<font color='black' style='font-size: 24'><input type='text' value='"+year+"' size='2' readonly>&nbsp;&nbsp;";
			tagStr1 += 		"<input type='text' value='"+month+"월' size='1' readonly>";
			tagStr1 += 	"</font>&nbsp;<input type='text' value='다음달>' style='border: 1px solid black;cursor:pointer' size='4' readonly onclick='makeCalender("+(month+1)+")'></td>";
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
				if((i+dayOfWeek-1)%7==0){
					tagStr += "<td class='satday' onmouseover='mouse("+i+")' id='_day"+i+"'>";
					tagStr += "<font id='_daytext"+i+"'>"+i+"&nbsp;</font>";
					tagStr += "<div style='z-index: 5; display: none;' id='_resv"+i+"' align='center'>";
					tagStr +=		"<a href='#' onclick='request("+i+")'>";
					tagStr +=			"<img alt='예약하기' src='assets/images/others/resv.jpg'>";
					tagStr +=		"</a>";
					tagStr += "</div>";
				}else if((i+dayOfWeek-1)%7==1){
					tagStr += "<td class='sunday' onmouseover='mouse("+i+")' id='_day"+i+"'>";
					tagStr += "<font id='_daytext"+i+"'>"+i+"&nbsp;</font>";
					tagStr += "<div style='z-index: 5; display: none;' id='_resv"+i+"' align='center'>";
					tagStr +=		"<a href='#' onclick='request("+i+")'>";
					tagStr +=			"<img alt='예약하기' src='assets/images/others/resv.jpg'>";
					tagStr +=		"</a>";
					tagStr += "</div>";
				}else{
					tagStr += "<td class='otherday' onmouseover='mouse("+i+")' id='_day"+i+"'>";
					tagStr += "<font id='_daytext"+i+"'>"+i+"&nbsp;</font>";
					tagStr += "<div style='z-index: 5; display: none;' id='_resv"+i+"' align='center'>";
					tagStr +=		"<a href='#' onclick='request("+i+")'>";
					tagStr +=			"<img alt='예약하기' src='assets/images/others/resv.jpg'>";
					tagStr +=		"</a>";
					tagStr += "</div>";
				}
				if((i+dayOfWeek-1)%7==0 && i != lastDayOfMonth){
					tagStr += "</tr><tr height='100px'>";
				}
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
			$("#_resv"+i).css("display","");
			//tagStr += "<button onclick='regidate("+i+")' style='background-color: red;'><font color='white'>예약하기</font></button>";
			//$("#_day"+i).empty();
			//$("#_day"+i).append(tagStr);
			
		}else{
			$("#_day"+i).css("background-color","");
			$("#_daytext"+i).css("color","");
			$("#_resv"+i).css("display","none");
			//$("#_day"+i).empty();
			//$("#_day"+i).append(tagStr);
		}
	}
}

// 부모의 window 이름
window.name = 'parentview';

// 달력을 클릭시
function request(day){
	if(month<10){
		month = "0" + month;
	}
	if(day<10){
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
/* 
$('#mask').mouseover(function () {
	$(this).hide();
});
	 */
$('#mask').click(function () {
	$(this).hide();
	//$('.window').hide();
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
	//alert(name);
	selIndex = 0;
    picIndex = 0;
	hallname = name;
	imgScroll();
}


function imgScroll(){
	//alert(hallname);
	//alert(${wd.whseq});
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

<!-- 홀 추가 -->
<script>
function addhall(){
	location.href="Hallwrite.do?whseq="+${wd.whseq};
}
</script>

