<%@page import="java.time.Year"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> --> 
<style type="text/css">
.acpbtn{
    background: none;
    border-radius: 14px;
    padding: 0px 25px;
}
.mcycptable{
	width: 1000px;
	border: 1px solid #EBEBEB;
	align-content: center;
	cursor: default;
}
.mcycptable tbody {
 	cursor: pointer;
}
.mcycptable tbody tr:nth-child(even) {
    background-color:#FBFBFB;
}
.mcycptable tr{
	padding:  20px 20px;
	height: 60px;
}
.mcycptable th{
	background-color:#F8F8F8;
	align-content: center;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
}
.mcycptable td{
	align-content: center;
	text-align: center;
	cursor: pointer;
}
</style>

 <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">사용가능 쿠폰</h4>
  </div>
  <div class="modal-body">
	<table class="mcycptable" style="width: 100%">
		<colgroup>
					<col width="40%"><col width="40%"><col width="20%">
		</colgroup>
		<thead >
	 		<tr>
				<th>사용기한</th> <th>쿠폰이름</th> <th>할인율</th>
			</tr>
		</thead>
		<tbody>	
			<c:if test="${!empty list}">	
				<c:forEach items="${list}" var="cp" varStatus="i">
					
					<tr id="1" onclick="trclick(${cp.seq})">
						<td> ${cp.remit}</td>
						<td><input type="text" readonly="readonly" style="background: none; border: none;" id="cptitle" value="${cp.title}"></td>
						<td><input type="text" readonly="readonly" style="background: none; border: none;" id="cpdiscount" value="${cp.discount}"></td>
					</tr>
				</c:forEach>
			
				
			</c:if> 
			
			<c:if test="${empty list}">
				<tr><td colspan="4">받으신 쿠폰이 없습니다.</td> </tr>
			</c:if>	
		</tbody>								
	</table>
</div>	
<div class="modal-footer">
        	<!-- <button type="button" class="btn btn-default" id="modalbtn">적용</button> -->
          <!-- <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button> -->
</div> 
	<script type="text/javascript">
 	function trclick(seq) {
			$.ajax({
				url:"getCp.do",
				type:"post",
				data:"seq="+seq,
				 async : true,
				 success : function(mcp){
					 createDiv(mcp.seq,mcp.title,mcp.discount);
				 }
			});
			$(".close").click();
		} 
 	 function createDiv(seq,title,discount) {
 		 var id = "_cpdiv"+seq;
			$("#_cpdiv").attr("id",id);
			var price = $("#"+id).html();
			price = Number(price);
			dcprice = price*0.01*discount;
			dcprice = Math.ceil(dcprice);
			$("#"+id).html(title+"(-"+discount+"%)"+dcprice+"원");
			
			$("#_dcpricee").val(dcprice);
			$("#_dcpricee").removeAttr("id");
			
		}
	</script>