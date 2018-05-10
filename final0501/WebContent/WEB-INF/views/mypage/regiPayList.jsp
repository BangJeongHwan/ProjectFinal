<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!-- fullcalender -->
<link rel='stylesheet' href='FullCalendar/fullcalendar.css' />
<link rel='stylesheet' media="print" href='FullCalendar/fullcalendar.print.min.css' />
<script src='FullCalendar/lib/jquery.min.js'></script>
<script src='FullCalendar/lib/moment.min.js'></script>
<script src='FullCalendar/lib/jquery-ui.min.js'></script>
<script src='FullCalendar/fullcalendar.min.js'></script>
<script src='FullCalendar/locale-all.js'></script>	<!-- 한국어 변환 -->

<!-- modal -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<style type="text/css">
    .modal-backdrop {
        z-index: -1;
    }
    .modalContent {
        font-size: 18px;
        color: black;
      }
      
.payTbl table {
/* 	width: 1000px; */
	border: 1px solid #EBEBEB;
	align-content: center;
	cursor: default;
}
.payTbl tr{
	padding:  20px 20px;
	height: 60px;
}
.payTbl td{
	align-content: center;
	text-align: center;
	background-color: #fff;
}
.th td{
	background-color:#F8F8F8;
	align-content: center;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
}
</style>

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

<body>
<br><br>
<h3>결제 내역</h3>
<button onclick="tabChange('tbl')" id="_tabBtnTbl">표</button>
<button onclick="tabChange('cal')" id="_tabBtnCal">달력</button>
<br><br>
<div align="center">
	<div align="center" id="_cal">
		<div id='calendar' style="width:90%; height: 895px; margin-top:20px;" ></div>
	</div>
	<div align="center" id="_tbl">
	<!-- 년 월 / 월단위로 보기, 전체보기, 페이징 -->
		<table class="payTbl" style="width:90%">
		<colgroup>
			<col width="5%"><col width="12%"><col width="12%"><col width="12%">
			<col width="12%"><col width="20%"><col width="15%"><col width="12%">
		</colgroup>
		<tr class="th">
			<td>번호</td>
			<td>날짜</td>
			<td>시간</td>
			<td>옵션</td>
			<td>이름</td>
			<td>연락처</td>
			<td>결제일</td>
			<td>금액</td>
		</tr>
		<c:forEach items="${payList}" var="pay" varStatus="i">
			<tr>
				<td>${i.count}</td>
				<td>${pay.reservDto.redate}</td>
				<td>${pay.reservDto.retime}</td>
				<td>${pay.option1}</td>
				<td>${pay.memDto.mname}</td>
				<td>${pay.memDto.phone}</td>
				<td>${pay.buydate}</td>
				<td>${pay.total_price}</td>
			</tr>
		</c:forEach>
		</table>
	</div>
</div>
	

<!-- <button type="button" id="_regiModalBtn" data-toggle="modal" data-target="#_regiModal" style="display: none">none</button>
 -->
 
<script type="text/javascript">
function tabChange(state) {
	if (state == 'tbl') {
		$("#_cal").hide();
		$("#_tbl").show();
		$("#_tabBtnTbl").hide();
		$("#_tabBtnCal").show();
	} else {
		$("#_cal").show();
		$("#_tbl").hide();
		$("#_tabBtnTbl").show();
		$("#_tabBtnCal").hide();
	}
}
$("#_tbl").hide();
$("#_tabBtnCal").hide();
</script>
<!-- fullcalendar에 대한 스크립트 -->
<script type="text/javascript">
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
	// https://fullcalendar.io/
	$('#calendar').fullCalendar({
		
		// 한국어 변환
	 	locale: initialLocaleCode
	 	   
		// header 설정
  		,header: {
  	        left: 'prev,next,today',	// 달 이동
  	        center: 'title',			// 제목
  	        right: 'month,agendaWeek,agendaDay,listMonth'	// 월별, 주별, 일별, list
  	    }
  		// 현재 보여줄 화면
  	    ,defaultDate: rdate
  	    // show the prev/next text <, >
 	    ,buttonIcons: false
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
  	});
});

function func(str, redate) {
	$("#_modalContent").html(str);
	$("#myModalLabel").text(redate);
	$("#_regiModal").modal("show");
	$("#_regiModal").css("z-index", "1500");
}
</script>


</body>


