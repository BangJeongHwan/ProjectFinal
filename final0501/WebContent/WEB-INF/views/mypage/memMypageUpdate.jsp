<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  

<h3>회원정보 변경</h3>
<br>
<style type="text/css">
table {
	border: 1px solid #EBEBEB;
	align-content: center;
	width: 300px;
}
td font{
	font-size:12px;color:#0000ff;margin:8px 0 0 8px;letter-spacing:-0.5px;
}
tr{
	height: 60px;
	padding:  20px 20px;
}
td{
	 align-content: center;
	 text-align: center;
}
td:nth-child(even) {
    background-color:white;
}
</style>

<div align="center">
<table class="list_table" style="width:1100px;" >
	<colgroup>
		<col width="30%"/><col width="40%"/><col width="30"/>
	</colgroup>
	
	<tr>
		<td>아이디</td>
		<th colspan="2"><input type="text" name="id" id="_id" size="10" value="${member.mid }" readonly="readonly" style="border: 0"></th>
	</tr>
	
	<tr>
		<td>비밀번호</td>
		<td></td>
		<td>
			<table id="_updatePwd">
				<tr>
					<td>
						<input type="hidden" name="pwdch" id="_pwdch" value="${member.pwd }">
						<input type="password" name='pwd' id='_pwd' placeholder='기존 비밀번호 입력'/><br>
    					<font id='_checkPwd'>※비밀번호를 입력해주세요.</font>
					</td>
				</tr>
    			<tr>
    				<td>
    					<input type='password' name='rpwd' id='_rpwd' placeholder='새 비밀번호 입력'/><br>
    					<font id='_checkPwd1'>※ 4자 이상, 12자 이하 영문 및 숫자</font>
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<input type='password' name='rrpwd' id='_rrpwd' placeholder='새 비밀번호 확인'/><br>
    					<font id='_checkPwd2'>※ 비밀번호를 한 번 더 입력하여 주십시오.</font>
    				</td>
    			</tr>
   				<tr>
   					<td>
   						<button type='button' id='_updateCheckPwd' onclick="pwdgo()">확인</button>
   					</td>
   				</tr>
			</table>
		</td>
	</tr>
	
	
	<tr>
		<td>주소</td>
		<td><input type="text"size="30" value="${member.address }" readonly="readonly" style="border: 0"></td>
		<td>
			<table id="_updateAddre">
				<tr>
    				<td><input type="hidden" name="address" id="_address"/>
    				<input type='text' id='_addr1' size='30' readonly='readonly' placeholder='주소 찾기'></td>
    				<td><button type='button' id='addrbtn' onclick='DaumPostcode()'>찾기</button></td>
    			</tr>
    			<tr>
    				<td><input type='text' id='_addr2' size='30' placeholder='세부 주소'></td>
    			</tr>
    			<tr>
    				<td><button type='button' id='_updateCheckAddre' onclick="addrego()">확인</button></td>
    			</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td>전화번호</td>
		<th>
			<input type="text" size="20" value="${member.phone }" readonly="readonly" style="border: 0">
		</th>
	</tr>
	
	<tr>
		<td>이메일</td>
		<th colspan="2"><input type="text" size="30" value="${member.email }" readonly="readonly" style="border: 0"></th>
	</tr>
	
	<tr>
		<td colspan="3">
			<button type="button" id="_withdraw" onclick="withdrawCompany()">탈퇴</button>
		</td>
		
	</tr>
	</table>
</div>
<br><br><br>

<script>
$(document).ready(function () {
		
	 	//기존 비밀번호 일치여부
	   $("#_pwd").blur(function () {
		   var pwd = $("#_pwd").val();
		   var pwdch = $("#_pwdch").val();
		   
		   if(pwd==pwdch){
			   $("#_checkPwd").html("기존비밀번호가 일치합니다.");
		       $("#_checkPwd").css("color","#0000ff");
		       $("#_updateCheckPwd").attr("disabled", "disabled");
		       pwdFlag = true;
		   }else{
		       $("#_checkPwd").html("기존비밀번호가 일치하지 않습니다.");
		       $("#_checkPwd").css("color","#ff0000");
		       $("#_updateCheckPwd").attr("disabled", "disabled");
		       pwdFlag = false;
		   }
	   });
	   
	 // 비밀번호 일치여부
	   $("#_rpwd").blur(function () {
	      var rpwd = $("#_rpwd").val();
	      if(rpwd=="" || rpwd.length<4 || rpwd.length>12){
	         $("#_checkPwd1").text("비밀번호를 4자 이상 12자 이하 영문 및 숫자로 구성되어야 합니다.");
	         $("#_checkPwd1").css("color","#ff0000");
	         pwdFlag1 = false;
	      }else{
	         $("#_checkPwd1").text("사용가능합니다.");
	         $("#_checkPwd1").css("color","#0000ff");
	         pwdFlag1 = true;
	      }
	   });
	   
	    $("#_rrpwd").blur(function () {
	      var rpwd = $("#_rpwd").val();
	      var rrpwd = $("#_rrpwd").val();
	      
	      if(rrpwd==rpwd){
	         $("#_checkPwd2").html("비밀번호가 일치합니다.");
	         $("#_checkPwd2").css("color","#0000ff");
	         $("#_updateCheckPwd").removeAttr("disabled");
	         pwdFlag2 = true;
	      }else{
	         $("#_checkPwd2").html("비밀번호가 일치하지 않습니다.");
	         $("#_checkPwd2").css("color","#ff0000");
	         $("#_updateCheckPwd").attr("disabled", "disabled");
	         pwdFlag2 = false;
	      }
	   });
	    
	    $("#_addr1").blur(function () {
			
		});
	    
});


function pwdgo() {
	var id = $("#_id").val();
	var pwd = $("#_rpwd").val();
	console.log("id = " + id);
	console.log("pwd = " + pwd);
	$.ajax({
		type:"post",
		url:"updateMPwd.do",
		data:"mid=" + id+"&pwd=" + pwd,
		async:true,
		success:function(data){
			if(data=="true"){
				alert("PWD가 업데이트 되었습니다.");
				location.href="memMypageUpdate.do";
			}else{
				$("#_pwd").val("");
				$("#_rpwd").val("");
				$("#_rrpwd").val("");
				alert("PWD가 일치하지않습니다.");
			}
		}		
	});
}

function addrego() {
	var id = $("#_id").val();
	var address1 = $("#_addr1").val();
    var address2 = $("#_addr2").val();
    
    console.log("address1 = " + address1);
	console.log("address2 = " + address2);
    
    if(address1.trim() == "") {
       alert("정확한 주소를 입력해주세요.");
    }  else {
       $("#_address").val(address1 + " " + address2);
    }
    
    var address = $("#_address").val();
    
    $.ajax({
		type:"post",
		url:"updateMAddre.do",
		data:"mid=" + id+"&address=" + address,
		async:true,
		success:function(data){
			if(data=="true"){
				alert("주소가 업데이트 되었습니다.");
				location.href="memMypageUpdate.do";
			}else{
				$("#_addr1").val("");
				$("#_addr2").val("");
				alert("주소를 수정하는데 실패했습니다.");
			}
		}		
	});
}

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

function withdrawCompany() {
	var id = $("#_id").val();
	
	$.ajax({
		type:"post",
		url:"withdrawMember.do",
		data:"mid=" + id,
		async:true,
		success:function(data){
			if(data=="true"){
				alert("탈퇴되었습니다.");
				location.href="logout.do";
			}else{
				alert("탈퇴요청 오류");
			}
		}		
	});
}
</script>













