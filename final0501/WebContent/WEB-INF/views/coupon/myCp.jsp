<%@page import="kh.com.a.model2.LoginDto"%>
<%@page import="kh.com.a.model.MemberDto"%>
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
.upbtn{
    background: #00bb00;
    color: white;
    border: none;
    border-radius: 10px;
    padding: 4px 10px;
    font-weight: bold;
}
.delbtn{
	background: #ff5555;
    color: white;
    border: none;
    border-radius: 10px;
    padding: 4px 10px;
    font-weight: bold;
    margin-left: 7px;
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
</div> 


	<script type="text/javascript">
	var num = "${num}";
	var command = "${command}";
	var bkseq = "${bkseq}";
	
	var btnid = "#_cpbtn"+num;
	var totalprice = "#totalprice"+num;
	var price = $(totalprice).val();
	
	
	
 	function trclick(seq) {
 		console.log(seq);
			$.ajax({
				url:"getCp.do",
				type:"post",
				data:"seq="+seq,
				 async : true,
				 success : function(mcp){
					 createDiv(mcp.seq,mcp.title,mcp.discount,bkseq);
				 }
			});
		
			
			var data = {
					seq: seq,
					bkseq: bkseq,
			};
			
			$.ajax({
				url:"cpbkseq.do",
				type:"get",
				data:data,
				 async : true,
				 success : function(msg){
					 console.log(msg);
				 }
			}); 
			
			$(".close").click();
		} 
 	 function createDiv(seq,title,discount,bkseq) {
 		
		
			
			dcprice = price*0.01*discount;
			dcprice = Math.ceil(dcprice);
			console.log("price"+price);
			console.log("dcprice"+dcprice);
			console.log("bkseq"+bkseq);
			
			$(btnid).parent().append("<div id='_cdiv"+num+"'>"+title+"(-"+discount+"%)"+dcprice+"원"+"</div>");
			$(btnid).parent().append("<button type='button' class='delbtn' id='_delbtn"+num+"'>삭제</button>");
			$("#_delbtn"+num).attr("onclick","cpfunc('del',"+num+","+bkseq+")");
			
			$(btnid).parent().append("<input type='hidden' value='"+dcprice+"' id='dcp"+num+"'>");
			$(btnid).parent().append("<input type='hidden' value='"+seq+"' id='cpseq"+num+"'>");
			
			$(btnid).remove();
		}
 	 
	</script>