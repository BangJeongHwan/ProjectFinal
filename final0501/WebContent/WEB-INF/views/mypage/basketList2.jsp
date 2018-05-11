<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/bootstrap.min.js"></script>

<style type="text/css">

.backet {
	width: 1000px;
	border: 1px solid #EBEBEB;
	align-content: center;
	cursor: default;
}
.backet tr{
	padding:  20px 20px;
	height: 60px;
}
.backet th{
	background-color:#F8F8F8;
	align-content: center;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
}
.backet td{
	align-content: center;
	text-align: center;
}
.cpbtn{
    border: 5px solid inherit;
    background: none;
    border-radius: 15px;
    font-size: 13px;
    font-weight: bold;
    padding: 5px 10px;
}
</style>


<c:if test="${ not empty flag && flag eq 'noReserv'}">
	<script type="text/javascript">
		if (confirm("이미 예약된 날짜입니다. 해당 상품 페이지로 이동하시겠습니까?")) {
			location.href = "viewPdseqPage.do?pdseq=" + ${flagPdseq};
		}
	</script>
</c:if>

<!-- ★붙은 곳 알아서 수정 -->
<h1>장바구니</h1>

<form id="_bskFrm" action="bskDel.do" method="post" onsubmit="return checkSubmit()"> 
    

    
<!-----------------------------------------------------  결제예정 div ------------------------------------------------------------->

<div style="position: fixed;margin-left: 82%;margin-top: auto;width: 15%;background-color: #555555;padding:  5px 5px;">
<font style="color: white; font-size: 18px; font-weight: 900">결제금액 계산기</font>
	<table style="width: 100%; background-color: white; margin-top: 10px;">
		<tr style="background-color: #fcf4f4;color: #c03d3d;font-size: 12px;font-weight:  bold;height: 40px;">
			<td>상품금액 합계</td>
			<td style="text-align: left;"><input type="text" readonly="readonly" value="0" style="border: none;background: none; text-align: right;" size="7" id="_pdprice">원</td>
		</tr>
		<tr style="font-size: 11px; height: 40px;">
			<td>최대할인 합계</td>
			<td style="text-align: left;">
				<input type="text" readonly="readonly" value="(-0)" style="border: none;background: none; text-align: right;" size="7" id="_dcprice">원
			</td>
			
		</tr>
			<tr style="height: 40px;">
				<td colspan="2">
					<hr width="90%" style="margin-left: 5%">
				</td> 
			</tr>		
		<tr>
			<td style="line-height: 30px; text-align: right; padding-right: 15px;" colspan="2">
				<font style="font-size: 15px; font-weight: bold;">총 결제 예정 금액</font> <br>
				<!-- <font style="color: #c03d3d; font-size: 35px; font-weight: bold;">0원</font> -->
				<input type="text" style="color: #c03d3d; font-size: 35px; font-weight: bold;border: none;background: none; text-align: right;" readonly="readonly" id="_allprice" size="7" value="0">원
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="bskPay()" style="border: none; background: none; "><img src="<%=request.getContextPath() %>/assets/images/pay/btn_cart3.png"></button>
				 <button type="button" onclick="bskDel()" style="padding: 10px 25px; font-size:  20px; font-weight:  bold; color:  white; border: none;">삭제</button> 
		</tr>
	</table>

</div>
<div align="center">
	<div align="center">
<!----------------------------------------------------- 여기까지 결제예정 div ------------------------------------------------------------->		
		
		

				<!-----------------------------------------------------  청첩장  ------------------------------------------------------------->
			<table class="backet">
				<colgroup>
					<col width="5%"><col width="15%"><col width="40%"><col width="20%"><col width="10%"><col width="10%">
				</colgroup>
				
				<tr>
					<th colspan="7"><h3>청첩장</h3></th>
				</tr>
				
					<tr>
						<th>
							<input type="checkbox" id="_allck" onclick="allcheck(this.checked)">
						</th>
						<th>상품정보</th>			<!-- 회사명 혹은 상품명 -->
						<th>옵션</th>
						<th>할인</th>
						<th>가격</th>
						<th>선택</th>			<!-- 결제/삭제 -->
					</tr>
					<c:if test="${ !cFlag }">
						<tr>
							<td colspan="7">장바구니에 담긴 상품이 없습니다.</td>
						</tr>
					</c:if>
				
					<c:if test="${ cFlag }">
						<c:forEach items="${ bskList }" var="bsk" varStatus="i">
						
							<c:choose>
							
								<c:when test="${bsk.pdseq >= 2000 && bsk.pdseq < 3000}">
									<tr>
										<td>
											<input type="checkbox" name="bkseq" value="${bsk.bkseq}">
										</td>
										
										<td style="align-content: left; text-align: left;">
													<a href="viewPdseqPage.do?pdseq=${bsk.pdseq}">
													<img src="upload/${bsk.pdDto.picture0}" alt="사진없음" style="width:50px;height: 50px;"/>
													&nbsp;&nbsp;${bsk.pdDto.title}
									</a>
										</td>
										<td style="text-align: left">
											<c:forEach items="${bsk.optionList}" var="option" varStatus="j">
												<c:if test="${j.index eq 0}">
													${option}
												</c:if>
												<c:if test="${j.index ne 0}">
													&nbsp;/&nbsp;${option}
												</c:if>
											</c:forEach>
											<c:if test="${not empty bsk.reservDto}">
												&nbsp;/&nbsp;${bsk.reservDto.redate}
												&nbsp;/&nbsp;${bsk.reservDto.retime}
											</c:if>
										</td>
							
										<td>
											<button type="button" class="cpbtn" value="${bsk.bkseq}" id="_cpbtn${i.index}" onclick="cpfunc('add',${i.index},'${bsk.bkseq}')">사용가능 쿠폰</button>
										</td>
								
										<td>
											<input type="text" value="${bsk.total_price}" style="border: none; 
											background: none; text-align: right;" size="8" readonly="readonly" id="totalprice${i.index}">원
										</td>
											
									  	<td>
											<a href="bskPayView.do?bkseq=${bsk.bkseq}">결제</a><br>
											<a href="bskDel.do?bkseq=${bsk.bkseq}">삭제</a>
										</td>
									</tr>			
								</c:when>
								
							</c:choose>
						</c:forEach>
				</c:if>
			</table>
			<br>
	
			<!-----------------------------------------------------  스튜디오  ------------------------------------------------------------->
			<table class="backet">
				<colgroup>
					<col width="5%"><col width="15%"><col width="40%"><col width="20%"><col width="10%"><col width="10%">
				</colgroup>
				
				<tr>
					<th colspan="7"><h3>스튜디오</h3></th>
				</tr>
				
					<tr>
						<th>
							<input type="checkbox" id="_allck" onclick="allcheck(this.checked)">
						</th>
						<th>상품정보</th>			<!-- 회사명 혹은 상품명 -->
						<th>옵션</th>
						<th>할인</th>
						<th>가격</th>
						<th>선택</th>			<!-- 결제/삭제 -->
					</tr>
					<c:if test="${ !sFlag }">
						<tr>
							<td colspan="7">장바구니에 담긴 상품이 없습니다.</td>
						</tr>
					</c:if>
				
					<c:if test="${ sFlag }">
						<c:forEach items="${ bskList }" var="bsk" varStatus="i">
						
							<c:choose>
							
								<c:when test="${bsk.pdseq >= 3000 && bsk.pdseq < 4000}">
									<tr>
										<td>
											<input type="checkbox" name="bkseq" value="${bsk.bkseq}">
										</td>
										
										<td style="align-content: left; text-align: left;">
													<a href="viewPdseqPage.do?pdseq=${bsk.pdseq}">
													<img src="upload/${bsk.pdDto.pic1}" alt="사진없음" style="width:50px;height: 50px;"/>
													&nbsp;&nbsp;${bsk.pdDto.cname}
									</a>
										</td>
										<td style="text-align: left">
											<c:forEach items="${bsk.optionList}" var="option" varStatus="j">
												<c:if test="${j.index eq 0}">
													${option}
												</c:if>
												<c:if test="${j.index ne 0}">
													&nbsp;/&nbsp;${option}
												</c:if>
											</c:forEach>
											<c:if test="${not empty bsk.reservDto}">
												&nbsp;/&nbsp;${bsk.reservDto.redate}
												&nbsp;/&nbsp;${bsk.reservDto.retime}
											</c:if>
										</td>
							
										<td>
											<button type="button" class="cpbtn" value="${bsk.bkseq}" id="_cpbtn${i.index}" onclick="cpfunc('add',${i.index},'${bsk.bkseq}')">사용가능 쿠폰</button>
										</td>
								
										<td>
											<input type="text" value="${bsk.total_price}" style="border: none; 
											background: none; text-align: right;" size="8" readonly="readonly" id="totalprice${i.index}">원
										</td>
											
									  	<td>
											<a href="bskPayView.do?bkseq=${bsk.bkseq}">결제</a><br>
											<a href="bskDel.do?bkseq=${bsk.bkseq}">삭제</a>
										</td>
									</tr>			
								</c:when>
								
							</c:choose>
						</c:forEach>
				</c:if>
			</table>
			<br>
			
	
			<!-----------------------------------------------------  메이크업  ------------------------------------------------------------->
			<table class="backet">
				<colgroup>
					<col width="5%"><col width="15%"><col width="40%"><col width="20%"><col width="10%"><col width="10%">
				</colgroup>
				
				<tr>
					<th colspan="7"><h3>메이크업</h3></th>
				</tr>
				
					<tr>
						<th>
							<input type="checkbox" id="_allck" onclick="allcheck(this.checked)">
						</th>
						<th>상품정보</th>			<!-- 회사명 혹은 상품명 -->
						<th>옵션</th>
						<th>할인</th>
						<th>가격</th>
						<th>선택</th>			<!-- 결제/삭제 -->
					</tr>
					<c:if test="${ !mFlag }">
						<tr>
							<td colspan="7">장바구니에 담긴 상품이 없습니다.</td>
						</tr>
					</c:if>
				
					<c:if test="${ mFlag }">
						  <c:forEach items="${ bskList }" var="bsk" varStatus="i">
					
							
								<c:if test="${bsk.pdseq >= 5000 && bsk.pdseq < 6000}">
									<tr>
										<td>
											<input type="checkbox" name="bkseq" value="${bsk.bkseq}">
										</td>
										
										
										 <td style="align-content: left; text-align: left;">
													<a href="viewPdseqPage.do?pdseq=${bsk.pdseq}">
														<img src="upload/${bsk.pdDto.pic1}" alt="사진없음" style="width:50px;height: 50px;"/>
														&nbsp;&nbsp;${bsk.pdDto.cname}
													</a>
													
										</td> 
										
										<td>
											<c:forEach items="${bsk.optionList}" var="option" varStatus="j">
												<c:if test="${j.index eq 0}">
													${option}
												</c:if>
												<c:if test="${j.index ne 0}">
													&nbsp;/&nbsp;${option}
												</c:if>
											</c:forEach>
											<c:if test="${not empty bsk.reservDto}">
												&nbsp;/&nbsp;${bsk.reservDto.redate}
												&nbsp;/&nbsp;${bsk.reservDto.retime}
											</c:if>
										</td>
									
										<td>
											<button type="button" class="cpbtn" value="${bsk.bkseq}" id="_cpbtn${i.index}" onclick="cpfunc('add',${i.index},'${bsk.bkseq}')">사용가능 쿠폰</button>
										</td>
								
										<td>
											<input type="text" value="${bsk.total_price}" style="border: none; 
											background: none; text-align: right;" size="8" readonly="readonly" id="totalprice${i.index}">원
										</td>
											
									  	<td>
											<a href="bskPayView.do?bkseq=${bsk.bkseq}&dcprice=0">결제</a><br>
											<a href="bskDel.do?bkseq=${bsk.bkseq}">삭제</a>
										</td>
									</tr>		
								</c:if>
							
						</c:forEach>	
				</c:if>
			</table>
			
		
		
	</div>
</div> 
<input type="hidden" value="0" name="dcprice"><!--쿠폰없을경우  null막기위해-->
</form> 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
       
       	<div class="modal-footer">
        	<button type="button" class="btn btn-default" id="modalbtn">적용</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
        </div>
      </div>
      
    </div>
  </div>
    
    
    
<script type="text/javascript">

// form action을 실행하기 전 체크된 대상이 있는지 확인한다.
function checkSubmit() {
	
	var bkseqCk = document.getElementsByName("bkseq");
	var flag = false;
	for (var i = 0; i < bkseqCk.length; i++) {
		if (bkseqCk[i].checked) {
			flag = true;
			break;
		}
	}
	
	if (!flag) alert("하나 이상의 상품을 선택해주세요.");
	
	return flag;
}

function bskPay() {
	$("#_bskFrm").attr("action", "bskPayView.do").submit();
}
function bskDel() {
	$("#_bskFrm").attr("action", "bskDel.do").submit();
}

//전부를 체크하거나 체크를 해제하는 함수
function allcheck(checkedFlag) {

	var bkseqCk = document.getElementsByName("bkseq");

	for (var i = 0; i < bkseqCk.length; i++) {
		bkseqCk[i].checked = checkedFlag;
	}
}



$("input:checkbox").change(function () {
	var pdprice=0;	
	var dcprice=0;
	var allprice=0;
	   $("input:checkbox").each(function() {
		   if($(this).is(":checked")){
			 var price = $(this).parent().parent().children(":eq(4)").children().val(); 
			 var dcp = $(this).parent().parent().children(":eq(3)").children(":eq(2)").val(); 
			
			 /*  _allprice _dcprice _pdprice */
			
			 
			   if(price != "undefined" && price != null){
				   price = Number(price);
				   pdprice = pdprice + price;  
			   }
			   console.log("dcp1 = " + dcp);
			   if(dcp != "NaN" && dcp != null && dcp != "undefined"){
				   dcp = Number(dcp);
				   dcprice += dcp;
			   }
			   
			   pdprice=Number(pdprice);
			   dcprice=Number(dcprice);
			   allprice=Number(allprice);
			   
			   console.log("price = " + price);
			   console.log("dcp2 = " + dcp);
			   console.log("pdprice = " + pdprice);  
			   console.log("dcprice = " + dcprice);  
			   allprice=pdprice-dcprice;	
			   console.log("allprice = " + allprice);  
			     
		   }
		   $("#_pdprice").val(pdprice);
		   $("#_dcprice").val(dcprice);
		   $("#_allprice").val(allprice); 
		   
	   });
	   
	   
});




function cpfunc(command,num,bks) {
	console.log(command);
	console.log("num"+num);
	
	
	if(command =="del"){
		var CdivId = "#_cdiv"+num;
		var ChiddenDcp = "#dcp"+num;
		var ChuddenCpseq = "#cpseq"+num;
		var Cdelbtn = "#_delbtn"+num;
		var Ccpbtn = "_cpbtn"+num;
		
		var upseq = $(ChuddenCpseq).val();
		
		$(CdivId).parent().append("<button type='button' class='cpbtn' value='"+bks+"' id='_cpbtn"+num+"'>사용가능 쿠폰</button>");
		$("#_cpbtn"+num).attr("onclick","cpfunc('add',"+num+","+bks+")");
		
		$(CdivId).remove();
		$(ChiddenDcp).remove();
		$(Cdelbtn).remove();
		$(ChuddenCpseq).remove();
		
		$.ajax({
			url:"cpbkseqdel.do",
			type:"get",
			data:"seq="+upseq,
			 async : true,
			 success : function(msg){
				 console.log(msg);
			 }
		}); 
		
	}else if(command =="add"){
		var param = new Object();
		
		param.command=command;
		param.num=num;
		param.bkseq=bks;
		
		$.ajax({
			url:"myCp.do",
			type:"post",
			data:param,
			 async : true,
			 success : function(html){
				 var page = html;
				 $(".modal-content").html(page);
				 $("#myModal").modal();
			 }
		});
	}
	
	
}

</script>















