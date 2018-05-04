<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:requestEncoding value="utf-8"/>  
 
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
<div class="container">
   <h2 class="nino-sectionHeading">
      <span class="nino-subHeading">For you, with us</span>
         기업 회원가입
   </h2>
   
   <p class="nino-sectionDesc">
      회원 가입을 하시면 For you, with us 서비스를 편리하게 이용 하실 수 있습니다.
   </p>   
   
   <div align="center">
   <form action="#none" method="post" id="_frmForm">                  
      <table border="1" style="width: 100%">
         <colgroup>
            <col style="width:30%">
            <col style="width:70%">
         </colgroup>
         
         <tr>
            <td><img src="assets/images/others/regiimg.png">기업 아이디</th>
            <td>
               <input type="text" name="cid" id="_cid">
               <font id="_checkIdP">※ 4자 이상, 12자 이하 영문 및 숫자</font>
            </td>
         </tr>
         <tr>
            <td><img src="assets/images/others/regiimg.png">비밀번호</th>
            <td>
               <input type="password" name="pwd" id="_pwd" size="30" data-msg="비밀번호를 ">
               <font id="_checkPwd1">※ 4자 이상, 12자 이하 영문 및 숫자</font>
            </td>
         </tr>
         <tr>
            <td><img src="assets/images/others/regiimg.png">비밀번호 확인</td>
            <td>
               <input type="password" id="_pwdck" data-msg="비밀번호 확인을 ">
               <font id="_checkPwd2">※ 비밀번호를 한 번 더 입력하여 주십시오.</font>
            </td>
         </tr>
         <tr>
            <td><img src="assets/images/others/regiimg.png">기업구분</th>
            <td>
               <select name="auth" id="_auth" data-msg="기업을 ">
                  <option>기업 선택</option>
                  <option value="WH">예식장</option>
                  <option value="WI">청접장</option>
                  <option value="ST">스튜디오</option>
                  <option value="DS">드레스</option>
                  <option value="MU">메이크업</option>
               </select> 
            </td>
         </tr>
         <tr>
            <td><img src="assets/images/others/regiimg.png">회사명</th>
            <td>
               <input type="text" name="cname" id="_cname" size="30" data-msg="그룹명을 ">
            </td>
         </tr>
         <!-- 원래는 email은 unique 키이기 때문에 체크를 해주어야한다. -->
         <!-- 메일 발송해 인증하는 부분이 있어도 좋을꺼 같다 -->
         <tr>
            <td><img src="assets/images/others/regiimg.png">이메일</th>
            <td>
               <input type="hidden" name="email" id="_email">
               <input type="text" id="_email1" data-msg="이메일을 ">@
               <select id="_email2">
                  <option selected>naver.com</option>
                  <option>daum.net</option>
                  <option>gmail.com</option>
               </select>
               <font id="_checkEmailDiv">※이메일을 입력해주세요</font>
            </td>
         </tr>
         <tr>
            <td><img src="assets/images/others/regiimg.png">회사 전화번호</th>
            <td>
               <input type="hidden" name="phone" id="_phone" data-msg="전화번호를 ">
               <select id="_phone1">
                  <option selected>02</option>   <!-- 서울 -->
                  <option>051</option>         <!-- 부산 -->
                  <option>053</option>         <!-- 대구 -->
                  <option>032</option>         <!-- 인천 -->
                  <option>062</option>         <!-- 광주 -->
                  <option>042</option>         <!-- 대전 -->
                  <option>052</option>         <!-- 울산 -->
                  <option>044</option>         <!-- 세종 -->
                  <option>031</option>         <!-- 경기 -->
                  <option>033</option>         <!-- 강원 -->
                  <option>043</option>         <!-- 충북 -->
                  <option>041</option>         <!-- 충남 -->
                  <option>063</option>         <!-- 전북 -->
                  <option>061</option>         <!-- 전남 -->
                  <option>054</option>         <!-- 경북 -->
                  <option>055</option>         <!-- 경남 -->
                  <option>064</option>         <!-- 제주 -->
               </select>-
               <input type="text" id="_phone2" size="4">-
               <input type="text" id="_phone3" size="4">
            </td>
         </tr>
         <!-- 주소 api사용 -->
         <tr>
            <td><img src="assets/images/others/regiimg.png">주소</td>
            <td>
               <input type="hidden" name="address" id="_address">
               <input type="text" name="addr1" id="_addr1" size="30" readonly="readonly">
               <button type="button" id="addrbtn" onclick="DaumPostcode()">주소찾기</button><br>
               <input type="text" name="addr2" id="_addr2" size="30">
            </td>
         </tr>
         <!-- 반드시 숫자! -->
         <tr>
            <td><img src="assets/images/others/regiimg.png">사업자등록증</th>
            <td>
               <input type="hidden" name="license" id="_license">
               <input type="text" name="license1" id="_license1" size="3" data-msg="사업자등록증을 "> -
               <input type="text" name="license2" id="_license2" size="2" data-msg="사업자등록증을 "> -
               <input type="text" name="license3" id="_license3" size="5" data-msg="사업자등록증을 "><div id="_checkLicen"></div>
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
            <td colspan="2" style="height: 50px; text-align: center">
               <a href="#none" id="_btnRegi" title="회원가입">
                  <img alt="회원가입" src="assets/images/others/regi.jpg">
               </a>
            </td>
         </tr>
      </table>
   </form>
   </div>
</div>


<script type="text/javascript">

var pwdFlag1 = false;
var pwdFlag2 = false;
var idFlag = false;
var emailFlag = true;
var licenseFlag = false;
var phoneFlag = false;

$(document).ready(function () {
   //alert("Alert");
   // 로그인 클릭시
   $("#_btnLogin").click(function() {
      location.href="login.do"; 
   });
   
   // id 양식 일치 여부
   $("#_cid").blur(function () {
      $.ajax({
         type:"get",
         url:"checkId.do",
         data:"id="+$("#_cid").val(),      // parameter 타입으로 이동
         success:function(msg){
            if($("#_cid").val() == "" || $("#_cid").val().length<4 || $("#_cid").val().length>12 || !isTrue($("#_cid").val())){
               $("#_checkIdP").text("아이디는 4자 이상 12자 이하 영문 및 숫자로 구성되어야 합니다.");
               $("#_checkIdP").css("color","#ff0000");
               $("#_cid").focus();
               idFlag = false;
            }else{
               CheckMessage(msg);
            }
         },
         error:function(reqest, status, error){
            alert("실패");
         }
      });
   });
   
    
   // 비밀번호 일치여부
   $("#_pwd").blur(function () {
      var pwd = $("#_pwd").val();
      if(pwd=="" || pwd.length<4 || pwd.length>12 || !isTrue(pwd)){
         $("#_checkPwd1").text("비밀번호를 4자 이상 12자 이하 영문 및 숫자로 구성되어야 합니다.");
         $("#_checkPwd1").css("color","#ff0000");
         pwdFlag1 = false;
      }else{
         $("#_checkPwd1").text("사용가능합니다.");
         $("#_checkPwd1").css("color","#0000ff");
         pwdFlag1 = true;
      }
   });
   
   $("#_pwdck").blur(function () {
      var pwd = $("#_pwd").val();
      var pwdck = $("#_pwdck").val();
      
      if(pwdck==pwd){
         $("#_checkPwd2").html("비밀번호가 일치합니다.");
         $("#_checkPwd2").css("color","#0000ff");
         pwdFlag2 = true;
      }else{
         $("#_checkPwd2").html("비밀번호가 일치하지 않습니다.");
         $("#_checkPwd2").css("color","#ff0000");
         pwdFlag2 = false;
      }
   });
   
   
   // 이메일 일치 여부
   $("#_email1").blur(function () {
      emailCheck();
   });
   
   $("#_email2").change(function () {
      emailCheck();
   });
   
   // 사업자등록증
   $("#_license1").blur(function () {
      licenseCheck1();
   });
   $("#_license2").blur(function () {
      licenseCheck2();
   });
   $("#_license3").blur(function () {
      licenseCheck3();
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
   
   // 회원가입 클릭시
   $("#_btnRegi").click(function() {
      
      // 휴대폰 번호
      var phone1 = $("#_phone1 option:selected").val();
      var phone2 =  $("#_phone2").val();
      var phone3 =  $("#_phone3").val();
      
      if(phone2.trim() == "" || phone2.length<3 || phone2.length>4 || !isNum(phone2)) {
         $("#_phone2").focus();
         phoneFlag = false;
      } else if (phone3.trim() == "" || phone3.length != 4 || !isNum(phone3)) {
         $("#_phone3").focus();
         phoneFlag = false;
      } else {
         $("#_phone").val(phone1 + "-" + phone2 + "-" + phone3);
         phoneFlag = true;
      }
      
      // 주소
      var address1 =  $("#_addr1").val();
      var address2 =  $("#_addr2").val();
      
      if(address1.trim() == "") {
         alert("정확한 주소를 입력해주세요.");
      }  else {
         $("#_address").val(address1 + " " + address2);
      }
      
      if (!idFlag) {
         alert("아이디를 확인해주세요.");
         $("#_cid").focus();
      } else if (!(pwdFlag1 && pwdFlag2)) {
         alert("비밀번호를 확인해주세요.");
         $("#_pwd").focus();
      } else if($("#_auth option:selected").text() == "기업 선택"){
         alert("기업 종류를 선택해주세요.");
      } else if ($("#_cname").val().trim() == "") {
         alert("기업명을 입력해주세요.");
         $("#_cname").focus();
      }else if(!phoneFlag){
    	  alert("번호를 정확히 입력해주세요.");
      }else if (!emailFlag) {
         alert("이메일 주소를 확인해주세요.");
         $("#_email1").focus();
      }  else if ($("#_address").val().trim() == "") {
         alert("주소를 입력해주세요.");
      }  else if(!licenseFlag){
         alert("사업자등록증 번호를 확인해주세요");
      } else if (!$("#_check1").is(":checked") || !$("#_check2").is(":checked") || !$("#_check3").is(":checked")) {
         alert("약관에 동의해주세요.");
      }else{	// 성공
         $("#_frmForm").attr({"target":"_self", "action":"companyJoin.do" }).submit();
      }
   });
}); 

//사업자 등록증 비교 하는 함수 및 저장
function licenseCheck1() {   
   var license1 = $("#_license1").val();
   if(license1=="" || license1.length!=3 || !isTrue(license1)){
      licenseFlag = false;
      $("#_checkLicen").html("처음을 3글자로 맞추어주세요");
      $("#_checkLicen").css("color","#ff0000");
      $("#_license1").focus();
   }else{
      $("#_license2").focus();
   }
}
function licenseCheck2() {   
   var license2 = $("#_license2").val();
   if(license2=="" || license2.length!=2 || !isTrue(license2)){
      licenseFlag = false;
      $("#_checkLicen").html("중간을 2글자로 맞추어주세요");
      $("#_checkLicen").css("color","#ff0000");
      $("#_license2").focus();
   }else{
      $("#_license3").focus();
   }
}
function licenseCheck3() {   
   var license3 = $("#_license3").val();
   
   if(license3=="" || license3.length!=5 || !isTrue(license3)){
      licenseFlag = false;
      $("#_checkLicen").html("마지막을 5글자로 맞추어주세요");
      $("#_checkLicen").css("color","#ff0000");
      $("#_license3").focus();
   }else{
	  licenseCheck();     
   }
}
// 양식 확인하는 함수
function licenseCheck(){
	 var license = $("#_license1").val()+"-"+$("#_license2").val()+"-"+$("#_license3").val();
	 $.ajax({
   	  type:"get",
         url:"checkLicense.do",
         data:"license="+license,      // parameter 타입으로 이동
         success:function(msg){
            if(msg.message=="true"){
            	licenseFlag = false;
	            $("#_license1").val("");
	            $("#_license2").val("");
	            $("#_license3").val("");
                $("#_license1").focus();
                $("#_checkLicen").html("동일한 사업자 등록증이 있습니다.");
                $("#_checkLicen").css("color","#ff0000");
            }else{
                licenseFlag = true;
            	$("#_checkLicen").html("사용하실 수 있습니다.");
                $("#_checkLicen").css("color","#0000ff");
                $("#_license").val(license);
            }
         },
         error:function(reqest, status, error){
            alert("실패");
         }
     });
}


// 이메일 확인하는 함수
function emailCheck() {
   // 이메일 조합
   var email1 = $("#_email1").val();
   var email2 = $("#_email2 option:selected").val();
   if (email1.trim() != "") {
      $("#_email").val(email1 + "@" + email2);
   } else {   
      $("#_email").val("");
   }
   var email = $("#_email").val();
   
   $.ajax({
      type:"get",
      url:"checkEmail.do",
      async:true,
      data:"email="+email,      // parameter 타입으로 이동
      success:function(msg){
         if($("#_email1").val() == ""){
            $("#_checkEmailDiv").html("이메일을 입력해주세요");
            $("#_checkEmailDiv").css("color","#ff0000");
            emailFlag = false;
         }else if(!isTrue($("#_email1").val())){
            $("#_checkEmailDiv").html("이메일 양식에 맞지 않습니다.");
            $("#_checkEmailDiv").css("color","#ff0000");
            emailFlag = false;
         }else{
            CheckMessage(msg);
         }
      },
      error:function(reqest, status, error){
         alert("실패");
      }
   });
}

//메시지를 뿌려주는 부분
function CheckMessage(msg) {
   //alert("CheckMessage");
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
         $("#_email1").val("");
		 //$("#_email1").css("background-color", "#c1ecf2");
         emailFlag = false;
      }else{
         var email = $("#_email1").val()+"@"+$("#_email2 option:selected").text();
         $("#_checkEmailDiv").html("사용할 수 있는 이메일입니다.");
         $("#_checkEmailDiv").css("color","#0000ff");
         //$("#_email1").css("background-color", "#ffffff");
         emailFlag = true;
      }
   }
}

// 다음 주소 api
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
            $("#_addr1").val(fullRoadAddr);
            $("#_addr1").val(data.jibunAddress);
			
          
        }
    }).open();
}

// 양식에 일치할 때 true
function isTrue(cid) {            
   //alert("isTrue");
   for(var i=0;i<=cid.length-1;i++){
      if(cid.charAt(i)>='a' && cid.charAt(i)<='z'){
      }else if (cid.charAt(i) >= '0' && cid.charAt(i) <= '9') {
      }else {
         return false;
      }
   }
   return true;
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
</script>