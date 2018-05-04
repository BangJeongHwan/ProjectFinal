<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
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
width: 80%;
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

</style>

<div id = "product">
<form name="frmForm" id="_frmForm" action="cardwriteAf.do" method="post" 
enctype="multipart/form-data">

<div class = "pro_detail" >
<div class="pro_image">
<img src = "assets/images/${dto.picture0}">
</div>
</div>
	<div class = "pro_detail2" >
	<div class="orderdetail">
		<!-- <h3><strong><span id="card_code"></span></strong><span id="card_name"></span></h3> -->
		<div class="cardname">
		<h2>${dto.title}</h2>
		</div>
	
	<table id="ordertable">
		<tr >
			<td>소비자가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td colspan ="2" class = "pro_price" id="pro_price"><span class = "ori_price" id = "ori_price"> ${dto.price}</span><em>원</em>
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
					<option value="500">500매 </option>
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
				<td><span class = "total_price" id = "total_price"> </span>원</td><!-- function으로 값을 계산해서 뿌려줌 -->
				<td><button id = "totbtn">총 금액</button></td>
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
</div>
</div>

<table>
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>
	<tr>
		<td>업체아이디</td>
		<td><input type="text" name = "cid"></td>
	</tr>
	<tr>
		<td>업체사진</td>
		<td><input type = "file" name="pname" style=" width : 400px;"></td>
	</tr>
	<tr>
		<td>소개글</td>
		<td><textarea rows="10" cols="50" name="content" id="_content"></textarea></td>
	</tr>
	<tr>
	<td colspan="2">
	<span><a href="#none" id="card_write" title="글쓰기">글쓰기</a></span>
	</td>
	</tr>
</table>

</form>
</div>