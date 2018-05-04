<%@page import="kh.com.a.model2.LoginDto"%>
<%@page import="java.util.List"%>
<%@page import="kh.com.a.model.MakeupDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<%
LoginDto mem = (LoginDto)session.getAttribute("login");
if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>

<style type="text/css">
.imgScroll td{
	width:92px;
	height:60px;
	align-content: center;
	text-align: center;
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

<div class="container">
	<h2 class="nino-sectionHeading">
	<span class="nino-subHeading">makeup</span>
		${muDto.cname}
	</h2>
	<p class="nino-sectionDesc">
		${ muDto.content }	
	</p>
	<div class="sectionContent">
		<div class="row">
			<div class="col-md-6">
				<div class="text-center">
					<c:if test="${ empty muDto.pic1 || muDto.pic1 eq ''}">
						<img src="assets/images/wedding/63img1_b.jpg" alt="" id="bigimg" style="width:551px;height: 367px;">
					</c:if>
					<c:if test="${ not empty muDto.pic1 && muDto.pic1 ne ''}">
						<img src="upload/${ muDto.pic1 }" alt="" id="bigimg" style="width:551px;height: 367px;"/>
					</c:if>
					</div>
			</div>
			<div class="col-md-6">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									<i class="mdi mdi-chevron-up nino-icon arrow"></i>
									<i class="mdi mdi-camera nino-icon"></i> 
									상세정보 
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<c:if test="${jjdto == 'false' }">
									<img src="images/likebefore.png" id="likedetail" name="likedetail" onClick="like()" style="width: 60px;">
								</c:if>
								<c:if test="${jjdto == 'true' }">
									<img src="images/heart.gif" id="likedetail" name="likedetail" onClick="like()" style="width: 60px;">
								</c:if><br>
								<font color="black">
								${ muDto.cname }<br>
								주소 : ${ muDto.address }<br>
								오픈시간 : ${ muDto.opentime }<br>
								마감시간 : ${ muDto.closetime }<br>
								</font>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									<i class="mdi mdi-chevron-up nino-icon arrow"></i>
									<i class="mdi mdi-owl nino-icon"></i> 
									결제 및 예약
								</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body" style="font-style: normal" align="center">
								 <form action="muBasket.do" method="post" id="_frmPay" onsubmit="return checkSubmit()">
								 	<input type="hidden" name="cmd" id="_cmd" value="bsk">
									<input type="hidden" name="pdseq" value="${ muDto.museq }">
									<%-- <input type="hidden" name="pdname" value="${ muDto.cname }"> --%>
									<input type="hidden" name="option1" id="_option1" value="${mupdList[0].title}">
									<input type="hidden" name="total_price" id="_total_price" value="${mupdList[0].price}">
									<font style="text-align: center" color="black">날짜 선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시간 선택&nbsp;&nbsp;&nbsp;&nbsp;<br></font>
									<input type="text" id="_redate" name="redate" size="10" style="border: none; cursor:default" value="" readonly>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<select name="retime" id="_retime">
										<c:forEach var="i" begin="${openHour}" end="${closeHour - 1}">
											<option value="${i}:${openMin}~${i + 1}:${openMin}">${i}:${openMin}~${i + 1}:${openMin}</option>
										</c:forEach>
									</select><br><br>
									<font style="text-align: center" color="black">옵션 선택&nbsp;&nbsp;</font>
									<select id="_optionSelect" onchange="setOptionPrice()">
										<c:forEach items="${ mupdList }" var="mupd" varStatus="i">
											<option value="${ i.index }">${ mupd.title }-${ mupd.price }</option>
										</c:forEach>
									</select><br><br>
									<button type="button" onclick="muPaymentView()">결제</button>&nbsp;&nbsp;
									<button type="button" onclick="muBasket()">장바구니</button>
								</form>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									<i class="mdi mdi-chevron-up nino-icon arrow"></i>
									<i class="mdi mdi-laptop-mac nino-icon"></i> 
									후기
								</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body">
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS. Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div style="height: 3px"></div>
<div class="container">
	<table>
		<tr id="_sPicTr" class="imgScroll"></tr>
	</table>
</div>

<br><br>
<div class="container" align="center">
	<button onclick="list()">목록</button>
	<c:if test="${ not empty login && login.auth == 'admin'}">
		<button onclick="mod()">수정</button>
		<button onclick="del()">삭제</button>
	</c:if>
</div>


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

function checkSubmit() {
	
	if ($("#_redate").val().trim() == "") {
		alert("날짜를 선택해주세요.");
		return false;
	}
	
	return true;
}

function muBasket() {
	$("#_cmd").val("bsk");
	$("#_frmPay").attr({ "target":"_self", "action":"muBasket.do" }).submit();
}

function muPaymentView() {
	$("#_cmd").val("pay");
	$("#_frmPay").attr({ "target":"_self", "action":"muBasket.do" }).submit();
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
function setOptionPrice() {
	var mupdStr = $("#_optionSelect option:selected").text();
	var splitStr = mupdStr.split("-");
	$("#_option1").val(splitStr[0]);
	$("#_total_price").val(parseInt(splitStr[1]));
//	var i = parseInt($("#_optionSelect").val());
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
		selectDate(date);
	}
});
$('img.ui-datepicker-trigger').attr('style','cursor:pointer;');

// datepicker 날짜 선택시 수행
function selectDate(date) {
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

			$("#_retime").empty();
			for (var i = ${openHour}; i < ${closeHour - 1}; i++) {
				var retimeStr = i + ":" + ${openMin} + "~" + (i + 1) + ":" + ${openMin};
				var tagStr = "<option value="+ retimeStr +">" + retimeStr + "</option>";
				$("#_retime").append(tagStr);
			}
			
			// 예약된 시간 삭제
			for(var i = 0; i < msg.reservList.length; i++) {
				var retime = msg.reservList[i].retime;
				var optionId = "#_retime option[value='" + retime + "']";
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
     
    

