<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  


<style>
.main{
	width: 80%;
	height: 100%;
	background-color: white;
	margin : 0 auto;
	align: center;
	text-align: center;
	margin-top: 50px;
	margin-left: 300px;
}
 table { 
 	border: 1px solid #EBEBEB; 
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
}
td:nth-child(even) {
    background-color:white;
}

</style>

<div class="main">
<form name="frmForm" id="_frmForm" modelAttribute = "CardVO" action="cdwriteAf.do?wiseq=${ccd.wiseq}" method="post" 
enctype="multipart/form-data">
<%
//다운로드할 경로
String fupload = request.getServletContext().getRealPath("/upload");
%>
<input type="hidden" name="upDir" value="<%=fupload %>"/>
<table>
<colgroup>
<col style="width:300px;" />
<col style="width:auto;" />
</colgroup>
	<tr>
		<td width="100px">업체ID</td>
		<td><input type="text" name="cid" readonly="readonly" value="${ccd.cid}"></td>
	</tr>
	<tr>
		<td>청첩장이름</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td>청첩장종류</td>
		<td>
			<select class="card_catagory" name="category" id="card_catagory">
				<option value="mobile">모바일</option>
				<option value="analog">아날로그</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>봉투</td>
		<td>
			<select class="card_bag" name="cbag" id="card_bag">
				<option value="2">봉투있음</option>
				<option value="1">봉투없음</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input type="text" name="price"></td>
	</tr>
	<tr>
		<td>청첩장크기</td>
		<td>
			<select class="card_size" name="cardsize" id="card_size">
				<option value="recwidth">직사각형(가로)(171*116mm)</option>
				<option value="recheight">직사각형(세로)(116*171mm)</option>
				<option value="square">정사각형(141*141mm)</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>이미지</td>
	<td><input type="button" onClick="addFile();" value="추가">
	   <table id="fileDiv">
	      <tr>
	         <td><input type="file" name="files[0]"/></td>
	      </tr>
	   </table>
	</td>
	</tr>
	<tr>
		<td>소개글</td>
		<td><textarea rows="10" cols="50" name="content" id="_content"></textarea></td>
	</tr>
</table>
<button id = "card_write">글쓰기</button>
</form>
</div>
<script>
$("#card_write").click(function () {
	alert("글쓰기");
	$("#_frmForm").submit();
});

var fileUploadCount=0;
function addFile(){       
   
   var list = $('#fileDiv');
   var data = list.find("tr").eq(list.find("tr").length-1).find("input[type=file]").attr("name");

   fileUploadCount++;

   var html = "";
   html += "<tr>"; 
   html += "   <td><input type='file' name='files["+fileUploadCount+"]'/></td>";
   html += "</tr>";
   
   list.append(html);
   
}

// function select(){
// 	var select = "";
// 	$("select[name='catagory']:seleted").each(function()){
// 		select.push($(this).val);
// 	}
	
// 	$.ajax({
// 		url:'cdwriteAf.do',
// 		type:'POST',
// 		dataType:'text',
// 		data:{
// 			data:select
// 		}
		
// 	});
// }



</script>
