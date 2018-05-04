<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/table.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/tables.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="honeymoon.jsp"/>
<table class="tav" style="margin-left: 12%;">
				<tr >
					<th width="1200px;" style="background-color: #C32E61;border: 1px solid #C32E61;">
						<h4 align="center" style="padding: 10px 0px;color: white;"><b>내가 원하는 지역과 컨셉으로 상품 찾자!</b></h4>
					</th>
				</tr>		
				<tr style="border: 1px solid black;">
					<td>
					<input type="text" readonly="readonly" size="35" value="허니문" style="margin-left: 150px; height: 50px; font-size: 20px; color: #93DAFF; text-align: center; font-weight: bold;"><b>을</b>
						<select name="style" id="_style" style="width: 355px; margin-left: 150px; height: 50px; font-size: 15px;">
							<option value="none">여행스타일을 선택하세요</option>
							<option value="huyang">휴양형</option>
							<option value="gwangwang">관광형</option>
							<option value="hugawn">휴양관광형</option>
							<option value="short">단거리형</option>
							<option value="long">장거리형</option>
						</select>
					</td>
				</tr>
				<tr>
					<td >
						<div style="background-repeat: no-repeat; background-size: 100% 100%; width: 1200px; height: 480px;" id="_maindiv">
    							<div style="background-color: rgba(255,255,255,0.8); width: 430px; height: 480px; margin-left: 650px;">
    							<br><br><br>
    								<h1 style="margin-left: 50px;"><b id="_title"></b></h1>
    								<div style="width: 75%;margin-left: 50px;"><br><br>
    									<p id="_content"></p>
    								</div><br><br>
    								<div style="width: 75%;margin-left: 50px;" id="_none1">
	    								<b>대표적인 허니문</b> <font color="#C32E61" size="3px;">추천지역</font><br>
											<font color="#C32E61" size="3px;" id="_area"></font>    								
    								</div><br><br>
    								<div style="width: 75%;margin-left: 50px;" id="_none2">
	    								<b>추천</b> <font color="#3232FF" size="3px;">point</font><br>
	    								<p id="_recommend"></p>
    								</div>
    							</div>
						</div>
					</td>
				</tr>
			</table>
			<br><br><br><br><br><br>
			<script type="text/javascript">
				$("#_style").val("${style}").prop("selected", true);
				name();
				$("#_style").change(function () {
					name();
				});
				function name() {
					var selected = $("#_style option:selected").val();
					if(selected != "none"){
						$("#_none1").show();
						$("#_none2").show();
					}
					
					if(selected == "huyang"){
						$("#_maindiv").css("background-image","url('./assets/images/honeymoon/huyang.jpg')");
						$("#_title").html("휴양형 허니문이란?");
						$("#_content").html("경치가 좋은 훌륭한 시설의 리조트를 사용하며 긴 백사장, 잔잔한 바다 등 깨끗한 환경을 즐깁니다. 특별한 프로그램이 구성되어 있기 보다는 자유롭게 먹고, 쉴 수 있는 컨셉의 허니문 형태 입니다.");
						$("#_area").html("몰디브, 하와이, 발리, 팔라완, 타히티, 모리셔스, 세이셀 등");
						$("#_recommend").html("바쁜일상을 벗어나 조용하고 느긋한 여유를 즐길고 싶은 커플들에게 추천");
					}else if(selected == "gwangwang"){
						$("#_maindiv").css("background-image","url('./assets/images/honeymoon/gawngwang.jpg')");
						$("#_title").html("관광형 허니문이란?");
						$("#_content").html("문화 유적지, 유명한 장소, 경치 등을 보고 현지 문화를 체험할 수 있는 스타일의 허니문 형태 입니다.");
						$("#_area").html("유럽, 미국, 호주, 푸켓, 뉴질랜드 등");
						$("#_recommend").html("호기심이 많고, 다양한 체험을 원하는 활동적인 커플들에게 추천");
					}else if(selected == "hugawn"){
						$("#_maindiv").css("background-image","url('./assets/images/honeymoon/huqwan.jpg')");
						$("#_title").html("휴양 + 관광형 허니문이란?");
						$("#_content").html("경치가 아름다운 휴양지에서 현지 문화를 즐기는 형태의 허니문으로 한국인이 가장 선호하는 타입입니다. 대부분 동남아 지역이 이에 속하며 다채로운 일정으로 구성되어 있습니다.");
						$("#_area").html("유럽, 미국, 호주, 푸켓, 뉴질랜드 등");
						$("#_recommend").html("편안히 쉴 수 있는 휴양형 허니문을 선택하고 싶지만 무료함이 걱정되는 커플에게 추천");
					}else if(selected == "short"){
						$("#_maindiv").css("background-image","url('./assets/images/honeymoon/short.jpg')");
						$("#_title").html("단기 일정 허니문이란?");
						$("#_content").html("여행의 기간을 결정하는 부분에 있어 가장 큰 비중을 차지하는 것은 바로 이동시간 입니다. 이동시간이 6시간 이상이 된다면 왕복 12시간, 거의 하루를 소비해야 하기 때문에 여행 기간이 길어질수 밖에 없습니다. 허니문에 할애할 시간적 여유가 적다면 비행거리 4시간 이내의 지역으로 허니문을 준비 하시면 됩니다.");
						$("#_area").html("괌, 사이판, 세부, 보라카이, 제주도 등");
						$("#_recommend").html("시간이 없거나 장거리 비행이 싫은 커플에게 추천");
					}else if(selected == "long"){
						$("#_maindiv").css("background-image","url('./assets/images/honeymoon/long.jpg')");
						$("#_title").html("장기 일정 허니문이란?");
						$("#_content").html("커플에게 주어진 허니문 기간이 여유롭다면 방문하기 어려운 지역이나 여러 나라를 방문 할 수 있도록 항공편을 경유하는 루트로 계획하시면 좋습니다. 예를 들어 서유럽 3개국, 두바이 경유 몰디브 등의 일정으로 준비하신다면 길지만 알찬 허니문을 보낼 수 있습니다.");
						$("#_area").html("유럽, 몰디브, 칸쿤, 타히티, 세이셀 등");
						$("#_recommend").html("편안히 쉴 수 있는 휴양형 허니문을 선택하고 싶지만 무료함이 걱정되는 커플에게 추천");
					}else{
						$("#_maindiv").css("background-image","url('./assets/images/honeymoon/area/moldiv2.jpg')");
						$("#_title").html("지역을 선택해주세요.");
						$("#_none1").hide();
						$("#_none2").hide();
					}
				}
			</script> 