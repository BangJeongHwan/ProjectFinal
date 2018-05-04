<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<style type="text/css">
.payTbl table {
	width: 1000px;
	border: 1px solid #EBEBEB;
	align-content: center;
	cursor: default;
}
.payTbl tr{
	padding:  20px 20px;
	height: 60px;
}
.payTbl td{
	align-content: center;
	text-align: center;
	background-color: #fff;
}
.th td{
	background-color:#F8F8F8;
	align-content: center;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
}
/* cpo */
.cpo{
	padding:15px;
	background-color: #e3e3e3;
}
.cpo_content{
	background-color:white;
	padding:20px 30px;
	border-radius: 10px;
	border: 2px solid #50627a;
}
.infoTbl tr{
	padding: 5px 5px;
	height:40px;
}
.infoTbl th{
	padding: 5px;
	height: 40px;
	background-color:#F8F8F8;
	align-content: center;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	border-right: 1px solid #F8F8F8;
}
</style>

<script type="text/javascript">
var paySize = 0;
</script>
 
<!--paySize setting  -->
<c:forEach items="${ payList }" var="pay" varStatus="i">
	<script type="text/javascript">
		paySize++;
	</script>
</c:forEach>


<body>
<br><br>
<h3>결제 내역</h3>
<div align="center">
	<div align="center">
		<table class="payTbl">
			<colgroup>
				<col width="5%">
			</colgroup>
			<tr class="th">
				<td>번호</td>
				<td>상품명</td>
				<td>봉투</td>
				<td>매수</td>
				<td>단가</td>
				<td>총액</td>
			</tr>
			<c:forEach items="${ payList }" var="pay" varStatus="i">
				<tr onclick="clickCdTd(${i.index})" style="cursor:pointer">
					<td>${i.count}</td>
					<td>${pay.pdDto.title}</td>
					<td>${pay.option2}</td>
					<td>${pay.option1}</td>
					<td>${pay.pdDto.price}</td>
					<td>${pay.total_price}</td>
				</tr>
				<tr style="padding: 0px 0px;height:0px" id="_cpoTd${i.index}" >
					<td>&nbsp;</td>
					<td colspan="5" style="align-content: center;text-align: center;padding: 15px">
<!-- 청첩장 상세 : _cpoTd에 들어가는 내용 -->
<div id = "product" style="width:80%;">
	<div class="order2">
		<h4>>>기본인쇄 정보</h4>
		<div class="cpo">
			<h6>인사말/폰트</h6>
			<div>
				<table style="border:none">
					<colgroup>
						<col width="50%"><col width="50%">
					</colgroup>
					<tr>
						<td>
							<textarea rows="10" cols="50" id="_content" style="resize:none" readonly>${pay.cpoDto.content}</textarea><br>
						</td>
						<td>${pay.cpoDto.font}</td>
					</tr>
				</table>
			</div>
			<h6>정보</h6>
			<div>
				<table style="border:none">
					<colgroup>
						<col width="50%"><col width="50%">
					</colgroup>
					<tr>
						<td>
							신랑/신부 정보<br>
							<table style="width:100%" class="infoTbl">
								<colgroup>
									<col width="20%"><col width="40%"><col width="40%">
								</colgroup>
								<tr>
									<th class="cpoTh">&nbsp;</th>
									<th class="cpoTh">신부</th>
									<th class="cpoTh">신랑</th>
								</tr>
								<tr>
									<th class="cpoTh">부</th>
									<td>${pay.cpoDto.wfname}</td>
									<td>${pay.cpoDto.mfname}</td>
								</tr>
								<tr>
									<th class="cpoTh">모</th>
									<td>${pay.cpoDto.wmname}</td>
									<td>${pay.cpoDto.mmname}</td>
								</tr>
								<tr>
									<th class="cpoTh">관계</th>
									<td>${pay.cpoDto.wc}</td>
									<td>${pay.cpoDto.mc}</td>
								</tr>
								<tr>
									<th class="cpoTh">성명</th>
									<td>${pay.cpoDto.wname}</td>
									<td>${pay.cpoDto.mname}</td>
								</tr>
							</table>
						</td>
						<td style="vertical-align: top">
							웨딩홀 정보<br>
							<table style="width:100%" class="infoTbl">
								<colgroup>
									<col width="30%"><col width="70%">
								</colgroup>
								<tr>
									<th class="cpoTh">예약일시</th>
									<td>${pay.cpoDto.cpdate}</td>
								</tr>
								<tr>
									<th class="cpoTh">주소</th>
									<td>${pay.cpoDto.cpadd}</td>
								</tr>
								<tr>
									<th class="cpoTh">전화번호</th>
									<td>${pay.cpoDto.cptel}</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<p style="width:80%;background: gray;text-align: center;cursor:pointer;" onclick="clickCdTd(${i.index})"><font color="white">접기</font></p>
<!-- 청첩장 상세 : 종료 -->
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<script type="text/javascript">
//청첩장 상세 접기/펼치기
function clickCdTd(index) {
 	var tdId = "#_cpoTd" + index;
	$(tdId).toggle();
}

for (var i = 0; i < paySize; i++) {
	clickCdTd(i);
}

</script>



</body>











