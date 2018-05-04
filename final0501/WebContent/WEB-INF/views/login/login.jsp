<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  

<div class="container">
	<div align="center">
	<form name="frmForm" id="_frmForm" method="post">
		<table border="1">
		<colgroup>
			<col style="width:30%">
			<col style="width:70%">
		</colgroup>
		<tr>
			<th style="background: #eeeeee; color: #3e5fba;">아이디</th>
			<td>&nbsp;<input type="text" id="_id" name="id" value="" data-msg="ID를" size="15" title="아이디" style="border: 1px solid #dddddd;">
				<input type="checkbox" id="_chk_save_id">ID 저장
			</td>
		</tr>
		
		<tr>
			<th style="background: #eeeeee; color: #3e5fba;">패스워드</th>
			<td>&nbsp;<input type="text" id="_pwd" name="pwd" value="" data-msg="패스워드를" size="15" title="패스워드" style="border: 1px solid #dddddd;">
			</td>
		</tr>
		<tr>
			<td colspan="2" style="height: 50px; text-align: center;">
				<span>
					<a href="#none" id="_btnLogin" title="로그인">
						<img alt="로그인" src="assets/images/others/login_btn.jpg">
					</a>
					<a href="#none" id="_btnRegi" title="회원가입">
						<img alt="회원가입" src="assets/images/others/regi.jpg">
					</a>
				</span>
			</td>
		</tr>
		</table>
	</form>
	<br>
	<a id="kakao-login-btn"></a>
	</div>
</div>
<!-- 쿠키에 저장되는 부분 -->
<script type="text/javascript">
$("#_btnLogin").click(function() {
	if($("#_id").val() == ""){
		alert($("#_id").attr("data-msg") + " 입력해 주십시오" );
		$("#_id").focus();
	} else if($("#_pwd").val() == ""){
		alert($("#_pwd").attr("data-msg") + " 입력해 주십시오" );
		$("#_pwd").focus();
	} else{
//		$("#_frmForm").attr("target", "_self").submit();
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

//id저장
var user_id = $.cookie("user_id");
if(user_id != null){
	$("#_id").val(user_id);
	$("#_chk_save_id").attr("checked", "checked");
}

$("#_chk_save_id").click(function() {		
	if($('input:checkbox[id="_chk_save_id"]').is(":checked")){
		if($("#_id").val() == ""){
			$(this).prop("checked", false);
			alert("아이디를 입력해 주십시오");
		}else{
			$.cookie("user_id", $("#_id").val(), { expires: 7, path: '/' });
		}		
	}else{
		$.removeCookie("user_id", { path:'/' });
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
		           opener.document.location.reload();
				self.close();
			}else{
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
