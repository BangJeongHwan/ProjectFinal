<%@page import="java.time.Year"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
<link rel="stylesheet" type="text/css" href="assets/css/template.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<style type="text/css">
table {
	border: 1px solid #EBEBEB;
	align-content: center;
	width: 800px;
	height: 500px;
}
td font{
	font-size:12px;color:#008BDC;margin:8px 0 0 8px;letter-spacing:-0.5px;
}
tr{
padding:  20px 20px;
}
td{
	 background-color:#F8F8F8;
	 align-content: center;
}
td:nth-child(even) {
    background-color:white;
}
</style>
<div align="center">

	<%
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int date = cal.get(Calendar.DATE);
		// input date의 현재 전은 선택 불가능 하게 하기위해
		String today = "";
		
		today += year+"-";
		
		if((month+"").length()==1){
			today += "0"+month+"-";
		}else{
			today += month+"-";	
		}
		
		if((date+"").length()==1){
			today += "0"+date;	
		}else{
			today += date;
		}
		
	%>
			<br><br><br><!--https://www.w3schools.com/css/tryit.asp?filename=trycss3_animation_direction2  -->
				<div align="center" style="width:100%">
					<h1>쿠폰 만들기</h1>
					<hr><br>
										
					<form action="addCoupon.do" method="post" id="_form">
						<table border="1px">
							<col width="30%"><col width="70%">
							<tr>
								<td>쿠폰제목</td>
								 <td>
									<input type="text" name="title" id="_title" size="30" >
								</td>
							</tr>
							
							<tr>
								<td>쿠폰 개시 날짜</td>
								<td>
									<input type="date" id="_open" class="date" name="opendate" min="<%=today%>">
									<input type="date" id="_temp" hidden="true">
									<input type="checkbox" id="datechk" style="margin-left: 10px;"> 타임세일쿠폰
								</td>
							</tr>
							
							<tr>
								<td>쿠폰 마감 날짜</td>
								<td>
									<input type="date" id="_close" class="date" name="closedate">
								</td>
							</tr>
							
							<tr>
								<td>쿠폰 용도</td>
								<td>
									<select name="sort" id="_sort">
										<option value="0">등록시 필요</option>
										<option value="1">공유쿠폰</option>
										<option value="2">도전쿠폰</option>
										<option value="3">타임쿠폰</option>
										<option value="4">랜덤쿠폰</option>
									</select>
									<p>*도전쿠폰은 기한 없음</p>
								</td>
							</tr>
							
							<tr>
								<td>타임세일 시간 입력</td>
								
								<td>
									<div class="_timesel" style="display:none;">
										<select id="_sHour" name="shour">
											<option value="0">시작 시간</option>
											<c:forEach var="i" begin="1" end="24" step="1">
													<option value="${i}">${i}</option>
											</c:forEach>
										</select>시
										<select  id="_sMin" name="smin">
										<option value="-1">시작 시간</option>
										<option value="0">00</option>
											<c:forEach var="i" begin="1" end="59" step="1">
													<option value="${i}">${i}</option>
											</c:forEach>
										</select>분 
									</div>
								</td>
								
							</tr>
							
							<tr>
							
								<td>시간제한</td>
								<td>
									<div class="_timesel" style="display:none;">
										<select id="_timeRemit" name="timeremit">
											<option value="0">타임쿠폰 시간제한</option>
												<c:forEach var="i" begin="1" end="180">
														<option value="${i}">${i}분</option>
												</c:forEach>
										</select>
									</div>
								</td>
							</tr>
							
							<tr>
								<td>사용기한</td>
								<td>
									<select id="_userRemit" name="userremit">
										<option value="0">사용자 사용기한</option>
											<c:forEach var="i" begin="1" end="30">
													<option value="${i}">${i}일</option>
											</c:forEach>
									</select>
								</td>
							</tr>
							
							<tr>
								<td >할인율</td>
								<td>
									<select id="_discount" name="discount">
										<option value="0">할인율</option>
											<c:forEach var="i" begin="5" end="100" step="5">
													<option value="${i}">${i}%</option>
											</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="button" id="_add">작성</button> 
									<button type="button" id="_can">취소</button> 
								</td>
								
							</tr>		
						</table>
					</form>
					
				</div>
				
			</div>
			
			<script type="text/javascript">
			
			var timeFlag = false;
			
				$("#_open").change(function () {
					$("#_temp").val($("#_open").val());
					document.getElementById("_temp").stepUp();	// 하루넘기기
					$("#_close").attr("min",$("#_temp").val()); 
				});
			
				$("#datechk").change(function () {

					if($(this).is(":checked")){				// 타임쿠폰 전용
						$("#_open").attr("readonly","readonly");
						$("#_close").attr("readonly","readonly");
						$(".date").css("background-color","gray");
						$(".date").css("color","gray");
						$("._timesel").css("display","block");
						$("#_sort").val("3").prop("selected", true);
						timeFlag = true;
					}else{									// 그 외 쿠폰
						$("#_open").removeAttr("readonly");
						$("#_close").removeAttr("readonly");
						$(".date").css("background-color","inherit");
						$(".date").css("color","black");
						$("._timesel").css("display","none");
						$("#_sort").val("0").prop("selected", true);
						timeFlag = false;
					} 
				});
			
				$("#_add").click(function () {
					
					var title = $("#_title").val();	
					var opendate = $("#_open").val();
					var closedate = $("#_close").val();
					var startHour = $("#_sHour").val();
					var startMin = $("#_sMin").val();
					var timeRemit = $("#_timeRemit").val();
					var userRemit = $("#_userRemit").val();
					var discount = $("#_discount").val();
					var sort = $("#_sort option:selected").val();
					
					if(title == ""){
						alert("제목을 입력해 주세요.");
					}else if(discount == "0"){
						alert("할인율을 선택해 주세요.");
					}else if(userRemit == "0"){
						alert("사용기한을 입력해주세요.")
					}else if(sort == "0"){
						alert("쿠폰 사용 용도를 선택해주세요.")
					}else{
						
						if(timeFlag == false){		// 타임이벤트가 아닌 쿠폰
							if(isNull(opendate)){
								alert("시작 날짜를 입력해 주세요.");
							}else if(isNull(closedate)){
								alert("마감 날짜를 입력해 주세요.");
							}else{
								
								$("#_form").attr({ "target":"_self", "action":"addCoupon.do" }).submit();
							}
						}else{							// 타임이벤트
							
							if(startHour == "0" || startMin == "-1"){
								alert("시작 시간을 입력해 주세요.");
							}else if(timeRemit == "0"){
								alert("시간제한을 입력해주세요.");																		
							}else{
								$("#_open").val("<%=today%>");
								 $("#_close").val("<%=today%>");
								$("#_form").attr({ "target":"_self", "action":"addCoupon.do" }).submit();
							}
						}
						
					}
						
					
					
				});
				$("#_sort").change(function () {
					var sort = $(this).val();
					if(sort == 2){
						$("#_open").val("2118-12-31");
						$("#_close").val("2118-12-31");
						$("#_open").attr("readonly","readonly");
						$("#_close").attr("readonly","readonly");
						$(".date").css("background-color","inherit");
						$(".date").css("color","black");
						$("._timesel").css("display","none");
						timeFlag = false;
					} 
				});
				
				
				function isNull(obj) {
					return (typeof obj != "undefined" && obj !=null && obj !="")?false:true;
				}	
			</script>