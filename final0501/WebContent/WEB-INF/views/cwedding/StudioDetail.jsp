<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/hanna.css">

<style>
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
      
img:hover { 
    background-color: red;
}      
      
</style>

<%int a = 1; %>

<div style="width: 1400px">
<div class="w3-display-container" style="padding-left:120px; padding-top:30px;padding-right: 80px; width: 60%;  float: left;">
  <img class="mySlides" src="upload/${sdDto.pic1}" style="width: 600px; height: 500px">
  <img class="mySlides" src="upload/${sdDto.pic2}" style="width: 600px; height: 500px">
  <img class="mySlides" src="upload/${sdDto.pic3}" style="width: 600px; height: 500px">
  <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="padding-right: 15px; width:70%">
    <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)" style="color: black;">&#10094;</div>
    <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)" style="color: black;">&#10095;</div>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
  </div>
</div>

<div class="fontyle" style="width: 500px; float: left;">
<table class="type05" >
<colgroup>
<col width="20%"><col width="30%"><col width="20%"><col width="30%">
</colgroup>
<tr>
	<td colspan="3" style="font-size:50px">${sdDto.cname}</td>
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
	<td colspan="4">${sdDto.content }</td>
</tr>
<tr>
	<td>오픈시간</td>
	<td colspan="3">${sdDto.opentime }</td>
</tr>
<tr>
	<td>마감시간</td>
	<td colspan="3">${sdDto.closetime }</td>
</tr>
<tr >
	<td>스튜디오 주소</td>
	<td colspan="3">${sdDto.addre }</td>
</tr>
</table>
<form action="muBasket.do" method="post" id="_frmPay" onsubmit="return checkSubmit('')">
		 	<input type="hidden" name="cmd" id="_cmd" value="bsk">
			<input type="hidden" name="pdseq" value="${ sdDto.stseq }">
			<%-- <input type="hidden" name="pdname" value="${ muDto.cname }"> --%>
			<input type="hidden" name="option1" id="_option1" value="${sdpdList[0].title}">
			<%-- <input type="hidden" name="total_price" id="_total_price" value="${mupdList[0].price}"> --%>
			<table class="type05" >
				<colgroup>
					<col width="20%"><col width="80%">
				</colgroup>
				<tr>
					<td>상품</td>
					<td>
						<select id="_optionSelect" onchange="setOptionPrice('')">
							<c:forEach items="${ sdpdlist }" var="sdpdDto" varStatus="i">
								<option value="${ sdpdDto.sdpdseq }">${ sdpdDto.title }</option>
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
						<input type="text" name="total_price" id="_total_price" value="${sdpdList[0].price}"
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

<!-- 스튜디오 정보 부분과 탭부분의 구분 -->
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<div class="container" align="center" style="width:100px">
	<c:if test="${ not empty login && login.auth == 'admin'}">
		<button onclick="mod()" class="w3-btn w3-white w3-border w3-border-red w3-round-large">수정</button>
		<button onclick="del()" class="w3-btn w3-white w3-border w3-border-red w3-round-large">삭제</button>
	</c:if>
</div>
<br><br><br>

<div class="w3-container" style="color: black;">
  <div class="w3-row">
    <a href="javascript:void(0)" onclick="openCity(event, 'picture');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
      	style="font-family: 'Hanna', Fantasy;">스튜디오 사진</div>
    </a>
    <a href="javascript:void(0)" onclick="openCity(event, 'sdpddetail');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
       	style="font-family: 'Hanna', Fantasy;">상품 정보</div>
    </a>
    <a href="javascript:void(0)" onclick="openCity(event, 'hugi');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
      	style="font-family: 'Hanna', Fantasy;">후기글</div>
    </a>
    <a href="javascript:void(0)" onclick="openCity(event, 'regervation');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
      	style="font-family: 'Hanna', Fantasy;">예약</div>
    </a>
  </div>

<!-- 스튜디오 사진 뷰 -->
<!-- 컨트롤러에서 사진파일들에 대한 리스트를 만들어 받아온다. -->
<div id="picture" class="w3-container city" style="display:inline">
<br><br><br>
 <div style="">
 
  <c:if test="${ not empty sdDto.video}">
	  <video poster="http://placehold.it/640x360" autoplay="autoplay" style="width:1300px; height:500px;" controls="controls">
	    <source src="upload/${sdDto.video}" type="video/mp4" />
	  </video>
	  <br><br><br><br><br><br>
  </c:if>
 
  <c:if test="${ not empty sdDto.pic0}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic0}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic1}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic1}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic2}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic2}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic3}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic3}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic4}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic4}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic5 || sdDto.pic5 ne ''}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic5}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic6}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic6}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic7}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic7}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic8}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic8}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
  <c:if test="${ not empty sdDto.pic9}">
  	<div style="padding-left:150px; width: 1300px; height:400px">
  		<img alt="" src="upload/${sdDto.pic9}" style="width: 1000px; height:400px">
  	</div>
  	<br><br><br>
  </c:if>
  
 </div>
</div>

<!-- 스튜디오 상품 뷰 -->
<div id="sdpddetail" class="w3-container city" style="display:none">
<br><br><br>
<div style="padding-left: 100px">
<table class="type11" style="width:85%; font-family: 'Hanna', serif;" >
	<colgroup>
	<col width="10"/><col width="100"/><col width="200"/><col width="50"/>
	</colgroup>
	<thead>
	<tr>
	<th>번호</th><th>상품명</th><th>내용</th><th>가격</th>
	</tr>
	</thead>
	
	<c:forEach var="sdpdDto" items="${sdpdlist}" varStatus="sdpdS">
	<tr class="_hover_tr">
		<td><%=a %></td>
		<td style="text-align: left">${sdpdDto.title }</td>
		<td style="text-align: left">${sdpdDto.content }</td>
		<td style="text-align: center">${sdpdDto.price}</td>
	</tr>
	<%a++; %>
	</c:forEach>
</table>
</div>
</div>

<!-- 스튜디오에 대한 후기 뷰 -->
<div id="hugi" class="w3-container city" style="display:none;">
	<!-- 후기글 -->
	<div style="padding-left: 100px">
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
			
			<c:forEach var="list" items="${dlist }" varStatus="i">
				<tr style="border-bottom: solid; border-bottom-color: lightgray">
					<td>${list.rdate.substring(0,10) }</td>
					<td>${list.content }</td>
					<td>${list.mid }</td>
				</tr>
			</c:forEach>
			
			</table>
			<br>
			 <form action="wstudioview.do">
				<input type="hidden" name="rpdseq" value="${sdDto.stseq}">
				<input type="hidden" name="pname" value="${sdDto.cname}">
				<input type="hidden" name="mid" value="${login.id }">
				<input type="hidden" name="title" value="${sdDto.cname}">
				
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
	
	<!-- 스튜디오에 대한 에약 달력 뷰 -->
	<div id="regervation" class="w3-container city" style="display:inline;">
		<div class="w3-container" style="padding-left:150px;padding-right:150px;font-family: 'Hanna', serif;">
			<div align="center">
				<div id='calendar' style="width:80%; height: 800px; margin-top:20px;" ></div>
			</div>
		</div>
	</div>

</div>

<!-- ★Modal -->
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
      		<form action="reservationDress.do" method="post" id="_frmPayModal" onsubmit="return checkSubmit('Modal')">
			 	<input type="hidden" value="${Ddto.dsseq }" name="pdseq" id="_pdseq">
				<input type="hidden" value="${login.id }" name="mid" id="_mid">
				<input type="hidden" value="${login.id }" name="usid" id="_mid">
	      	  
				<table class="type05" >
					<colgroup>
						<col width="20%"><col width="80%">
					</colgroup>
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
								<c:forEach var="i" begin="09" end="17">
									<option value="${i}:00~${i + 1}:00">${i}:00~${i + 1}:00</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
							<input type="submit" value="reservation" class="w3-btn w3-white w3-border w3-border-red w3-round-large">
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



<script>
$(document).ready(function () {
	$("#selectproduct").change(function () {
		var	sdpdseq = $("#selectproduct option:selected").val();
		var	sdseq = "${sdDto.stseq}";
		$.ajax({
			url:"productPrice.do",
			type:"get",
			data:"sdseq="+sdseq+"&sdpdseq="+sdpdseq,
			success:function(msg){
					$("#sprice").val(msg);	
					$("#_total_price").val(msg);
			},
			error:function(reqest, status, error){
				alert("실패");
			}
		});
	});
});
</script>

<script>
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

function del() {
	if (confirm("삭제 하시겠습니까?")) {
		location.href = "sdDel.do?stseq=" + ${sdDto.stseq};
	}
}

function mod() {
	location.href = "sdModView.do?stseq=" + ${sdDto.stseq};
}
</script>

<script>
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

//이부분 혜영이 한테 설명 듣기.
/* 
function list() {
	location.href = "muMainView.do";
} */

//옵션 값이 바뀌었을 때
function setOptionProduct(tail){
	var sproduct = $("#_optionSelect"+ tail +"option:selected").text();
	$("#_option1" + tail).val(sproduct);
	$("#_total_price" + tail).val($("#_optionSelect" + tail +" option:selected").val());
}
</script>

<script type="text/javascript">
function like(){
	var pdseq = ${sdDto.stseq};
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
			//alert("func date : " + date.format());
			//alert("rdate : " + rdate);
			//alert("date : " + oriDate.format());
			//alert("y : " + y);
			//alert("m : " + m);
			//alert("d : " + d);
			
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

<script>
//예약시 달력
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
		selectDate(date,'');
	}
});
$('img.ui-datepicker-trigger').attr('style','cursor:pointer;');

// datepicker 날짜 선택시 수행
function selectDate(date, tail) {
	//alert(date);
	var adata = {
			redate:date,
			pdseq:${sdDto.stseq}
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

<!-- 이미지 슬라이드 관련 스크립트 -->
<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
</script>