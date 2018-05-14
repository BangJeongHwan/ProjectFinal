<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>    

<%
LoginDto mem = (LoginDto)session.getAttribute("login");
if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>

<style>

#product{
	width: 80%;
	height: 100%;
	background-color: white;
	margin : 0 auto;
	align: center;
}


.pro_detail{

width: 40%;
height: 200px;
 float: left;
 border: 1px;
 margin-left: 110px;


}

.pro_detail2{
margin-top: 20px;
 margin-left: 30px;
width: 40%;
height: 400px;
 float: left;
 border: 1px;

 
}


#detail_tab{
text-align: center;
width: 70%;
margin : 0 auto;
}

.detail_detail{
text-align: center;
margin : 0 auto;
align: center;
}

#ordertable{

font-size: 16px; 
padding: 15px; 
cellpadding: 6px;
cellspacing: 6px;
}

td{
height: 30px;
}

.cardname{
text-align: left;
margin-top: 20px;
margin-bottom: 20px;
}

.review_table{
text-align: center;
align: center;
}

h2{
border-bottom: 1px solid lightgray;
padding: 5px;
}

.pro_image{
margin-top: 50px;
margin-left: 50px;

}

#detail_04{
margin: 0 auto;
width: 70%;
}


</style>
<div id = "product">
<form name="frmForm" id="_frmForm" action="cdBasket.do" method="post">
	<input type="hidden" name="pdseq" value="${ dto.cdseq }">
	<input type="hidden" name="rpdseq" value="${ dto.cdseq }">
	<input type="hidden" name="cmd" id="_cmd" value="bsk">
<div class = "pro_detail" >

<div class="pro_image">
<img style="width: 300px; height:300px;"name="picture" src = "upload/${dto.picture0}">
</div>
</div>
	<div class = "pro_detail2" >
	<div class="orderdetail">
		<div class="cardname">
		<table>
		<colgroup>
		<col width="50%"><col width="50%">
		</colgroup>
			<tr>
			<td colspan="2" style="font-size:40px;border-bottom: 1px solid lightgray;">${dto.title }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>

				<img src="images/likebefore.png" id="likedetail" name="likedetail" onClick="like()" style="width: 60px;">

			<c:if test="${jjdto == 'true' }">
				<img src="images/heart.gif" id="likedetail" name="likedetail" onClick="like()" style="width: 60px;">
			</c:if>
			</td>
			</tr>
		</table>
	</div>
	<table id="ordertable">
		<tr >
			<td>소비자가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td colspan ="2" class = "pro_price" id="pro_price">
			<input type="text" name="ori_price" id="ori_price" value= "${dto.price}" readonly="readonly">원
			</td>
		</tr>
		<tr>	
			<td>구매수량   </td>
				<td colspan ="2">
					<select class="card_amount" name="card_amount" id="card_amount">
						<option value="100">100매</option>
						<option value="200">200매</option>
						<option value="300">300매</option>
						<option value="400">400매</option>
						<option value="500">500매</option>
						<option value="600">600매</option>
						<option value="700">700매</option>
						<option value="800">800매</option>
						<option value="900">900매</option>
						<option value="1000">1000매</option>
					</select>
				</td>
		</tr>
		
		<tr>
			<td>봉투옵션   </td>
				<td colspan = "2">
					<select class = "card_bag" name = "card_bag" >
					<option value="0">일반봉투 <br>
					0원 (1,000장)</option>
					<option value="20000">컬러봉투(핑크베이지) <br>
					20,000원 (1,000장)</option>
					<option value="30000">컬러봉투(스카이블루) <br>
					30,000원 (1,000장)</option>
					</select>
				</td>
		</tr>
			
		<tr>
		
			<td>구입총액   </td>
				<td><input type="text" name="total_price" id="total_price"> 원</td><!-- function으로 값을 계산해서 뿌려줌 -->
				<td><button onclick = "totbtn()">총 금액</button></td>
		</tr>
		<tr style="border-top: 1px solid lightgray">
			<td>배송비   </td>
			<td colspan="2">무료배송</td>
		</tr>
		<tr style="border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
			<td rowspan = "2">제작기간</td>
				<td> 지금 주문하시면, <br>
				지금 초안 확정하시면, </td>
				<td><span class = "pro_date" id = "pro_date" ></span>초안완료<br>
				<span class = "pro_date2" id = "pro_date2" ></span>발송완료</td>
<!-- 				<td><button id = "datebtn">날짜계산</button></td> -->
		</tr>
		
	</table>
	<br>
	<button onclick="bskBtn()">장바구니</button>
	<button id = "orderbtn">주문하기</button>
	</div>
	</div>
</form>


<br><br>
<div id="detail_tab">
<table id ="detail_menu" border="1" style="font-size: 15px; border: 1px solid lightgray; text-align: center; align: center;" >
<col width="320"><col width="320"><col width="320"><col width="320">
	<tr>
		<td><a href ="#detail_01">상품 상세정보</a></td>
		<td><a href = "#detail_02">제작 일정</a>
		<td><a href = "#detail_03">주문/배송</a></td>
		<td><a href = "#detail_04">이용후기</a></td>
	</tr>

</table>
</div>


<div class="detail_detail">
<!-- 상품디테일 이미지 -->
<div id ="detail_01">

	<div class = "detail_image">
		<!-- 이미지 자리 -->
		<img src="upload/${dto.picture1} ">
	</div>
</div>
<br>
<br>

<div id ="detail_02">
<!-- <h4>제작일정</h4>style border-bottm:  -->
	<div class = "detail_image">
		<img src = "upload/${dto.picture2}">
	</div>
</div>
<br>

<div id ="detail_03">
<!-- <h4>주문/배송</h4>style border-bottm:  -->
	<div class = "detail_image">
		<img src = "upload/${dto.picture3}">
	</div>
</div>
<br>
<br>
<!-- 이용후기 리스트  -->
<div id ="detail_04">
<form name="frmForm1" id="_frmForm1" action="" method="post" >
<h4>이용후기</h4><!-- style border-bottm:  -->

	<div class = "review_table" id="review_table">
		<table border="1" class="table">	
			<tr class="tr">
				<th  width="50px">No</th>
				<th width="400px">제목</th>
				<th width="50px">작성자</th>
				<th width="50px">추천수</th>
				<th width="50px">등록일</th>
			</tr>
			<c:if test="${empty rlist}">
			<tr>
		<td colspan="5" class="td">등록된 리뷰가 없습니다.</td>
			</tr>
			</c:if>
			<c:forEach var="rlist" items="${rlist}" varStatus="rlistS">
			<tr class="tr">
				<td>${rlistS.count}</td>
				<td><a href = 'rdetail.do?rseq=${rlist.rseq}'>${rlist.title}</a></td>
				<td>${rlist.mid}</td>
				<td>${rlist.rlike}</td>
				<td>${rlist.rdate}</td>
			</tr>
			</c:forEach>
		</table>
		
		<input type="hidden" name="rpdseq" value="${dto.cdseq}">
		<input type="hidden" name="pname" value="${dto.title}">
		<button id="review_btn">이용후기 쓰기</button>
	</div>
	</form>
</div>
</div>
</div>

<script type="text/javascript">
function totbtn(){
var ori_price = parseInt($("#ori_price").val());
var c_option1 = parseInt($("select[name=card_amount] option:selected").val());
var c_option2 = parseInt($("select[name=card_bag] option:selected").val());

$("#total_price").val((ori_price * c_option1 + c_option2));
};

$("#review_btn").click(function() {
	alert('후기');
	$("#_frmForm1").attr({ "target":"_self", "action":"rwrite.do?rpdseq=${dto.cdseq}"}).submit();
});

$("#bskBtn()").click(function() {
	$("#_frmForm").attr({ "target":"_self", "action":"cdBasket.do"}).submit();
});

$("#orderbtn").click(function() {
	/* ★내부 수정 */
	//$("#_frmForm").attr({ "target":"_self", "action":"cardorder.do" }).submit();
	alert('장바구니');
	$("#_cmd").val("pay");
	$("#_frmForm").attr({ "target":"_self", "action":"cdBasket.do" }).submit();
});

$("#review_btn").click(function() {
	alert('review');						
	$("#_frmForm1").attr({ "target":"_self", "action":"rwrite.do" }).submit();
	
});

function like(){
	var cdseq = ${dto.cdseq};
	var usid = "<%=mem.getId()%>";
	$.ajax({
		url:"like.do",
		type:"get",
		data:"pdseq="+cdseq+"&usid="+usid,
		success:function(msg){
			if(msg){
				$("#likedetail").attr("src","images/heart.gif");
				alert("해당 상품이 찜 목록에 추가되었습니다.");
			}else{
				$("#likedetail").attr("src","images/likebefore.png");
				alert("해당 상품이 찜 목록에서 삭제되었습니다.");
			}
		},
		error:function(reqest, status, error){
			alert("해당 삼품이 찜 목록에 추가되지 않았습니다.");
		}
	});	
}

$("#datebtn").click(function(){
var newDate=new Date();
var yy = newDate.getFullYear();
var mm = newDate.getMorth()+1;
var dd = newDate.getDate();
if(dd<10){dd='0'+dd}
if(mm<10){mm='0'+mm}
var toDay = yy + mm + dd;
var getdate = new Date(toDay);
getdate.setDate(getdate.getDate()+3);
var getdate2 = new Date(toDay);
getdate2.setDate(getdate2.getDate()+7);

$("#pro_date").text(getdate);
$("#pro_date2").text(getdate2);
});
</script>
