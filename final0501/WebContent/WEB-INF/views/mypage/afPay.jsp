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

<div align="center">
	<div align="center">
		<h1>결제가 완료되었습니다.</h1>
		<table>
				<colgroup>
					<col width="5%"><col width="95%">
				</colgroup>
				<c:forEach items="${ payList }" var="pay" varStatus="i">
					<tr>
						<td>${i.count}</td>
						<c:choose>
							<c:when test="${pay.pdseq >= 5000 && pay.pdseq < 6000}">
								<td>
									<!-- 메이크업 -->
									<table style="width:100%">
										<colgroup>
											<col width="20%"><col width="20%"><col width="40%"><col width="20%">
										</colgroup>
										<tr>
											<td>
												<img src="upload/${pay.pdDto.pic1}" alt="사진없음" style="width:50px;height: 50px;"/>
												&nbsp;&nbsp;${pay.pdDto.cname}
											</td>
											<td>메이크업</td>
											<td>
												${pay.option1}&nbsp;/&nbsp;${pay.reservDto.redate}&nbsp;/&nbsp;${pay.reservDto.retime}
											</td>
											<td>${pay.total_price}</td>
										</tr>
									</table>								
								</td>
							</c:when>
							<c:when test="${pay.pdseq >= 3000 && pay.pdseq < 4000}">
								<td>
									<!-- 스튜디오 -->
									<table style="width:100%">
										<colgroup>
											<col width="20%"><col width="20%"><col width="40%"><col width="20%">
										</colgroup>
										<tr>
											<td>
												<img src="upload/${bsk.pdDto.pic1}" alt="사진없음" style="width:50px;height: 50px;"/>
												&nbsp;&nbsp;${pay.pdDto.cname}
											</td>
											<td>스튜디오</td>
											<td>
												${pay.option1}&nbsp;/&nbsp;${pay.reservDto.redate}&nbsp;/&nbsp;${pay.reservDto.retime}
											</td>
											<td>${pay.total_price}</td>
										</tr>
									</table>								
								</td>
							</c:when>
							<c:when test="${pay.pdseq >= 2000 && pay.pdseq < 3000}">
								<td>
									<!-- 청첩장 -->
									<table style="width:100%">
											<colgroup>
												<col width="20%"><col width="20%"><col width="40%"><col width="20%">
											</colgroup>
											<tr>
												<td>
													<img src="upload/${pay.pdDto.picture0}" alt="사진없음" style="width:50px;height: 50px;"/>
													&nbsp;&nbsp;${pay.pdDto.title}
												</td>
												<td>청첩장</td>
												<td>
													${pay.option1}&nbsp;/&nbsp;${pay.option2}
												</td>
												<td>${pay.total_price}</td>
											</tr>
									</table>
								</td>
							</c:when>
							<c:otherwise>스파이</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
	</div>
</div>






</body>











