<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
    
<style>
.main{
	width: 90%;
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
 	width: 70%;
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
button{
text-align: center;
align: center;
width: 100px;
}
img{
	width:200px;
height:170px;
}

</style>    
    
<form name="frmForm" id="_frmForm" action="cdupdateAf.do?cdseq=${cdd.cdseq}" method="post" 
enctype="multipart/form-data">
<input type="hidden" name="cdseq" value="${cdd.cdseq}">
<div class="main">
<table id="list_table">
<colgroup>
		<col width="100"/><col width="300"/>
	</colgroup>
	<tr>
		<td>��üID</td>
		<td>${cdd.cid}</td>
	</tr>
	<tr>
		<td>ûø���̸�</td>
		<td><input type="text" name="title" value="${cdd.title}"></td>
	</tr>
	<tr>
		<td>ûø������</td>
		<td>
		<c:if test="${cdd.category eq 'mobile'}">
			�����
		</c:if>
		<c:if test="${cdd.category eq 'analog'}">	
			�Ƴ��α�
		</c:if>
		</td>
		
	</tr>
	<tr>
		<td>����</td>
		<td>
		<c:if test="${cdd.cbag eq 2}">
			��������
		</c:if>
		<c:if test="${cdd.cbag eq 1}">
			��������
		</c:if>
		</td>
	</tr>
	<tr>
		<td>����</td>
		<td><input type="text" name="price" value="${cdd.price}"></td>
	</tr>
	<tr>
		<td>ûø��ũ��</td>
		<td>
		<c:if test="${cdd.cardsize eq 'recwidth' }">
		���簢��(����)(171*116mm)
		</c:if>
		<c:if test="${cdd.cardsize eq 'recheight' }">
		���簢��(����)(116*171mm)
		</c:if>
		<c:if test="${cdd.cardsize eq 'square' }">
		���簢��(141*141mm)
		</c:if>
		</td>
	</tr>
	<input type="hidden" name="filenames" value="">
	<tr>
		<td>�̹���</td>
	<td><input type="button" onClick="addFile();" value="�߰�">
	   <table id="fileDiv">
	      <tr>
	         <td><input type="file" name="files"/></td>
	      </tr>
	   </table>
	</td>
	</tr>
	<tr>
		<td>����1</td>
		<td><input type="text" name="filenames" value="${cdd.picture0 }"><img src = "upload/${cdd.picture0}"/>
		<input type="button" onclick="fdelete(this)" value="����"></td>
	<tr>
	    <td>����2</td>
	    <td><input type="text" name="filenames" value="${cdd.picture1 }"><img src = "upload/${cdd.picture1}"/>
	    <input type="button" onclick="fdelete(this)" value="����"></td>
	</tr>
	<tr>
	    <td>����3</td>
	    <td><input type="text" name="filenames" value="${cdd.picture2 }"><img src = "upload/${cdd.picture2}"/>
	    <input type="button" onclick="fdelete(this)" value="����"></td>
	</tr>
	<tr>
	    <td>����4</td>
	    <td><input type="text" name="filenames" value="${cdd.picture3 }"><img src = "upload/${cdd.picture3}"/>
	    <input type="button" onclick="fdelete(this)" value="����"></td>
	</tr>
	
	<tr>
		<td>�Ұ���</td>
		<td><textarea rows="10" cols="50" name="content" id="_content">${cdd.content}</textarea></td>
	</tr>

	   </table>

<button id = "card_update">Ȯ��</button>
<button id="ccdelete">����</button>
</div>
</form>

<script>
$("#card_update").click(function() {
	alert('�����ϱ�');
	$("#_frmForm").attr({ "target":"_self", "action":"cdupdateAf.do?cdseq=${cdd.cdseq}"}).submit();
});

$("#ccdelete").click(function() {
	alert('�����ϱ�');
	$("#_frmForm").attr({ "target":"_self", "action":"ccdelete.do?cdseq=${cdd.cdseq}"}).submit();
});

var fileUploadCount=0;
function addFile(){       
   
   var list = $('#fileDiv');
   var data = list.find("tr").eq(list.find("tr").length-1).find("input[type=file]").attr("name");

   fileUploadCount++;

   var html = "";
   html += "<tr>"; 
   html += "   <td><input type='file' name='files'/></td>";
   html += "</tr>";
   
   list.append(html);
   
}



function fdelete(a) {
	var table=document.getElementById("list_table");
	var i = a.parentNode.parentNode.rowIndex;
	table.deleteRow(i);
}

</script>