<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
table {
	border: 1px solid #EBEBEB;
	align-content: center;
	width: 800px;
	/* height: 1000px; */
}
td font{
	font-size:12px;color:#0000ff;margin:8px 0 0 8px;letter-spacing:-0.5px;
}
tr{
	height: 60px;
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
	<span class="nino-subHeading">wedding Hall</span>
		63컨벤션센터(구.63city웨딩홀)
	</h2>
	<p class="nino-sectionDesc">
		Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
	</p>
	<div class="sectionContent">
		<div class="row" align="center">
		
			<!-- action = "weddingwriteAf.do" -->
			<form name="frmForm" id="_frmForm" action="#none" method="post" 
			enctype="multipart/form-data">
			
			<!-- 위도, 경도 받아오기 -->
			<input type="hidden" name="latitude" id="_latitude">
			<input type="hidden" name="longitude" id="_longitude">
					
			<table class="list_table" style="width:85%;">
				<colgroup>
					<col width="20%"><col width="30%">
				</colgroup>
				<tr>
					<td>회사 아이디</td>
					<td colspan="3">
						<input type="text" name="cid" id="_cid" size="20"><font id="_cidCheckFld"></font>
						<button type='button' id='_upGradeBtn' style="display: none;">등급올리기</button>
					</td>
				</tr>
				<tr>
					<td>회사명</td>
					<td colspan="3">
						<input type="text" name="cname" id="_cname" size="20" readonly>
					</td>
				</tr>
				<tr>
					<td>회사 주소</td>
					<td colspan="3">
						<input type="text" name="address" id="_address" size="40" readonly>
					</td>
				</tr>
				
				<tr>
					<td>홀 타입</td>
					<td>
						<select id="_htype" name="htype">
							<option value="컨벤션" selected="selected">컨벤션</option>
							<option value="호텔">호텔</option>
							<option value="채플">채플</option>
							<option value="전통">전통</option>
							<option value="야외">야외</option>
							<option value="종교">종교</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>식대 가격대</td>
					<td><input type="text" name="mincook" id="_mincook" size="10">원
					 ~ <input type="text" name="maxcook" id="_maxcook" size="10">원
					 &nbsp;&nbsp;&nbsp;&nbsp;<font id="_cookCheckFld">※ 최소 가격 ~ 최대 가격 순으로 입력해주세요!</font>
					 </td>
				</tr>
				
				<tr>
					<td>음식 종류</td>
					<td>
						<input type="hidden" name="menutype" id="_menutype">
						<input type="checkbox" name="menu" value="뷔페">뷔페&nbsp;&nbsp;
						<input type="checkbox" name="menu" value="양식">양식&nbsp;&nbsp;
						<input type="checkbox" name="menu" value="한식">한식&nbsp;&nbsp;
						<input type="checkbox" name="menu" value="중식">중식&nbsp;&nbsp;
						<input type="checkbox" name="menu" value="일식">일식&nbsp;&nbsp;
						<input type="checkbox" name="menu" value="기타">기타
					</td>
				</tr>
				
				<tr>
					<td>수용 인원 범위</td>
					<td><input type="text" name="minpeople" id="_minpeople" size="10">명
					 ~ <input type="text" name="maxpeople" id="_maxpeople" size="10">명
					 &nbsp;&nbsp;&nbsp;&nbsp;<font id="_peopleCheckFld">※ 최소 인원 ~ 최대인원 순으로 입력해주세요!</font>
					 </td>
				</tr>
				<tr>
					<td>사진 업로드</td>
					<td style="text-align: left">
						<!-- 사진 추가를 누를 때 추가 할 수 있도록 할 예정 -->
						<!-- <button type="button" id="_fileBtn">사진 추가</button> -->
						<input type="file" name="fileload" id="_fileload" style=" width : 400px;">
					</td>
				</tr>
				<tr>
					<td>소개 내용</td>
					<td colspan="3">
						<textarea rows="10" cols="60" name="content" id="_content" ></textarea>
					</td>
				</tr>
				
				<tr>
					<td>주차 정보</td>
					<td colspan="3">
						<textarea rows="5" cols="60" name="parking" id="_parking" ></textarea>
					</td>
				</tr>
				
				<tr>
					<td>교통 정보</td>
					<td colspan="3">
						<textarea rows="5" cols="60" name="transpo" id="_transpo" ></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" style="height:50px; text-align:center;">
						<span>
							<a href="#none" id="_btnLogin" title="글쓰기"><img src="assets/images/others/bwrite.png" alt="글쓰기" /></a>
						</span>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</div>

<script>
$(function () {
	// 글쓰기 버튼 누를 시 실행
	$("#_btnLogin").click(function () {
		
		
		// checkbox check 된 값 받아오기
		var menutype="";
		$("input[name=menu]:checked").each(function () {
			menutype += $(this).val();
			menutype += "/";
		});	
		// 끝 문자열 자르기
		var len = menutype.length;
		menutype=menutype.substr(0,len-1);
		
		// menutype에 값 넣기
		var menuTrue=true;
		if(menutype==""){
			menuTrue=false;
		}else{
			$("#_menutype").val(menutype);
		}
		
		
		// 숫자 판별하기(식대 가격, 수용 인원)
		var mincook = $("#_mincook").val();
		var maxcook = $("#_maxcook").val();
		var minpeople = $("#_minpeople").val();
		var maxpeople = $("#_maxpeople").val();
		
		if($("#_cid").val()==""||$("#_cname").val()==""||$("#_address").val()==""){
			 $("#_cidCheckFld").text("※ 아이디를 입력해주세요!");
             $("#_cidCheckFld").css("color","#ff0000");
             $("#_cid").focus();
		}else if(!menuTrue){
			alert("음식 종류를 체크해주세요");
		}else if(mincook=="" || !isNum(mincook)){
			$("#_cookCheckFld").text("※ 숫자를 입력해주세요!");
            $("#_cookCheckFld").css("color","#ff0000");
			$("#_mincook").val("");
			$("#_mincook").focus();
		}else if(maxcook=="" || !isNum(maxcook)){
			$("#_cookCheckFld").text("※ 숫자를 입력해주세요!");
            $("#_cookCheckFld").css("color","#ff0000");
            $("#_maxcook").val("");
			$("#_maxcook").focus();
		}else if(minpeople=="" || !isNum(minpeople)){
			$("#_peopleCheckFld").text("※ 숫자를 입력해주세요!");
            $("#_peopleCheckFld").css("color","#ff0000");
            $("#_minpeople").val("");
			$("#_minpeople").focus();
		}else if(maxpeople=="" || !isNum(maxpeople)){
			$("#_peopleCheckFld").text("※ 숫자를 입력해주세요!");
            $("#_peopleCheckFld").css("color","#ff0000");
            $("#_maxpeople").val("");
			$("#_maxpeople").focus();
		}else if($("#_fileload").val()=="" || $("#_fileload").val()==null){	// 사진 미 추가시
			alert("사진을 추가해주세요!");
		}else if($("#_content").val()==""){	// 소개 내용 미입력시
			alert("소개 내용을 입력해주세요!");
			$("#_content").focus();
		}else{
			alert("위도 : "+$("#_latitude").val());
			alert("경도 : "+$("#_longitude").val());
			$("#_frmForm").attr({"target":"_self", "action":"weddingwriteAf.do"}).submit();
		}
			
		
	
	});
	
	// 회사id 체크해 회사명과 주소 넣기
	$("#_cid").blur(function () {
		cidcheck($("#_cid").val());
	});
	
	// 등급올리기
	$("#_upGradeBtn").click(function () {
		$.ajax({
	        type:"get",
	        url:"upCompanyGrade.do",
	        data:"cid="+$("#_cid").val(),      // parameter 타입으로 이동
	        success:function(){
	        	cidcheck($("#_cid").val());
	        },
	        error:function(reqest, status, error){
	           alert("실패");
	        }
	   });
	});
	
});
// 실제로 위도 경도 받는 부분
function getLatLong(addr){
	$.ajax({
		url:"http://maps.googleapis.com/maps/api/geocode/json?sensor=false&language=ko&address="+addr,
		type:"get",
		dataType:"json",
		success:function(e){
			if(e.status=="OK"){
				var geo = e.results[0].geometry.location;
				//alert("위도1 : "+geo.lat+" 경도1 : "+geo.lng);
				$("#_latitude").val(geo.lat);
				$("#_longitude").val(geo.lng);
			}else{
				alert("위치 정보가 없습니다.");
			}
		},
		error:function(reqest, status, error){
           alert("위치를 찾을 수 없습니다.");
        }
	});
}

// 실제 id 체크해주는 부분
function cidcheck(cid){
	$.ajax({
        type:"get",
        url:"checkCompanyGrade.do",
        data:"cid="+cid,      // parameter 타입으로 이동
        success:function(msg){
           if(msg.message=="null"){
              $("#_cidCheckFld").text("※ 해당되는 아이디가 없습니다.");
              $("#_cidCheckFld").css("color","#ff0000");
              $("#_cid").val("");
              $("#_cname").val("");
              $("#_address").val("");
              $("#_upGradeBtn").attr("style","display: none");
           }else if(msg.message=="false"){
           	$("#_cidCheckFld").text("※ 회사 등급이 낮습니다.");
           	$("#_cidCheckFld").css("color","#ff0000");
           	$("#_upGradeBtn").removeAttr("style");
           	$("#_cname").val("");
            $("#_address").val("");
           }else{
           	$("#_cidCheckFld").text("일치하는 ID를 찾았습니다.");
           	$("#_cidCheckFld").css("color","#0000ff");
           	$("#_cname").val(msg.message.cname);
           	$("#_address").val(msg.message.address);
           	$("#_upGradeBtn").attr("style","display: none");
           	getLatLong(msg.message.address);
           }
        },
        error:function(reqest, status, error){
           alert("실패");
        }
   });
}

// 숫자 판별(숫자면 true)
function isNum(num){
	for( var i = 0; i <= num.length -1 ; i++ ) {
		if (num.charAt(i) >= '0' && num.charAt(i) <= '9') {
		} else {
			return false;
		}
	}
	return true;
}
</script>
    

