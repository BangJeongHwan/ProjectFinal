<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
LoginDto mem = (LoginDto)session.getAttribute("login");
if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>

<c:if test="${ not empty dflag && dflag eq 'DsSucc'}">
	<script type="text/javascript">
		alert("방문예약 승인중입니다..");
	</script>
</c:if>

<c:if test="${ not empty dflag && dflag eq 'DsFail'}">
	<script type="text/javascript">
		alert("개인고객만 예약가능합니다.");
	</script>
</c:if>

<!-- datepicker -->
<!--  // jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 

<!-- 이미지 스크롤을 위한  setting -->
<script type="text/javascript">
var picMaxSize = 0;
var picArr = new Array("", "", "", "", "", "", "", "", "", "");
</script>
<!-- picName setting  -->
<c:forEach items="${ Ddto.pic }" var="pic" varStatus="i">
	<c:if test="${ not empty Ddto.pic[i.index] && Ddto.pic[i.index] != '' }">
		<script type="text/javascript">
			picArr[picMaxSize] = "${Ddto.pic[i.index]}";
			picMaxSize++;
		</script>
	</c:if>
</c:forEach>

<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/hanna.css">

<style type="text/css">
.imgScroll td{
	width:92px;
	height:60px;
	align-content: center;
	text-align: center;
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

<div style="width: 1400px">
	<div class="w3-display-container" style="padding-left:120px; padding-top:30px;padding-right: 80px; width: 60%;  float: left;"><div class="text-center">
		<img src="upload/${Ddto.getPicture0()}" alt="" id="bigimg" style="height: 500px; width: 350px">
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
	<td colspan="3" style="font-size:50px">${Ddto.dname }</td>
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
	<td colspan="4">${Ddto.content }</td>
</tr>
<tr>
	<td>영업 시간</td>
	<td colspan="3">${Ddto.opentime }</td>
</tr>
<tr >
	<td>주소</td>
	<td colspan="3">${Ddto.addre }</td>
</tr>
</table>
<form action="reservationDress.do" method="post">
	<input type="hidden" value="${Ddto.dsseq }" name="pdseq" id="_pdseq">
	<input type="hidden" value="${login.id }" name="mid" id="_mid">
	<input type="hidden" value="${login.id }" name="usid" id="_mid">
	<table class="type05" >
		<colgroup>
		<col width="20%"><col width="80%">
		</colgroup>
		<tr>
			<td>예약날짜</td>
			<td><input type="text" id="_redate" name="redate" value=""></td>
		</tr>
		<tr>
			<td>예약시간</td>
			<td>
				<select style="text-align: center" class="retime" name="retime" id="_retime">
					<option value="09:00~10:00">09:00 ~ 10:00</option>
					<option value="10:00~11:00">10:00 ~ 11:00</option>
					<option value="11:00~12:00">11:00 ~ 12:00</option>
					<option value="12:00~13:00">12:00 ~ 13:00</option>
					<option value="14:00~15:00">14:00 ~ 15:00</option>
					<option value="15:00~16:00">15:00 ~ 16:00</option>
					<option value="16:00~17:00">16:00 ~ 17:00</option>
					<option value="17:00~18:00">17:00 ~ 18:00</option>
				</select>
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
				<button type="button" id="r_checkbtn" name="r_checkbtn" value="예약확인"><font color="black">예약확인</font></button>
			</td>
		</tr>
		<tr >
			<td>예약확인</td>
			<td><input type="text" style="border: 0; text-decoration: black" name="reser_check" id="reser_check" readonly="readonly" value="" size="30"></td>
		</tr>
		<tr>
			<td colspan="2">
			&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
			<input type="submit" value="reservation" class="w3-btn w3-white w3-border w3-border-red w3-round-large"
			onclick="muBasket()">
			</td>
		</tr>
		</table>
</form>
</div>
</div>
<!-- 드레스 정보 부분과 탭부분의 구분 -->
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

<div class="w3-container" style="color: black;" >
  <div class="w3-row" style="padding-left: 450px">
    <a href="javascript:void(0)" onclick="openCity(event, 'dressCalendar');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
       	style="font-family: 'Hanna', Fantasy;">달력
      </div>
    </a>
    <a href="javascript:void(0)" onclick="openCity(event, 'dressreview');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding"
      	style="font-family: 'Hanna', Fantasy;">후기글
      </div>
    </a>
  </div>
  	<div id="dressCalendar" class="w3-container city" style="display:inline">
  		<br><br><br>
  		달력 올 자리
  		<br><br><br>
  	</div>
  
	<!-- 후기글 -->
	<div id="dressreview" class="w3-container city" style="display:none">
	<br><br><br>
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
			 <form action="wdreview.do">
				<input type="hidden" name="rpdseq" value="${Ddto.dsseq}">
				<input type="hidden" name="pname" value="${Ddto.dname}">
				<input type="hidden" name="mid" value="${login.id }">
				<input type="hidden" name="title" value="${Ddto.dname}">
				
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

<!-- 이미지 스크롤 관련 -->  
<script type="text/javascript">
var picIndex = 0;
function imgScroll() {
	var tagStr = "<td style='width:50px;cursor:pointer' onclick='scrMoveLeft()'><font color='pink'>◀</font></td>";
	for(var i = (picIndex - 2); i <= (picIndex+2); i++) {
		if (i == picIndex) {
			tagStr += "<td style='border:4px solid #ef8bc5'>";
		} else {
			tagStr += "<td>";
		}
		if (i >= 0 && i < picMaxSize) {
			//var onclickStr = "func()";
			var onclickStr = "imgChange(" + i +")";
			tagStr += "<img src='upload/"+ picArr[i] +"' onclick='"+ onclickStr +"' style='width:85px;height:110px;cursor:pointer'>";
		}
		tagStr += "</td>";
	}
	tagStr += "<td style='width:50px;cursor:pointer' onclick='scrMoveRight()'><font color='pink'>▶</font></td>";
	
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

<script>
$("#r_checkbtn").click(function(){
	var c_option1 = $("#_redate").val();
	var c_option2 = $("select[name=retime] option:selected").val();

	$("#reser_check").val(c_option1 + "  " + c_option2 + "입니다.");
});


function del() {
	if (confirm("삭제 하시겠습니까?")) {
		location.href = "dressDelete.do?dsseq=" + ${Ddto.dsseq};
	}
}

function mod() {
	location.href = "dressUpdate.do?dsseq=" + ${Ddto.dsseq};
}

</script>

<script>
var startD = "";
var endD = "";

var year = "";
var month = "";
var day = "";
  $("#_redate").datepicker(   // inputbox 의 id 가 startDate 
          {dateFormat:'yy/mm/dd' // 만약 2011년 4월 29일 선택하면  inputbox 에 '2011/04/29' 로표시
           , showOn: 'button' // 클릭으로 우측에 달력 icon 을 보인다.
           , buttonImage: 'assets/images/calen.png'  // 우측 달력 icon 의 이미지 패스 
           , buttonImageOnly: true //  inputbox 뒤에 달력icon만 표시한다. ('...' 표시생략)
           , changeMonth: true // 월선택 select box 표시 (기본은 false)
           , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
           , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
           , minDate : 0         // 오늘부터 시작
           , onSelect: function(date){
         		selectDate(date);
           }
     });
  
  $('img.ui-datepicker-trigger').attr('style','cursor:pointer;');

//datepicker 날짜 선택시 수행
  function selectDate(date) {
  	//alert(date);
  	var adata = {
  			redate:date,
  			pdseq:${Ddto.dsseq}
  	};
  	
  	$.ajax({
			url:"getDSReservListByPdseqRedate.do",
			type:"get",
			data:adata,
			success:function(msg){
				
					$("#_retime").empty();
					$("#_retime").append("<option value='09:00~10:00'>09:00 ~ 10:00</option>");
					$("#_retime").append("<option value='10:00~11:00'>10:00 ~ 11:00</option>");
					$("#_retime").append("<option value='11:00~12:00'>11:00 ~ 12:00</option>");
					$("#_retime").append("<option value='12:00~13:00'>12:00 ~ 13:00</option>");
					$("#_retime").append("<option value='14:00~15:00'>14:00 ~ 15:00</option>");
					$("#_retime").append("<option value='15:00~16:00'>15:00 ~ 16:00</option>");
					$("#_retime").append("<option value='16:00~17:00'>16:00 ~ 17:00</option>");
					$("#_retime").append("<option value='17:00~18:00'>17:00 ~ 18:00</option>");
					
					//예약된 시간 삭제
					for(var i = 0; i < msg.reservListDS.length; i++){
	  				var retime = msg.reservListDS[i].retime;
	  				var optionId = "#_retime option[value='" + retime +"']";
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
	var pdseq = ${Ddto.dsseq};
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
