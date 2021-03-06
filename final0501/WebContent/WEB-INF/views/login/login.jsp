<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <style type="text/css">
  	.input-group .form-control {
    position: relative;
    z-index: 2;
    float: left;
    width: 100%;
    margin-bottom: 0;
    height: 50px;
}
  </style>
  
<!--   <label for="email">Email:</label>
      <input type="text" class="form-control" id="email" placeholder="Enter email" name="email"> -->
      <br>
<div class="container">
	<div align="center" >
	<form method="post">
		<table style="height: 60%; width: 80%">
		<colgroup>
			<col style="width:30%">
			<col style="width:70%">
		</colgroup>
		<tr>
			
			<td class="input-group">
				   <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				   <input type="text" class="form-control" id="_id" name="id" value="" data-msg="ID를" placeholder="아이디"  title="아이디">
			<!-- &nbsp;<input type="text" id="_id" name="id" value="" data-msg="ID를" size="15" title="아이디" style="border: 1px solid #dddddd;"> -->
				
			</td>
		</tr>
		
		<tr>
			<td class="input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
			<input type="password" class="form-control" id="_pwd" name="pwd" value="" placeholder="패스워드"  title="패스워드" value="" data-msg="패스워드를">
			<!-- &nbsp;<input type="text" id="_pwd" name="pwd" value="" data-msg="패스워드를" size="15" title="패스워드" style="border: 1px solid #dddddd;"> -->
			</td>
		</tr>
		<tr>
			<td class="checkbox" >
				<label><input type="checkbox" id="_chk_save_id">ID 저장</label>
			</td>
		</tr>
		<tr>
			<td style="height: 50px; text-align: center;">
					<a href="#none" id="_btnLogin" title="로그인" class="btn btn-default">
						<!-- <img alt="로그인" src="assets/images/others/login_btn.jpg"> -->로그인
					</a>
					<a href="#none" id="_btnRegi" title="회원가입" class="btn btn-default">
						<!-- <img alt="회원가입" src="assets/images/others/regi.jpg"> -->회원가입
					</a>
			</td>
		</tr>
		</table>
	</form>
	<a id="kakao-login-btn"></a>
	</div>
</div>
<script type="text/javascript">
// 쿠키에 저장된 id를 불러온다.
var cookieUser_id = document.cookie.match('(^|;) ?' + 'user_id' + '=([^;]*)(;|$)');
if (cookieUser_id != null) {
	var cookieId = cookieUser_id[2];
	if (cookieId != null && cookieId.trim() != "") {
		$("#_id").val(cookieId);
		$("#_chk_save_id").click();
	}
}

$("#_btnLogin").click(function() {
	if($("#_id").val() == ""){
		alert($("#_id").attr("data-msg") + " 입력해 주십시오" );
		$("#_id").focus();
	} else if($("#_pwd").val() == ""){
		alert($("#_pwd").attr("data-msg") + " 입력해 주십시오" );
		$("#_pwd").focus();
	} else{
		go();
	}	
});

$("#_btnRegi").click(function() {
	opener.top.location.href="SelectRegi.do";
	self.close();
});

$("#_id").keypress(function(event) {
	if(event.which == "13"){
		event.preventDefault();
		$("#_pwd").focus();
	}
});

$("#_pwd").keypress(function() {
	if(event.which == "13"){
		event.preventDefault();
		$("#_btnLogin").click();
	}
});

function go() {
	var id = $("#_id").val();
	var pwd = $("#_pwd").val();
	console.log("id = " + id);
	console.log("pwd = " + pwd);
	$.ajax({
		type:"post",
		url:"loginAf.do",
		data:"id=" + id+"&pwd=" + pwd,
		async:true,
		success:function(data){
			if(data=="true"){
				//★
				if($('input:checkbox[id="_chk_save_id"]').is(":checked")){
					var date = new Date();
					date.setTime(date.getTime() + 7 * 60 * 60* 24 * 1000);//7일
					document.cookie = "user_id=" + id + ";expires=" + date.toUTCString() + ";path=/";
				} else {
					document.cookie = "user_id=;expires=Thu, 01 Jan 1970 00:00:00 UTC;path=/";
				}
				
		        opener.document.location.reload();
				self.close();
			}else{
				
				//★
				document.cookie = "user_id=;expires=Thu, 01 Jan 1970 00:00:00 UTC;path=/";
				
				$("#_id").val("");
				$("#_pwd").val("");
				alert("ID와 PWD가 맞지않습니다.");
			}
		}		
	});
}

</script>


<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('4edbd97a5859d684e8cdc0e603c212ed');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v1/user/me',
          success: function(res) {
        	  kakaoGo(res.kaccount_email);
          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
  //]]>
function kakaoGo(email) {
		
		$.ajax({
			type:"post",
			url:"kakaoLogin.do",
			data:"email="+email,
			async:true,
			success:function(data){
				if(data=="true"){
			           opener.document.location.reload();
					self.close();
				}else{
					opener.top.location.href="SelectRegi.do";
					self.close();
				}
			}		
		});
		
}
  
</script>



<!--  네이티브 앱 키
902b5fc740a86916035e30dd1eb46181
REST API 키
ee286eadc0362e052fc1b6b157e4f89d
JavaScript 키
4edbd97a5859d684e8cdc0e603c212ed
Admin 키
038b0af44d8256ac48c7021a562f7875-->
<!--  

{
"kaccount_email":"cdi0720@naver.com",
"kaccount_email_verified":true,
"id":763518225,
"properties":{
"profile_image":"http://k.kakaocdn.net/dn/bhZf7W/btqlgCS2QaH/QRgmJgKW991BvZoFOKrVkK/profile_640x640s.jpg",
"nickname":"동인",
"thumbnail_image":"http://k.kakaocdn.net/dn/bhZf7W/btqlgCS2QaH/QRgmJgKW991BvZoFOKrVkK/profile_110x110c.jpg"}}

네이버
Client ID De8_Y0eWNCvSnmqMIgR8
Client Secret hF5ThYKQ5w
-->
