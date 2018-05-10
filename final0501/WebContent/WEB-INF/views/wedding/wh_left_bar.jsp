<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.leftbar{
	width: 91%; 
	margin-left: 20px;
}
.leftbar td{
	padding: 5px 0px;
	font-size: 13px;
}
</style>

<div style="background-color: write">
<h5 class="w3-bar-item" onclick="#">홀 빠른 검색</h5>
	<table class="leftbar">
		<colgroup>
			<col width="33%"><col width="33%"><col width="25%">
		</colgroup>
		
		<tr>
			<td colspan="3" align="center" style="padding: 1px 0px;"><hr width="80%"></td>
		</tr>
		
		<tr>
			<th colspan="3">홀 타입</th>
		</tr>
		<tr>
			<td><input type="radio" name="Htype" value="전체" checked>전체</td>
			<td><input type="radio" name="Htype" value="컨벤션">컨벤션</td>
			<td><input type="radio" name="Htype" value="호텔">호텔</td>
		</tr>
		<tr>
			<td><input type="radio" name="Htype" value="채플">채플</td>
			<td><input type="radio" name="Htype" value="전통">전통</td>
			<td><input type="radio" name="Htype" value="야외">야외</td>
		</tr>
		<tr>
			<td><input type="radio" name="Htype" value="종교">종교</td>
			<td><input type="radio" name="Htype" value="기타">기타</td>
			<td></td>
		</tr>
	</table>
	<table class="leftbar">
		
		<colgroup>
			<col width="33%"><col width="33%"><col width="25%">
		</colgroup>
		<tr>
			<td colspan="3" align="center" style="padding: 2px 0px;"><hr width="80%"></td>
		</tr>
		<tr>
			<th colspan="3">식사메뉴</th>
		</tr>
		<tr>
			<td><input type="radio" name="Ctype" value="전체" checked>전체</td>
			<td><input type="radio" name="Ctype" value="뷔페">뷔페</td>
			<td><input type="radio" name="Ctype" value="양식">양식</td>
		</tr>
		<tr>
			<td><input type="radio" name="Ctype" value="한식">한식</td>
			<td><input type="radio" name="Ctype" value="중식">중식</td>
			<td><input type="radio" name="Ctype" value="일식">일식</td>
		</tr>
		<tr>
			<td><input type="radio" name="Ctype" value="기타">기타</td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<table class="leftbar">
		<colgroup>
			<col width="50%"><col width="50%">
		</colgroup>
		<tr>
			<td colspan="2" align="center" style="padding: 2px 0px;"><hr width="80%"></td>
		</tr>
		
		<!-- 
		<tr>
			<td colspan="2">식사가격</td>
		</tr>
		<tr>
			<td><input type="radio" value="전체">전체</td>
			<td><input type="radio" value="1~2">1~2만원</td>
		</tr>
		<tr>
			<td><input type="radio" value="2~3">2~3만원</td>
			<td><input type="radio" value="3~4">3~4만원</td>
		</tr>
		<tr>
			<td><input type="radio" value="4~5">4~5만원</td>
			<td><input type="radio" value="5~6">5~6만원</td>
		</tr>
		<tr>
			<td><input type="radio" value="6~7">6~7만원</td>
			<td><input type="radio" value="7">7만원이상</td>
		</tr>
		 -->
		
		<tr>
			<th colspan="3">보증인원</th>
		</tr>
		<tr>
			<td><input type="radio" name="Ptype"  value="전체" checked>전체</td>
			<td><input type="radio" name="Ptype" value="50~100">50~100명</td>
		</tr>
		<tr>
			<td><input type="radio" name="Ptype" value="100~200">100~200명</td>
			<td><input type="radio" name="Ptype" value="200~250">200~250명</td>
		</tr>
		<tr>
			<td><input type="radio" name="Ptype" value="250~300">250~300명</td>
			<td><input type="radio" name="Ptype" value="300~400">300~400명</td>
		</tr>
		<tr>
			<td><input type="radio" name="Ptype" value="400~500">400~500명</td>
			<td><input type="radio" name="Ptype" value="500">500이상</td>
		</tr>
	</table>
	
	<c:if test="${login.id == 'admin' }">
		<button class="w3-bar-item w3-button tablink" onclick="location.href='weddingwrite.do'">글쓰기</button>
	</c:if>
</div>

