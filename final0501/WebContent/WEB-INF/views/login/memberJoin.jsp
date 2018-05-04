<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
Calendar cal = Calendar.getInstance();
// cal.set(year, month - 1, day);		// 오늘날짜로 지정함
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<style type="text/css">
table {
	border: 1px solid #EBEBEB;
	align-content: center;
	width: 800px;
	height: 1000px;
}
td font{
	font-size:12px;color:#008BDC;margin:8px 0 0 8px;letter-spacing:-0.5px;
}
tr{
padding:  20px 20px;
}
td{
	 background-color:#F8F8F8;
	 align-content: center;
}
td:nth-child(even) {
    background-color:white;
}
</style>
</head>
<body>
<div>
			<div align="center">
			<br><br><br>
				<div align="center" style="width:100%">
					<h1>회원가입</h1>
					<hr><br>
					<p align="right"><img src="assets/images/others/regiimg.png">필수입력사항<p><br><br>
										
					<form action="memberJoin.do" method="post" onsubmit="return checkSubmit()">
						<input type="hidden" name="auth" value="member">
						<table border="1px">
						<col width="30%"><col width="70%">
						<tr>
							<td><img src="assets/images/others/regiimg.png">아이디</td>
							 <td>
								<input type="text" name="mid" id="_mid" alt="아이디를">
								<font id="_checkIdP"> ※ 4자 이상, 12자 이하 영문 및 숫자</font>
							</td>
						</tr>
						
						<tr>
							<td><img src="assets/images/others/regiimg.png">비밀번호</td>
							<td>
								<input type="password" name="pwd" id="_pwd">
								<font id="_checkPwd1">※ 영문, 숫자 조합으로 4~12자 이내로 사용하실 수 있습니다.</font>
							</td>
						</tr>
						<tr>
							<td><img src="assets/images/others/regiimg.png">비밀번호 확인</td>
							<td>
								<input type="password" id="_pwdck">
								<font id="_checkPwd2">※ 비밀번호를 한 번 더 입력하여 주십시오.</font>
							</td>
						</tr>
						
						<tr>
							<td><img src="assets/images/others/regiimg.png">이름</td>
							<td>
								<input type="text" name="mname" id="_mname">
						<font>※ 본명을 입력해주세요.</font></td>
						</tr>
						<tr>
							<td ><img src="assets/images/others/regiimg.png">이메일</td>
							<td>
								<input type="hidden" name="email" id="_email">
								<input type="text" id="_email1">@
								<!-- <input type="text" id="_email2"> ★-->
								<select id="_email2">
									<option selected>naver.com</option>
									<option selected>daum.net</option>
									<option selected>gmail.com</option>
								</select>
								<font id="_checkEmailDiv"><!-- ※이메일을 입력해주세요 --></font>
							</td>
						</tr>
						<tr>
							<td><img src="assets/images/others/regiimg.png">핸드폰</td>
							<td>
								<input type="hidden" name="phone" id="_phone">
								<select id="_phone1">
									<option value="010">010
									<option value="011">011
									<option value="016">016
									<option value="017">017
									<option value="018">018
									<option value="019">019
								</select>-
								<!-- ★ -->
								<input type="text" id="_phone2" size="4" style="ime-mode:disabled;" onkeydown="return onlyNumber(event)">-
								<input type="text" id="_phone3" size="4" style="ime-mode:disabled;" onkeydown="return onlyNumber(event)">
							</td>
						</tr>
						<tr>
							<td><img src="assets/images/others/regiimg.png">주소</td>
							<td>
								<input type="hidden" name="address" id="_address">
								<input type="text" id="_addr1" size="30" readonly="readonly">
								<button type="button" id="addrbtn" onclick="DaumPostcode()">주소찾기</button><br>
								<input type="text" id="_addr2" size="30">
							</td>
						</tr>
						<tr>
							<td><img src="assets/images/others/regiimg.png">성별</td>
							<td>
								<input type="radio" name="sex" value="f" checked> 여성&nbsp;&nbsp;&nbsp;
								<input type="radio" name="sex" value="m"> 남성
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>
								<input type="checkbox" id="_check1"> (필수) 회원 약관에 동의합니다.<br> 
								<input type="checkbox" id="_check2"> (필수) 개인정보 처리방침에 동의합니다.<br> 
								<input type="checkbox" id="_check3"> (필수) 개인정보의 제3자 이용에 동의합니다.<br> 
								<input type="checkbox" id="_checkAll"> 상기의 모든 내용에 동의합니다.<br> 
							</td>
						</tr>
						<tr>
						
						<td colspan="2" align="center">
							<button style="border-style: none; background: none;"><img alt="회원가입" src="assets/images/others/regi.jpg"></button>
						</td>
							<!--<td colspan="2" align="center"><input type="submit" value="회원가입"></td> -->
						</tr>
						</table>
					</form>
					
				</div>
			</div>
			
		</div>
		
	<br><br><br><br><br><br><br><br><br>	
	
	<!--  
	http://www.iamport.kr/getstarted
	https://github.com/iamport/iamport-manual
	https://docs.iamport.kr/tech/mobile-authentication
	
		가맹점 식별코드 : imp53891671
		
		REST API 키 : 7917099127951767
		
		REST API secret :	J2A4lUN7UUQ0SOb8w7JEQoqnIfjRS10B3AGpvuwpomphbBqHIamzyMXh2g8Ui9wlKcLgGhF5E5mPHNxq
			<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script><!--인증 apk  -->
		
	-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script><!--인증 apk  -->
	
<script type="text/javascript">
// 숫자만 입력가능한 text field ★
function onlyNumber(event) {

    var key = window.event ? event.keyCode : event.which;    

    if ((event.shiftKey == false) && ((key  > 47 && key  < 58) || (key  > 95 && key  < 106)
    || key  == 35 || key  == 36 || key  == 37 || key  == 39  // 방향키 좌우,home,end  
    || key  == 8  || key  == 46 ) // del, back space
    ) {
        return true;
    }else {
        return false;
    }    
};

var pwdFlag1 = false;
var pwdFlag2 = false;
var idFlag = false;
var emailFalg = true;
var phoneFlag = false;

function checkSubmit() {
	var flag = false;
	
	// 휴대폰 번호
	var phone1 = $("#_phone1 option:selected").val();
	var phone2 =  $("#_phone2").val();
	var phone3 =  $("#_phone3").val();
	if(phone2.trim() == "" || phone2.length < 3 || phone2.length > 4 || !isNum(phone2)){
		alert("정확한 핸드폰 번호를 입력해주세요.");
		return false;
	} else if (phone3.trim() == "" || phone3.length != 4 || !isNum(phone3)) {
		alert("정확한 핸드폰 번호를 입력해주세요.");
		return false;
	} else {
		$("#_phone").val(phone1 + "-" + phone2 + "-" + phone3);
	}
	
	// 주소
	var addr1 = $("#_addr1").val();
	var addr2 = $("#_addr2").val();
	if (addr2.trim() == "" || addr1.trim() == "") {
		alert("주소를 입력해주세요.");
		return false;
	}
	$("#_address").val(addr1 + " " + addr2);
	
	// 공백체크
	 if (!idFlag) {
		alert("아이디를 확인해주세요.");
	} else if (!(pwdFlag1 && pwdFlag2)) {
		alert("비밀번호를 확인해주세요.");
	} else if (!emailFalg) {
		alert("이메일 주소를 확인해주세요.");
	} else if ($("#_mname").val().trim() == "") {
		alert("이름을 입력해주세요.");
	} else if (!$("#_check1").is(":checked") || !$("#_check2").is(":checked") || !$("#_check3").is(":checked")) {
		alert("약관에 동의해주세요.");
	}
	else {
		flag = true;
	}

	return flag;
}

 

$(document).ready(function () {
	// 아이디 중복 확인
	$("#_mid").blur(function () {
		$.ajax({
			url:"checkId.do",
			type:"get",
			data:"id=" + $("#_mid").val(),
			success:function(msg){
				if ($("#_mid").val().length < 4 || $("#_mid").val().length > 12 || !isEngNum($("#_mid").val())) {
					$("#_checkIdP").html("아이디는 4자 이상 12자 이하 영문 및 숫자로 구성되어야 합니다.");
					$("#_checkIdP").css("color","#ff0000");
					idFlag = false;
				} else {
					CheckMessage(msg);
				}
			},
			error:function(reqest, status, error){
				alert("실패");
			}
		});
	});
	
	$("#_email1").blur(function () {
		emailCheck();
	});
	
	$("#_email2").change(function () {
		emailCheck();
	});

	var pwd1;
	$("#_pwd").blur(function () {
		pwd1 = $(this).val();
		len = pwd1.length;
		if(len<4){
			$("#_checkPwd1").html("4자리 이상 입력해주세요.");
			$("#_checkPwd1").css("color","red");
			pwdFlag1 = false;
		}else if(len>12){
			$("#_checkPwd1").html("12자리 이하로 입력해주세요.");
			$("#_checkPwd1").css("color","red");
			pwdFlag1 = false;
		}else{
			$("#_checkPwd1").text("사용가능합니다.");
	         $("#_checkPwd1").css("color","#0000ff");
			pwdFlag1 = true;
		}
	});
	$("#_pwdck").blur(function () {
		pwd1 = $("#_pwd").val();
		pwd2 = $(this).val();
		if(pwd1 != pwd2){
			$("#_checkPwd2").html("비밀번호가 일치하지 않습니다.");
			$("#_checkPwd2").css("color","#ff0000");
			pwdFlag2 = false;
		}else{
			$("#_checkPwd2").html("비밀번호가 일치합니다.");
	        $("#_checkPwd2").css("color","#0000ff");
			pwdFlag2 = true;
		}
	});
	
	// 모든 약관 동의
	$("#_checkAll").click(function () {
		if($("#_checkAll").is(":checked")) {
			$("#_check1").prop("checked", "checked");
			$("#_check2").prop("checked", "checked");
			$("#_check3").prop("checked", "checked");
		} else {
			$("#_check1").removeProp("checked");
			$("#_check2").removeProp("checked");
			$("#_check3").removeProp("checked");
		}
	});
});



function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('_addr1').value = fullRoadAddr;
            document.getElementById('_addr1').value = data.jibunAddress;
          
        }
    }).open();
}

//이메일 체크 ★
function emailCheck() {
	// 이메일 조합
	var email1 = $("#_email1").val();
	var email2 = $("#_email2 option:selected").val();
	if (email1.trim() != "") {
		$("#_email").val(email1 + "@" + email2);
	} else {
		$("#_email").val("");
	}
	
	if ($("#_email1").val() == "") {
		$("#_checkEmailDiv").html("");
        //$("#_checkEmailDiv").css("color","#ff0000");
        return;
	}
	if (!isEngNum($("#_email1").val())) {
		 $("#_checkEmailDiv").html("이메일 양식에 맞지 않습니다.");
         $("#_checkEmailDiv").css("color","#ff0000");
         emailFlag = false;
         return;
	}
	
	// 이메일 중복 확인(없어도 되지만 겹치는 건 안 됨 : unique)
	$.ajax({
		url:"checkEmail.do",
		type:"get",
		data:"email=" + $("#_email").val(),
		success:function(msg){
			/* if($("#_email1").val() == ""){
	            $("#_checkEmailDiv").html("이메일을 입력해주세요");
	            $("#_checkEmailDiv").css("color","#ff0000");
	            //emailFlag = false;
	         } else if(!isEngNum($("#_email1").val())){
	            $("#_checkEmailDiv").html("이메일 양식에 맞지 않습니다.");
	            $("#_checkEmailDiv").css("color","#ff0000");
	            emailFlag = false;
	         } else{
	            CheckMessage(msg);
	         } */
	         CheckMessage(msg);
		},
		error:function(reqest, status, error){
			alert("실패");
		}
	});
}

//메시지를 뿌려주는 부분
function CheckMessage(msg) {
	if(msg.type=="id"){
		if(msg.message=="true"){
			/* div태그에 접근할 때 html방식으로 접근 */
			$("#_checkIdP").text("사용할 수 없는 아이디입니다.");
			$("#_checkIdP").css("color","#ff0000");
			$("#_cid").focus();
			idFlag = false;
		}else{
			$("#_checkIdP").text("사용할 수 있는 아이디입니다.");
			$("#_checkIdP").css("color","#0000ff");
			idFlag = true;
		}
	}
	if(msg.type=="email"){
		if(msg.message=="true"){
			/* div태그에 접근할 때 html방식으로 접근 */
			$("#_checkEmailDiv").html("사용중인 이메일 주소입니다.");
			$("#_checkEmailDiv").css("color","#ff0000");
			//$("#_email1").val("");
			//$("#_email1").css("background-color", "#c1ecf2");
			emailFlag = false;
		}else{
			var email = $("#_email1").val()+"@"+$("#_email2 option:selected").text();
			//alert("------------> email : "+email);
			$("#_checkEmailDiv").html("사용할 수 있는 이메일입니다.");
			$("#_checkEmailDiv").css("color","#0000ff");
			//$("#_email1").css("background-color", "#ffffff");
			$("#_email").val(email);
			emailFlag = true;
		}
	}
}

//영문 또는 숫자이면 true, 아니면 false
function isEngNum(str) {
	/* for( var i = 0; i <= str.length -1 ; i++ ) {
		if (str.charAt(i) >= 'a' && str.charAt(i) <= 'z') 
		else if (str.charAt(i) >= '0' && str.charAt(i) <= '9') 
		else return false;
	}
	return true; */
	for( var i = 0; i <= str.length -1 ; i++ ) {
		if (!(str.charAt(i) >= 'a' && str.charAt(i) <= 'z')&&!(str.charAt(i) >= '0' && str.charAt(i) <= '9'))return false; 
		else return true;  
	}
}


//숫자이면 true
function isNum(str) {
	for( var i = 0; i <= str.length -1 ; i++ ) {
		if (str.charAt(i) >= '0' && str.charAt(i) <= '9') {
		} else {
			return false;
		}
	}
	return true;
}


/* $("#_conf").click(function () {
	var phone1 = $("#_phone1 option:selected").val();
	var phone2 =  $("#_phone2").val();
	var phone3 =  $("#_phone3").val();
	if(phone2.trim() == "" || phone2.length < 3 || phone2.lngth > 4 || !isNum(phone2)){
		alert("정확한 핸드폰 번호를 입력해주세요.");
		return false;
	} else if (phone3.trim() == "" || phone3.length != 4 || !isNum(phone3)) {
		alert("정확한 핸드폰 번호를 입력해주세요.");
		return false;
	} else {
		$("#_phone").val(phone1 + "-" + phone2 + "-" + phone3);
		var phone = $("#_phone").val(); 
		
		var IMP = window.IMP; // 핸드폰 번호 인증
		IMP.init("imp53891671"); //api키
		console.log(IMP);
		
		IMP.certification({ // param
		    merchant_uid: phone 
		}, function (rsp) { // callback
		    if (rsp.success) {
		    	alert("성공");
		    } else {
		    	alert("실패");
		    }
		});
		
		
	}
	
	
	
}); */

</script>

</body>
</html>