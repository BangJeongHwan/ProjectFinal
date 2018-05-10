<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<style type="text/css">

table {
	border: 1px solid #EBEBEB;
	align-content: center;
	/* height: 1000px; */
}
tr{
	height: 60px;
	padding:  10px 10px;
}
td{
	 background-color:#F8F8F8;
}
th{
	 background-color:#F8F8F8;
	text-align:center;
}
td:nth-child(even) {
    background-color:white;
}
</style>

<div class="container">
	
	<h4>개인정보</h4>
	<table style="width:100%;">
		<colgroup>
			<col width="10%"><col width="30%">
		</colgroup>
		<tr>
			<th>이름</th>
			<td>	
				<input type="text" name="name" id="_name" size="20" value="${login.name }" readonly>
			</td>
		</tr>
		<tr>
			<th>휴대폰</th>
			<td>
				<input type="hidden" name="phone" id="_phone" value="${login.phone}">
				<!-- 
				<select id="_phone1" name="phone1" style="width: 25%">
					<option value="010" selected>010
					<option value="011">011
					<option value="016">016
					<option value="017">017
					<option value="018">018
					<option value="019">019
				</select>-
				 -->
				<input type="text" id="_phone1" size="7" readonly>-
				<input type="text" id="_phone2" size="7" readonly>-
				<input type="text" id="_phone3" size="7" readonly>
			</td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td>
				<input type="hidden" name="email" id="_email" value="${login.email}">
				<input type="text" id="_email1" size="10" readonly>@
				<input type="text" id="_email2" size="10" readonly>
				<!-- 
				<select id="_emailsel" name="emailsel">
					<option>선택해주세요</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
					<option value="dir">직접입력</option>
				</select>
				 -->
			</td>
		</tr>
	</table>
	<br><br>
	<h4>상담정보</h4>
	<form action="#" method="post" name="resv" id="_resv">
		<input type="hidden" value="${login.id }" name="mid">
		<input type="hidden" value="${wd.whseq }" name="pdseq">
		<table style="width:100%;">
			<colgroup>
				<col width="10%"><col width="30%">
			</colgroup>
			<tr>
				<th>홀이름</th>
				<td>	
					<input type="text" name="name" id="_name" size="20" value="${wd.cname }" readonly>
				</td>
			</tr>
			<tr>
				<th>희망홀</th>
				<td>
					
					<select id="_hallname" name="content" style="width: 50%" onchange="hallchange()">
						<c:if test="${not empty hallList}">
							<c:forEach items="${hallList }" var="list">
								<option value="${list.hallname}">${list.hallname}
							</c:forEach>
						</c:if>
						<c:if test="${empty hallList}">
							<option value="홀없음">홀 없음
						</c:if>
					</select>
				</td>
			</tr>
			
			<tr>
				<th>예약일</th>
				<td>
					<input type="text" id="_redate" name="redate" size="10" style="border: none; cursor:default" value="${rdate}" readonly>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="retime" id="_retime">
						
					</select>
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<h4>상담정보</h4>
	<textarea rows="5" cols="55" name="transpo" id="_transpo">
''는 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.

회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.

회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

■ 수집하는 개인정보 항목

회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.

ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 회사전화번호 , 결혼여부 , 기념일 , 
신용카드 정보 , 은행계좌 정보 , 서비스 이용기록 , 접속 로그 , 쿠키 , 접속 IP 정보 , 결제기록
ο 개인정보 수집방법 : 홈페이지(회원가입,상담신청,공개게시판,견적요청 등) , 서면양식 , 전화/팩스를 통한 회원가입 , 경품 행사 응모 , 제휴사로부터의 제공 

■ 개인정보의 수집 및 이용목적 외 이용

회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스 , 요금추심

ο 회원 관리
회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 , 불만처리 등 민원처리 , 고지사항 전달

ο 마케팅 및 광고에 활용
신규 서비스(제품) 개발 및 특화 , 이벤트 등 광고성 정보 전달 , 인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계

ο 기타
사후DM

■ 개인정보의 보유 및 이용기간

원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 
단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.

보존 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 회사전화번호 , 결혼여부 , 기념일 , 신용카드 정보 , 은행계좌 정보 , 접속 IP 정보 , 결제기록

보존 근거 : 이용자가 아이웨딩의 회원으로서 아이웨딩이 제공하는 서비스를 이용하는 동안 아이웨딩은 이용자들의 개인정보를 계속적으로 보유하며 서비스 제공 등을 위해 이용합니다. 다만, 아래의 "이용자 자신의 개인 정보 관리(열람,정정,삭제 등)에 관한 사항"에서 설명한 절차와 방법에 따라 회원 본인이 직접 삭제하거나 수정한 정보, 가입해지를 요청한 경우에는 재생할 수 없는 방법에 의하여 디스크에서 완전히 삭제하며 추후 열람이나 이용이 불가능한 상태로 처리됩니다. 또한 최근 6개월 내에 아이웨딩을 한번도 이용하지 않은 ID에 대해 홈페이지에서 ID 정리 해당 요건 및 정리 기간, ID 폐기에 대해 일괄 공지한 후 적절한 절차를 거쳐 아이웨딩 사용 의사가 없는 것으로 판단되는 이용자에 한해서는, 개인정보 보호를 위해 해당 ID의 개인정보를 삭제할 수 있습니다. 

보존 기간 : 회원 본인의 가입해지, 개인정보 삭제 등 요청 또는 직접적인 탈퇴 행위 이전까지 계속 보존

■ 이용자의 권리와 그 행사방법

ο이용자는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며, 회사의 개인정보의 처리에 동의하지 않는 경우 동의를 거부하거나 가입해지(회원탈퇴)를 요청하실 수 있습니다. 다만, 그러한 경우 서비스의 일부 또는 전부 이용이 어려울 수 있습니다.

ο이용자의 개인정보 조회, 수정을 위해서는 '개인정보변경'(또는 '회원정보수정' 등)을, 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.

ο혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다.

ο이용자가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3 자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다.

ο회사는 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 "개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.

■ 개인정보 자동 수집 장치의 설치/운영 및 거부에 관한 사항

ο쿠키
회사는 개인화되고 맞춤화된 서비스를 제공하기 위해서 이용자의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다.
쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에게 보내는 아주 작은 텍스트 파일로 이용자 컴퓨터의 하드디스크에 저장됩니다. 이후 이용자가 웹 사이트에 방문할 경우 웹 사이트 서버는 이용자의 하드 디스크에 저장되어 있는 쿠키의 내용을 읽어 이용자의 환경설정을 유지하고 맞춤화된 서비스를 제공하기 위해 이용됩니다.
쿠키는 개인을 식별하는 정보를 자동적/능동적으로 수집하지 않으며, 이용자는 언제든지 이러한 쿠키의 저장을 거부하거나 삭제할 수 있습니다.

ο회사의 쿠키 사용 목적
이용자들이 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 정렬조건, 로그인 여부 등을 파악하여 이용자에게 최적화된 맞춤형 정보를 제공하기 위해 사용합니다.

ο쿠키의 설치/운영 및 거부
이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 이용자는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.
다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 서비스는 이용에 어려움이 있을 수 있습니다.
쿠키 설치 허용 여부를 지정하는 방법(Internet Explorer의 경우)은 다음과 같습니다.

① [도구] 메뉴에서 [인터넷 옵션]을 선택합니다.
② [개인정보 탭]을 클릭합니다.
③ [개인정보취급 수준]을 설정하시면 됩니다.

■ 개인정보관리책임자 및 담당자의 연락처

귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다.
회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.
	</textarea>
	
	<br><input type="checkbox" id="_checkB">개인정보 수집에 동의합니다.
	<br><br>
	<div align="center">
		<c:if test="${login.auth eq 'member'}">
			<img alt="전송" src="assets/images/others/order.jpg" onclick="ordersummit()" style="cursor:pointer;">&nbsp;&nbsp;
		</c:if>
		<button onclick="closer()">닫기</button>
	</div>
</div>

<script type="text/javascript">

// 초기화
var phone = $("#_phone").val();
var email = $("#_email").val();

if(phone!=''){	
	var phoneNum = phone.split("-");	
	var phone1 = phoneNum[0];
	var phone2 = phoneNum[1];
	var phone3 = phoneNum[2];
	/* 
	var search = "select[name='phone1'] option[value='"+phone1+"']";
	$(search).attr("selected","selected");
	 */
	$("#_phone1").val(phone1);
	$("#_phone2").val(phone2);
	$("#_phone3").val(phone3);
	
}

if(email!=''){
	var emailStr = email.split("@");
	var email1 = emailStr[0];
	var email2 = emailStr[1];
	$("#_email1").val(email1);
	$("#_email2").val(email2);
	/* 
	var search = "select[name='emailsel'] option[value='"+email2+"']";
	$(search).attr("selected","selected");
	$("#_email1").val(email1);
	$("#_email2").val($("#_emailsel").val());
	 */
}

//예약시 달력
var startD = "";
var endD = "";

var year = "";
var month = "";
var day = "";
$("#_redate").datepicker(   // inputbox 의 id 가 startDate 
	{dateFormat:'yy/mm/dd' // 만약 2011년 4월 29일 선택하면  inputbox 에 '2011-04-29' 로표시
	, showOn: 'button' // 클릭으로 우측에 달력 icon 을 보인다.
	, buttonImage: 'assets/images/selectCal.jpg'  // 우측 달력 icon 의 이미지 패스 
	, buttonImageOnly: true //  inputbox 뒤에 달력icon만 표시한다. ('...' 표시생략)
	, changeMonth: true // 월선택 select box 표시 (기본은 false)
	, changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	, showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	, minDate : 0         // 오늘부터 시작
	, onSelect: function (date) {
		hallinfo(date);
	}
});
$('img.ui-datepicker-trigger').attr('style','cursor:pointer;');

//초기값
var date = $("#_redate").val();
//alert(date);
hallinfo(date);

// 홀 변경시
function hallchange(){
	hallinfo($("#_redate").val());
}

function hallinfo(date){
	var hallname = $("#_hallname option:selected").val();
	//alert(hallname);
	var data = {
			hallname:hallname,
			whseq:${wd.whseq}
	};
	$.ajax({
		url:"hallInfo.do",
		type:"get",
		data:data,
		success:function(msg){
			if(msg.hall!='홀없음'){
				schedule(msg.hall, date);
			}else{
				alert("홀 정보가 없습니다.");
				return;
			}
		},
		error:function(r,s,e){
			alert("실패1");
		}
	});
}

var time = new Array(); // 시간처리
var hour = new Array();	// 시
var min = new Array();	// 분

function schedule(hall, rdate){
	//alert(hall.opentime);2018/08/06
	//alert(rdate.substring(2,10));
	rdate = rdate.substring(2,10);
	var data = {
			redate:rdate,
			pdseq:${wd.whseq},
			content:hall.hallname
	};
	$.ajax({
		url:"getWDResvListByPdseqRedate.do",
		type:"get",
		data:data,
		success:function(msg){
			$("#_retime").empty();
			// 시간 처리
			var open = Number(hall.opentime);
			var close = Number(hall.closetime);
			var stepArr = hall.wstep.split('분');
			var step = Number(stepArr[0]);
			 
			timePro(open, close, step);	// 시간 처리			

			// 기존 시간 출력
			for (var i=0;i<hour.length; i++) {
				if(hour[i+1]!=null && min[i+1]!=null){
					var retimeStr = hour[i] + ":" + min[i] + "~" + hour[i+1] + ":" + min[i+1];
					var tagStr = "<option value="+ retimeStr +">" + retimeStr + "</option>";
					$("#_retime").append(tagStr);
				}
			}
			
			
			// 예약된 시간 삭제
			if(msg.WdResvList != null){
				for(var i = 0; i < msg.WdResvList.length; i++) {
					var retime = msg.WdResvList[i].retime;
					var optionId = "#_retime option[value='" + retime + "']";
					$(optionId).remove();
				}
			}
		},
		error:function(r,s,e){
			alert("실패2");
		}
	});
}

function calTime(count,open,close,step){
	for (var i = open; i < close; i++) {
		time[count] = time[count-1] + step;	
		
		if(time[count]>(close*60)){
			return;
		}
		count++;
	} 
}
function timePro(open,close,step){
	
	time[0] = open*60;
	var count = 1;
	calTime(count,open,close,step);
	
	for(var i=0;i<time.length;i++){
		hour[i] = parseInt(time[i]/60);
		min[i] = time[i]%60;
		if((""+hour[i]).length==1){
			hour[i] = "0"+hour[i];
		}
		if((""+min[i]).length==1){
			min[i]="0"+min[i];
		}
	}
}

// 예약 버튼
function ordersummit(){
	
 	// form 값 보내주기
	if(!$("#_checkB").is(":checked")){
		alert("개인정보 수집에 동의에 체크해주세요!");
	}else{
	 	document.resv.action = 'reservationWd.do';	// controller
	 	document.resv.target = 'parentview';	// 부모에 window.name 지정
	 	document.resv.submit();
	 	
		$("#mask",opener.document).hide();	// 부모
		self.close();	// 자식 처리
	}
}

// 닫기 동작
function closer(){
	$("#mask",opener.document).hide();
	this.close();
}

</script>










