<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<style type="text/css">
table {
	width: 1000px;
	border: 1px solid #EBEBEB;
	align-content: center;
	cursor: default;
}
tr{
	padding:  20px 20px;
	height: 60px;
}
th{
	background-color:#F8F8F8;
	align-content: center;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
}
td{
	align-content: center;
	text-align: center;
}
</style>

<body>
<c:if test="${ not empty flag && flag eq 'noReserv'}">
	<script type="text/javascript">
		if (confirm("이미 예약된 날짜입니다. 해당 상품 페이지로 이동하시겠습니까?")) {
			location.href = "viewPdseqPage.do?pdseq=" + ${flagPdseq};
		}
	</script>
</c:if>

<!-- ★붙은 곳 알아서 수정 -->

<div align="center">
	<div align="center">
		<form id="_bskFrm" action="bskDel.do" method="post" onsubmit="return checkSubmit()">
			<table>
				<colgroup>
					<col width="5%"><col width="5%"><col width="15%"><col width="15%"><col width="40%"><col width="10%"><col width="10%">
				</colgroup>
				<tr>
					<th>
						<input type="checkbox" id="_allck" onclick="allcheck(this.checked)">
					</th>
					<th>번호</th>
					<th>상품정보</th>			<!-- 회사명 혹은 상품명 -->
					<th>품목</th>			<!-- 청첩장, 웨딩홀, 스튜디오 등 -->
					<th>옵션</th>
					<th>가격</th>
					<th>선택</th>			<!-- 결제/삭제 -->
				</tr>
				<c:if test="${ empty bskList }">
					<tr>
						<td colspan="7">장바구니에 담긴 상품이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${ bskList }" var="bsk" varStatus="i">
					<tr>
						<td>
							<input type="checkbox" name="bkseq" value="${bsk.bkseq}">
						</td>
						<td>${i.count}</td>
						<td style="align-content: left; text-align: left;">
							<c:choose>
								<c:when test="${bsk.pdseq >= 2000 && bsk.pdseq < 3000}">
									<a href="viewPdseqPage.do?pdseq=${bsk.pdseq}">
										<img src="upload/${bsk.pdDto.picture0}" alt="사진없음" style="width:50px;height: 50px;"/>
										&nbsp;&nbsp;${bsk.pdDto.title}
									</a>
								</c:when>
								<c:when test="${bsk.pdseq >= 3000 && bsk.pdseq < 4000}">
									<a href="viewPdseqPage.do?pdseq=${bsk.pdseq}">
										<img src="upload/${bsk.pdDto.pic1}" alt="사진없음" style="width:50px;height: 50px;"/>
										&nbsp;&nbsp;${bsk.pdDto.cname}
									</a>
								</c:when>
								<c:when test="${bsk.pdseq >= 5000 && bsk.pdseq < 6000}">
									<a href="viewPdseqPage.do?pdseq=${bsk.pdseq}">
										<img src="upload/${bsk.pdDto.pic1}" alt="사진없음" style="width:50px;height: 50px;"/>
										&nbsp;&nbsp;${bsk.pdDto.cname}
									</a>
								</c:when>
								<c:otherwise>스파이</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${bsk.pdseq >= 1000 && bsk.pdseq < 2000}">웨딩홀</c:when>
								<c:when test="${bsk.pdseq >= 2000 && bsk.pdseq < 3000}">청첩장</c:when>
								<c:when test="${bsk.pdseq >= 3000 && bsk.pdseq < 4000}">스튜디오</c:when>
								<c:when test="${bsk.pdseq >= 5000 && bsk.pdseq < 6000}">메이크업</c:when>
								<c:otherwise>스파이</c:otherwise>
							</c:choose>
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
						<td>${bsk.total_price}</td>
						<td>
							<a href="bskPayView.do?bkseq=${bsk.bkseq}">결제</a><br>
							<a href="bskDel.do?bkseq=${bsk.bkseq}">삭제</a>
						</td>
					</tr>
				</c:forEach>
					<tr>
						<td colspan="7">
							<button type="button" onclick="bskPay()">결제</button>&nbsp;&nbsp;
							<button type="button" onclick="bskDel()">삭제</button>
						</td>
					</tr>
			</table>
		</form>
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


</script>






</body>











