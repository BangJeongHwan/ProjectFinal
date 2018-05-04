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
<div align="center">
	<div align="center">
		<div id='calendar' style="width:90%; height: 895px; margin-top:20px;" ></div>
	</div>
</div>

<!-- <button type="button" id="_regiModalBtn" data-toggle="modal" data-target="#_regiModal" style="display: none">none</button>
 -->

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











