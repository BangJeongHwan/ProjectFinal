<%@page import="kh.com.a.model2.LoginDto"%>
<%@page import="java.util.List"%>
<%@page import="kh.com.a.model.MakeupDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/hanna.css">

<!-- ★fullcalender -->
<link rel='stylesheet' href='FullCalendar/fullcalendar.css' />
<link rel='stylesheet' media="print" href='FullCalendar/fullcalendar.print.min.css' />
<script src='FullCalendar/lib/jquery.min.js'></script>
<script src='FullCalendar/lib/moment.min.js'></script>
<script src='FullCalendar/lib/jquery-ui.min.js'></script>
<script src='FullCalendar/fullcalendar.min.js'></script>
<script src='FullCalendar/locale-all.js'></script>	<!-- 한국어 변환 -->

<!-- ★modal -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<%
LoginDto mem = (LoginDto)session.getAttribute("login");
if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>

<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/hanna.css">

<style type="text/css">
/* ★ */
.modal-backdrop {
    z-index: -1;
}
.modalContent {
    font-size: 18px;
    color: black;
  }

.mySlides {display:none}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}
th, td {padding: 10px}

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
    background: #ce4869 ;
}
table.type11 td {
    width: 155px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
}

table.type05 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}
table.type05 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.type05 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

.fontyle {
        font-family: 'Hanna', Fantasy;
        font-size: 20px;
        color: black;
      }

.imgScroll td{
	width:92px;
	height:60px;
	align-content: center;
	text-align: center;
	padding:1px;
}
</style>

<!-- alert -->
<c:if test="${ not empty flag && flag eq 'bsk'}">
	<script type="text/javascript">
		if (confirm("장바구니에 추가했습니다. 장바구니로 이동하시겠습니까?")) {
			location.href = "basketListView.do";
		}
	</script>
</c:if>
<c:if test="${ not empty flag && flag eq 'bskFail'}">
	<script type="text/javascript">
		if (confirm("동일한 상품은 한 번만 담깁니다. 장바구니로 이동하시겠습니까?")) {
			location.href = "basketListView.do";
		}
	</script>
</c:if>

<!-- 이미지 스크롤을 위한  setting -->
<script type="text/javascript">
var picMaxSize = 0;
var picArr = new Array("", "", "", "", "", "", "", "", "", "");
</script>
<!-- picName setting  -->
<c:forEach items="${ muDto.pic }" var="pic" varStatus="i">
	<c:if test="${ not empty muDto.pic[i.index] && muDto.pic[i.index] != '' }">
		<script type="text/javascript">
			picArr[picMaxSize] = "${muDto.pic[i.index]}";
			picMaxSize++;
		</script>
	</c:if>
</c:forEach>

<div style="width: 1400px">
	<div class="w3-display-container" style="padding-left:120px; padding-top:30px;padding-right: 80px; width: 60%;  float: left;">
		<div class="text-center">
			<c:if test="${ empty muDto.pic1 || muDto.pic1 eq ''}">
				<img src="assets/images/wedding/63img1_b.jpg" alt="" id="bigimg" style="width:551px;height: 367px;">
			</c:if>
			<c:if test="${ not empty muDto.pic1 && muDto.pic1 ne ''}">
				<img src="upload/${ muDto.pic1 }" alt="" id="bigimg" style="width:551px;height: 367px;"/>
			</c:if>
		</div>
		<div style="height: 3px"></div>
		<div class="w3-display-container" style="padding-left: 50px">
			<table>
				<tr id="_sPicTr" class="imgScroll"></tr>
			</table>
		</div>
	</div>
	
	<div class="fontyle" style="width: 500px; float: left;">
		<table class="type05" >
			<colgroup>
				<col width="20%"><col width="30%"><col width="20%"><col width="30%">
			</colgroup>
			<tr>
				<td colspan="3" style="font-size:50px">${muDto.cname}</td>
				<td>
				<c:if test="${jjdto == 'false' }">
					<img src="images/likebefore.png" id="likedetail" name="likedetail" onClick="like()" style="width: 60px;">
				</c:if>
				<c:if test="${jjdto == 'true' }">
					<img src="images/heart.gif" id="likedetail" name="likedetail" onClick="like()" style="width: 60px;">
				</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="4">${muDto.content}</td>
			</tr>
			<tr>
				<td>오픈시간</td>
				<td colspan="3">${muDto.opentime}</td>
			</tr>
			<tr>
				<td>마감시간</td>
				<td colspan="3">${muDto.closetime}</td>
			</tr>
			<tr >
				<td>주소</td>
				<td colspan="3">${muDto.address}</td>
			</tr>
		</table>
		<form action="muBasket.do" method="post" id="_frmPay" onsubmit="return checkSubmit('')">
		 	<input type="hidden" name="cmd" id="_cmd" value="bsk">
			<input type="hidden" name="pdseq" value="${ muDto.museq }">
			<%-- <input type="hidden" name="pdname" value="${ muDto.cname }"> --%>
			<input type="hidden" name="option1" id="_option1" value="${mupdList[0].title}">
			<%-- <input type="hidden" name="total_price" id="_total_price" value="${mupdList[0].price}"> --%>
			<table class="type05" >
				<colgroup>
					<col width="20%"><col width="80%">
				</colgroup>
				<tr>
					<td>상품</td>
					<td>
						<select id="_optionSelect" onchange="setOptionPrice('')">
							<c:forEach items="${ mupdList }" var="mupd" varStatus="i">
								<option value="${ mupd.price }">${ mupd.title }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>예약날짜</td>
					<td>
						<input type="text" id="_redate" name="redate" size="10" style="border: none; cursor:default" value="" readonly>
					</td>
				</tr>
				<tr>
					<td>예약시간</td>
					<td>
						<select name="retime" id="_retime">
							<c:forEach var="i" begin="${openHour}" end="${closeHour - 1}">
								<option value="${i}:${openMin}~${i + 1}:${openMin}">${i}:${openMin}~${i + 1}:${openMin}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr >
					<td>상품 가격</td>
					<td>
						<input type="text" name="total_price" id="_total_price" value="${mupdList[0].price}"
										 style="border: 0"  readonly="readonly">원
					</td>
				</tr>
				<tr>
					<td colspan="2">
						&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						<button type="button" onclick="muPaymentView('')"  class="w3-btn w3-white w3-border w3-border-red w3-round-large">결제</button>
						&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						<button type="button" onclick="muBasket('')" class="w3-btn w3-white w3-border w3-border-red w3-round-large">장바구니</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<div class="container" align="center" style="width:100px;">
	<button onclick="list()" class="w3-btn w3-white w3-border w3-border-red w3-round-large">목록</button>
	<c:if test="${ not empty login && login.auth == 'admin'}">
		<button onclick="mod()" class="w3-btn w3-white w3-border w3-border-red w3-round-large">수정</button>
		<button onclick="del()" class="w3-btn w3-white w3-border w3-border-red w3-round-large">삭제</button>
	</c:if>
</div>
<br><br><br>

<div class="w3-container" style="color: black;" >
	<div class="w3-row" align="center" style="padding-left: 450px">
      	<a href="javascript:void(0)" onclick="openCity(event, 'regi');">
	      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
	       	style="font-family: 'Hanna', Fantasy;">예약 정보
	      </div>
	    </a>
	    <a href="javascript:void(0)" onclick="openCity(event, 'hugi');">
	      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
	      	style="font-family: 'Hanna', Fantasy;">후기글
	      </div>
	    </a>
	</div>
  
	<!-- 예약 뷰 -->
	<div id="regi" class="w3-container city" style="display:inline;">
		<div class="w3-container" style="padding-left:150px;padding-right:150px;font-family: 'Hanna', serif;">
			<div align="center">
				<div id='calendar' style="width:80%; height: 800px; margin-top:20px;" ></div>
			</div>
		</div>
	</div>
	  
	<!-- 후기 뷰 -->
	<div id="hugi" class="w3-container city" style="display:none;">
		<div class="w3-container" style="padding-left:150px;padding-right:150px; font-family: 'Hanna', serif;">
			<br><br><br>
			<div align="center">
				<table class="type11" style="width:85%; font-family: 'Hanna', serif;" >
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
				<form action="wmureview.do" onsubmit="return checkReviewSubmit('${login.id}')">
					<input type="hidden" name="rpdseq" value="${muDto.museq}">
					<input type="hidden" name="pname" value="${muDto.cname}">
					<input type="hidden" name="mid" value="${login.id }">
					<input type="hidden" name="title" value="${muDto.cname}">
					
					<table class="type11" style="width:85%; font-family: 'Hanna', serif;" >
					<tr style="border: 0; border-bottom-color: lightgray">
						<td colspan="2">
							<input type="text" name="content" size="70">
						</td>
						<td>
							<input class="w3-btn w3-white w3-border w3-border-red w3-round-large" type="submit" value="댓글">
						</td>
					</tr>
					
					</table>
				</form>
			</div>
		</div>
	</div>
  
</div>

<!-- Modal -->
<div class="modal fade" id="_regiModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="width:600px">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <div align="center">
      	  <h4 class="modal-title" id="myModalLabel">예약하기</h4>
        </div>
      </div>
      <div class="modal-body">
      	<!-- <input type="text" id="_index" value="0"> -->
      	<div id="_modalContent" class="modalContent">
      		<form action="muBasket.do" method="post" id="_frmPayModal" onsubmit="return checkSubmit('Modal')">
			 	<input type="hidden" name="cmd" id="_cmdModal" value="bsk">
				<input type="hidden" name="pdseq" value="${ muDto.museq }">
				<%-- <input type="hidden" name="pdname" value="${ muDto.cname }"> --%>
				<input type="hidden" name="option1" id="_option1Modal" value="${mupdList[0].title}">
	      	  
				<table class="type05" >
					<colgroup>
						<col width="20%"><col width="80%">
					</colgroup>
					<tr>
						<td>상품</td>
						<td>
							<select id="_optionSelectModal" onchange="setOptionPrice('Modal')">
								<c:forEach items="${ mupdList }" var="mupd" varStatus="i">
									<option value="${ mupd.price }">${ mupd.title }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>예약날짜</td>
						<td>
							<input type="text" id="_redateModal" name="redate" size="10" style="border: none; cursor:default" value="" readonly>
						</td>
					</tr>
					<tr>
						<td>예약시간</td>
						<td>
							<select name="retime" id="_retimeModal">
								<c:forEach var="i" begin="${openHour}" end="${closeHour - 1}">
									<option value="${i}:${openMin}~${i + 1}:${openMin}">${i}:${openMin}~${i + 1}:${openMin}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr >
						<td>상품 가격</td>
						<td>
							<input type="text" name="total_price" id="_total_priceModal" value="${mupdList[0].price}"
											 style="border: 0"  readonly="readonly">원
						</td>
					</tr>
					<tr>
						<td colspan="2">
							&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
							<button type="button" onclick="muPaymentView('Modal')"  class="w3-btn w3-white w3-border w3-border-red w3-round-large">결제</button>
							&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
							<button type="button" onclick="muBasket('Modal')" class="w3-btn w3-white w3-border w3-border-red w3-round-large">장바구니</button>
						</td>
					</tr>
				</table>
			</form>
      	
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>

<!-- ★fullcalendar에 대한 스크립트 -->
<!-- https://fullcalendar.io/ -->
<script type="text/javascript">


function modalRegi(date) {
	date = date.split("-").join("/");	// yyyy-mm-dd -> yyyy/mm/dd
	$("#_redateModal").val(date);
	
	selectDate(date, 'Modal');
	
	$("#_regiModal").modal("show");
	$("#_regiModal").css("z-index", "1500");
}

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
	 	locale: initialLocaleCode
	 	   
		// header 설정
  		,header: {
  	        left: 'prev,next,today',	// 달 이동
  	        center: 'title',			// 제목
  	        right: 'month,agendaWeek,listMonth'	// 월별, 주별, 일별, list
  	    }
  		// 현재 보여줄 화면
  	    ,defaultDate: rdate
  	    // show the prev/next text <, >
 	    ,buttonIcons: true
 	    // 1년간의 주를 나타내 (주)는 부분
 	   	,weekNumbers: true
  	    // 날짜 클릭 가능(true), 불가(false)
  	    ,navLinks: true	    
  	    // 일정 옮기기 가능
  	    ,editable: true	    
  		// 4개 이상 "more" 창 나타내기(true), 나타내지 않기(false)
  	    ,eventLimit: true
 		// 일정 넣는 부분
  	    ,events: ${regiData}
 	    ,editable:false
 	    ,height: 700
 	    ,  dayClick: function(oriDate, jsEvent, view) {
 	    	// date : 선택 날짜, jsEvent : 클릭 좌표, view : 현재 보고 있는 화면 상태 (month 등)
			// change the day's background color just for fun
			// $(this).css('background-color', 'red');
						
			// 오늘날짜보다 이전 날짜는 클릭할 수 없도록 한다.
			var date = oriDate.format();
			var dateArr = date.split('-');
			if (parseInt(y) <= parseInt(dateArr[0])) {
				if (parseInt(m) <= parseInt(dateArr[1])) {
					if (parseInt(d) <= parseInt(dateArr[2])) {
						modalRegi(date);
					}
				}
			}
 	     }
  	});
});

</script>

<script type="text/javascript">
function openCity(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
     tablinks[i].className = tablinks[i].className.replace(" w3-border-red", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.firstElementChild.className += " w3-border-red";
}
</script>

<!-- 이미지 스크롤 관련 -->  
<script type="text/javascript">
var picIndex = 0;
function imgScroll() {
	var tagStr = "<td style='width:50px;cursor:pointer' onclick='scrMoveLeft()'>◀</td>";
	for(var i = (picIndex - 2); i <= (picIndex+2); i++) {
		if (i == picIndex) {
			tagStr += "<td style='border:4px solid #ef8bc5'>";
		} else {
			tagStr += "<td>";
		}
		if (i >= 0 && i < picMaxSize) {
			//var onclickStr = "func()";
			var onclickStr = "imgChange(" + i +")";
			tagStr += "<img src='upload/"+ picArr[i] +"' onclick='"+ onclickStr +"' style='width:90px;height:59px;cursor:pointer'>";
		}
		tagStr += "</td>";
	}
	tagStr += "<td style='width:50px;cursor:pointer' onclick='scrMoveRight()'>▶</td>";
	
	$("#_sPicTr").empty();
	$("#_sPicTr").append(tagStr);
}
imgScroll();

function scrMoveLeft() {
	picIndex -= 5;
	if (picIndex < 0) picIndex = 0;
	imgChange(picIndex);
}
function scrMoveRight() {
	picIndex += 5;
	if (picIndex >= picMaxSize) picIndex = (picMaxSize - 1);
	imgChange(picIndex);
}
function imgChange(index) {
	var src = "upload/" + picArr[index];
	$("#bigimg").attr("src", src);
	var selectedId = "#simg" + picIndex;
	var newId = "#simg" + index;
	$(selectedId).removeAttr("class");
	$(newId).attr("class", "select_img");
	picIndex = index;
	imgScroll();
}
</script>
    
<script type="text/javascript">

function toggle(divId) {
//	alert($(divId).attr("class"));
/* 	if ($(divId).attr("class") == "panel-collapse collapse in") {
		$(divId).attr("class", "panel-collapse collapse");
	} else {
		$(divId).attr("class", "panel-collapse collapse in");
	} */
	if ($(divId).attr("class") == "panel-collapse collapse in") return;
	
	if ($("#collapseOne").attr("class") == "panel-collapse collapse in") {
		$("#collapseOne").attr("class", "panel-collapse collapse");
		$("#collapseOne").hide();
	} else if ($("#collapseTwo").attr("class") == "panel-collapse collapse in") {
		$("#collapseTwo").attr("class", "panel-collapse collapse");
		$("#collapseTwo").hide();
	} else {
		$("#collapseThree").attr("class", "panel-collapse collapse");
		$("#collapseThree").hide();
	}
	$(divId).show('slow');
	$(divId).attr("class", "panel-collapse collapse in");
	
	//$("#collapseOne").toggle('slow');
	//$("#collapseOne").toggle('slow');
}

function checkReviewSubmit(id) {
	if (id == "guest") {
		alert("로그인 후 이용해주세요.");
		return false;
	}
	return true;
}

function checkSubmit(tail) {
	
	if ($("#_redate" + tail).val().trim() == "") {
		alert("날짜를 선택해주세요.");
		return false;
	}
	
	return true;
}

function muBasket(tail) {
	$("#_cmd" + tail).val("bsk");
	$("#_frmPay" + tail).attr({ "target":"_self", "action":"muBasket.do" }).submit();
}

function muPaymentView(tail) {
	$("#_cmd" + tail).val("pay");
	$("#_frmPay" + tail).attr({ "target":"_self", "action":"muBasket.do" }).submit();
}

function del() {
	if (confirm("삭제 하시겠습니까?")) {
		location.href = "muDel.do?museq=" + ${muDto.museq};
	}
}

function mod() {
	location.href = "muModView.do?museq=" + ${muDto.museq};
}

function list() {
	location.href = "muMainView.do";
}

// 옵션 값이 바뀌었을 때
function setOptionPrice(tail) {
	var mupdStr = $("#_optionSelect" + tail + " option:selected").text();
	$("#_option1" + tail).val(mupdStr);
	$("#_total_price" + tail).val($("#_optionSelect" + tail +" option:selected").val());
}

// 예약시 달력
var startD = "";
var endD = "";

var year = "";
var month = "";
var day = "";
$("#_redate").datepicker(   // inputbox 의 id 가 startDate 
	{dateFormat:'yy/mm/dd' // 만약 2011년 4월 29일 선택하면  inputbox 에 '2011/04/29' 로표시
	, showOn: 'button' // 클릭으로 우측에 달력 icon 을 보인다.
	, buttonImage: 'assets/images/selectCal.jpg' // 우측 달력 icon 의 이미지 패스 
	, buttonImageOnly: true //  inputbox 뒤에 달력icon만 표시한다. ('...' 표시생략)
	, changeMonth: true // 월선택 select box 표시 (기본은 false)
	, changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	, showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	, minDate : 0         // 오늘부터 시작
	, onSelect: function (date) {
		selectDate(date, '');
	}
});
$('img.ui-datepicker-trigger').attr('style','cursor:pointer;');

// datepicker 날짜 선택시 수행
function selectDate(date, tail) {
	//alert(date);
	var adata = {
			redate:date,
			pdseq:${muDto.museq}
		};
	
	$.ajax({
		url:"getMuReservListByPdseqRedate.do",
		type:"get",
		data:adata,
		success:function(msg){

			$("#_retime" + tail).empty();
			for (var i = ${openHour}; i < ${closeHour - 1}; i++) {
				var retimeStr = i + ":" + ${openMin} + "~" + (i + 1) + ":" + ${openMin};
				var tagStr = "<option value="+ retimeStr +">" + retimeStr + "</option>";
				$("#_retime" + tail).append(tagStr);
			}
			
			// 예약된 시간 삭제
			for(var i = 0; i < msg.reservList.length; i++) {
				var retime = msg.reservList[i].retime;
				var optionId = "#_retime"+ tail +" option[value='" + retime + "']";
				$(optionId).remove();
			}
			
		},
		error:function(reqest, status, error){
			alert("실패");
		}
	});
}
</script>

<script type="text/javascript">
function like(){
	var pdseq = ${muDto.museq};
	var usid = "<%=mem.getId()%>";
	$.ajax({
		url:"like.do",
		type:"get",
		data:"pdseq="+pdseq+"&usid="+usid,
		success:function(msg){
			if(msg){
				$("#likedetail").attr("src","images/heart.gif");
				alert("해당 상품이 찜 목록에 추가되었습니다.");
			}else{
				$("#likedetail").attr("src","images/likebefore.png");
				alert("해당 상품이 찜 목록에서 삭제되었습니다.");
			}
		},
		error:function(reqest, status, error){
			alert("해당 삼품이 찜 목록에 추가되지 않았습니다.");
		}
	});	
}
</script>
     
    

