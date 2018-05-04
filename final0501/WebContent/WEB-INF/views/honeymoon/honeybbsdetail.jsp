<%@page import="kh.com.a.model.HoneyBbsDto"%>
<%@page import="javax.websocket.SendResult"%>
<%@page import="kh.com.a.model2.LoginDto"%>
<%@page import="kh.com.a.model.HoneyMoonDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<fmt:requestEncoding value="UTF-8"/>
<!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> -->
<style type="text/css">
.se_component_wrap{
	margin-left: 5%;
}/* todohm */

#se_title_wrapper {
    position: relative;
}

.se_title {
    font-size: 38px;
    line-height: 55px;
}
.se_textarea {
    font-weight: 400;
    word-break: normal;
    word-break: break-word;
    word-wrap: break-word;
    display: block;
    width: 100%;
    height: 100%;
    padding: 53px 0px;
    outline: 0;
    border: none;
    background: 0 0;
    font-family: inherit;
    font-size: inherit;
    font-weight: inherit;
    line-height: inherit;
    color: inherit;
    text-align: inherit;
    font-style: inherit;
    text-decoration: inherit;
    resize: none;
    margin-left: 100px;
}
.se_textarea1 {
    font-weight: 200;
    word-break: normal;
    word-break: break-word;
    word-wrap: break-word;
    display: block;
    width: 80%;
    height: 100%;
    padding: 0px;
    outline: 0;
    border: none;
    background: 0 0;
    font-family: inherit;
    font-size: inherit;
    font-weight: inherit;
    line-height: inherit;
    color: inherit;
    text-align: inherit;
    font-style: inherit;
    text-decoration: inherit;
    resize: none;
    margin-left: 100px;
}
#tab img{
	max-width: 50%; 
	max-height 50%;
	resize: none;
	margin-left: 100px; 
}
.delbtn{
	margin-top: 3px;
}
</style>
<%

LoginDto mem = (LoginDto)session.getAttribute("login");

if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>

<div class="se_component_wrap">
	<div id="se_title_wrapper">
	
			<div class="se_title">
							<!-- 수직선  -->
				<hr style="width: 1px;height: 65%;position: fixed;margin-left: 950px;margin-top: 200px;background-color: #EAEAEA;"/>
				<span style="position: fixed;margin-left: 1020px; margin-top: 100px; "><i class="mdi mdi-eye nino-icon" style="font-size: 20px;"></i></span>
				<span style="position: fixed;margin-left: 1080px; margin-top: 100px; font-size: 30px;">${bbs.readcount}</span>
				<span style="position: fixed;margin-left: 1020px; margin-top: 150px; "><i class="fa fa-calendar" style="font-size: 20px;"></i></span>
				
				<span style="position: fixed;margin-left: 1080px; margin-top: 163px; font-size: 15px; line-height: 18px;">${bbs.wdate}</span>
					<!--   지역 셀렉트   -->
					<span style="position: fixed;margin-left: 1020px; margin-top: 200px; "><i class="material-icons" style="font-size:25px">map</i></span>
					<span style="position: fixed; margin-left: 1080px; margin-top: 200px; font-size: 20px;">${bbs.area}</span>
						<!--  제목     -->
				<textarea class="se_textarea" placeholder="제목" rows="1" cols="10" id="_title" name="hmbDto.title" readonly="readonly">${bbs.title}</textarea>
			</div>
			
						<!--  수정 삭제 버튼    -->
			<c:set var="loginId" value="<%=mem.getId().trim()%>" />
			<c:if test="${bbs.id eq loginId}">
				<button style="position: fixed; z-index: 100; margin-left: 1050px; margin-top: 470px; padding: 5px 15px; border: 1px solid #EAEAEA;border-radius: 5px;background-color: #EAEAEA;" id="update" >수정</button>
				<button style="position: fixed; z-index: 100; margin-left: 1050px; margin-top: 530px; padding: 5px 15px; border: 1px solid #EAEAEA;border-radius: 5px;background-color: #EAEAEA;" id="delete">삭제</button>
			</c:if>
						<!--  이미지 삭제 버튼 다이브    -->
			<div id="_fileNameDiv" style="height:260px; width:300px; padding:10px; border:1px solic black;position: fixed; margin-top:460px; margin-left: 1040px;"></div>
			
						<!--  내용 컨텐츠    -->
			<div style="min-height: 300px;">
				<table id="tab">
					<tr>
						<td><textarea id="_content0" name="hmbDto.content0" class="se_textarea1"  readonly="readonly" placeholder="내용" cols="100" id="1" rows="1" >${bbs.content0}</textarea></td>
					</tr>
					<tr>
						<td><img src="" id="_picture0" name="picture0" style="display: none;"> </td>					
					</tr>
					<tr>
						<td><textarea id="_content1" name="hmbDto.content1" class="se_textarea1" placeholder="내용" cols="100" id="1" rows="1" style="display: none;"></textarea></td>
					</tr>
					<tr>
						<td><img src="" id="_picture1" name="picture1" style="display: none;"> </td>					
					</tr>
					<tr>
						<td><textarea id="_content2" name="hmbDto.content2" class="se_textarea1"  readonly="readonly" placeholder="내용" cols="100" id="1" rows="1" style="display: none;"></textarea></td>
					</tr>
					<tr>
						<td><img src="" id="_picture2" name="picture2" style="display: none;"> </td>					
					</tr>
					<tr>
						<td><textarea id="_content3" name="hmbDto.content3" class="se_textarea1"  readonly="readonly" placeholder="내용" cols="100" id="1" rows="1" style="display: none;"></textarea></td>
					</tr>
					<tr>
						<td><img src="" id="_picture3" name="picture3" style="display: none;"> </td>					
					</tr>
					<tr>
						<td><textarea id="_content4" name="hmbDto.content4" class="se_textarea1"  readonly="readonly" placeholder="내용" cols="100" id="1" rows="1" style="display: none;"></textarea></td>
					</tr>
					<tr>
						<td><img src="" id="_picture4" name="picture4" style="display: none;"> </td>					
					</tr>
				</table>
			</div>
			
	</div>
</div>

<script type="text/javascript">
var seq = ${bbs.seq};
var bbscontent1 = "${bbs.content1}";
var bbscontent2 = "${bbs.content2}";
var bbscontent3 = "${bbs.content3}";
var bbscontent4 = "${bbs.content4}";
var bbsfile0 = "${bbs.file0}";
var bbsfile1 = "${bbs.file1}";
var bbsfile2 = "${bbs.file2}";
var bbsfile3 = "${bbs.file3}";
var bbsfile4 = "${bbs.file4}";

if(isNull(bbsfile0)){ // null이 아닐때
	$("#_picture0").attr("src","upload/"+bbsfile0);
	$("#_picture0").css("display","block");
}if(isNull(bbscontent1)){ 
	$("#_content1").val(bbscontent1);
	$("#_content1").css("display","block");
}if(isNull(bbsfile1)){ // null이 아닐때
	$("#_picture1").attr("src","upload/"+bbsfile1);
	$("#_picture1").css("display","block");
}if(isNull(bbscontent2)){ 
	$("#_content2").val(bbscontent2);
	$("#_content2").css("display","block");
}if(isNull(bbsfile2)){ // null이 아닐때
	$("#_picture2").attr("src","upload/"+bbsfile2);
	$("#_picture2").css("display","block");
}if(isNull(bbscontent3)){ 
	$("#_content3").val(bbscontent3);
	$("#_content3").css("display","block");
}if(isNull(bbsfile3)){ // null이 아닐때
	$("#_picture3").attr("src","upload/"+bbsfile3);
	$("#_picture3").css("display","block");
}if(isNull(bbscontent4)){ 
	$("#_content4").val(bbscontent4);
	$("#_content4").css("display","block");
}if(isNull(bbsfile4)){ // null이 아닐때
	$("#_picture4").attr("src","upload/"+bbsfile4);
	$("#_picture4").css("display","block");
}

//////////내용부분에 대한
for (var i = 0; i < 5; i++) {
	var bbs = "#_content"+i;
	var contents = $(bbs).val();
	if(isNull(contents)){
		var len = $(bbs).val().length;
		var rows = Math.ceil(len/29);
		if(rows>0){
			$(bbs).attr("rows",rows);
		}
	}
}


function isNull(obj) {
	return (typeof obj != "undefined" && obj !=null && obj !="")?true:false;
}
$("#delete").click(function () {
	var conf = confirm("정말 삭제 하시겠습니까 ?");
	   if( conf == true ){
	      location.href = "delhmbbs.do?seq="+seq;
	   }
});
$("#update").click(function () {
	location.href = "hm_upbbs.do?seq="+seq;
});

</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
