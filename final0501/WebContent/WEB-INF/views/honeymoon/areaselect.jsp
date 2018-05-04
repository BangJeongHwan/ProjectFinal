<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<fmt:requestEncoding value="utf-8"/>
<style type="text/css">
.hmslideshow-container {box-sizing: border-box}
.hmmySlides {display: none}

/* Slideshow container */
.hmslideshow-container {
  max-width: 1000px;  
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.hmprev , .hmnext {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: 320px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}
/* todohm */
/* Position the "next button" to the right */
.hmnext {
  margin-left: 63%;
  border-radius: 3px 0 0 3px;
}
.hmprev{
	margin-left: 13%;
}

/* On hover, add a black background color with a little bit see-through */
.hmprev:hover, .hmnext:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.hmtext {
    color: #f2f2f2;
    font-size: 15px;
    padding: 8px 12px;
    position: absolute;
    bottom: 8px;
    width: 100%;
    text-align: center;
    background-color: rgba(0,0,0,0.6);
    height: 100%;
}
.hmtext .text{
	width: 650px;
    margin-left: 17%;
    margin-top: 15%;
    font-size: 20px;
}

/* Number text (1/3 etc) */
.hmnumbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}
/* The dots/bullets/indicators */
.hmdot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.hmactive , .hmdot:hover {
  background-color: #717171;
}

/* Fading animation */
.hmfade {
  -webkit-animation-name: hmfade !important;
  -webkit-animation-duration: 1.5s !important;
  animation-name: hmfade !important;
  animation-duration: 1.5s !important;
}

@-webkit-keyframes hmfade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes hmfade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .hmprev, .hmnext,.hmtext {font-size: 11px}
}
</style>

<jsp:include page="honeymoon.jsp"/>
<c:if test="${not empty selarea && selarea ne ''}">
	<script type="text/javascript">
		location.href="#dotdot";	
	</script>	
</c:if>


<!-- 
uro bali baliz croa hawai hoju kancoon moldiv puket stlucia tahiti
https://m.blog.naver.com/PostView.nhn?blogId=dongi0508&logNo=220200939243&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F
 -->
<div class="hmslideshow-container" id="${selarea}">

	<div class="hmmySlides hmfade">
	  <div class="hmnumbertext">1 / 5</div>
	  <img src="<%=request.getContextPath() %>/assets/images/honeymoon/area/${selarea}1.jpg" style="width:100%">
	</div>
	
	<div class="hmmySlides hmfade">
	  <div class="hmnumbertext">2 / 5</div>
	  <img src="<%=request.getContextPath() %>/assets/images/honeymoon/area/${selarea}2.jpg" style="width:100%">
	</div>
	<div class="hmmySlides hmfade">
	  <div class="hmnumbertext">3 / 5</div>
	  <img src="<%=request.getContextPath() %>/assets/images/honeymoon/area/${selarea}2.jpg" style="width:100%">
	  	<div class="hmtext">
	  		<div class="text">
	  			<c:if test="${selarea eq 'uro'}">
		  			<b>[1.에스토니아 탈린. (Tallinn, Estonia)]</b><br>
		  			에스토니아의 수도인 탈린. 발트해 핀란드 연안에 가까이 있는 항만도시이다. 관광도시이자 공업도시로 핀란드의 헬싱키와 굉장히 가깝다. 페리를 타고 가면 대략 50분 정도밖에 걸리지않는다. 주요 관광지로 탈린 알렉산더네브스키 대성당, 탈린 텔레비전 타워 등이 있다.
	  			</c:if>
	  			<c:if test="${selarea eq 'bali'}">
		  			<b>[1.스미냑 (Seminyak)]</b><br>
		  			값비싸고 필요이상으로 고급스러운 호텔과 숙소가 모두 울루와뚜와 짐바란 그리고 누사두아에 몰려 있다면 가격대비 훌륭한 숙소들은 모두 스미냑(Seminyak)에 몰려 있다. 거대한 리조트부터 개인만 사용할 수 있는 풀빌라, 수영장이 딸린 호텔들까지 각자의 취향에 정확히 맞는 숙소들을 어디서나 쉽게 찾아볼 수 있다. 묶고 싶은 숙소가 많다는건 그만큼 많은 유동인구를 품고 있다는 증거다.
	  			</c:if>
	  			<c:if test="${selarea eq 'baliz'}">
		  			<b>[1.신비하거나 또는 공포스럽거나, 벨리즈 그레이트의 블루홀!]</b><br>
		  			 바다의 블랙홀이라고 불리는 그레이트 블루홀은 중앙아메리카의 벨리즈공화국 해안에서 볼 수 있는 싱크홀의 바다버전이에요 세계 최대의 바다홀인만큼 폭은 300m 깊이는 124m의 거대한 규모로 알려졌지만 정확한 깊이는 측정불가라고 하네요 이곳에는 희귀생물을 비롯하여 그레이트블루홀에서만 만날 수 있는 풍경을 보기위해 여전히 많은 다이버가 위험을 무릅쓰고 찾는곳이라고 합니다
	  			</c:if>
	  			<c:if test="${selarea eq 'croa'}">
		  			<b>[1.크로아티아의 수도인 자그레브]</b><br>
					중부유럽 교통의 요지로써 동과 서를 향하는 여행자의 기착지로 이름을 알린 곳이랍니다. 자그레브 여행의 묘미는 걷는데에 있다고 합니다. 시가지가 그리 크리 않으며 유명 건축물들이 구시가지에 밀집해 있는 이유인데요. 산책하듯 걸으며 푸른색의 트램을 타고 현지인들의 삶을 둘러보세요.
	  			</c:if>
	  			<c:if test="${selarea eq 'hawai'}">
		  			<b>[1.와이키키해변  (WAIKIKI BEACH)]</b><br>
		  			 호놀룰루 근처 오아후 남부에 위치한다. 하와이말로 '솟구치는 물'이라는 뜻의 이름을 가진 이 해변은 과거 하와이 왕족들이 머물고 가던 해변이기도 했다. 하와이의 장점은 뭐니 뭐니 해도 아름다운 해상에서 다양한 액티비티를 즐길 수 있다는 것! 와이키키에서 차로 약 20분 정도의 위치에 있는 하나우마 베이(Hanauma Bay)는 말굽 모양으로 구부러진 백사장과 산호초, 푸르고 투명한 바다가 있어 오아후 섬에서도 가장 아름다운 해변으로 손꼽힙니다. 
	  			</c:if>
	  			<c:if test="${selarea eq 'hoju'}">
		  			<b>[1.항구도시 다윈]</b><br>
		  			호주 대륙의 북쪽 끝에 위치해 ‘톱 엔드(Top end)’라는 별칭으로도 불리는 항구도시 다윈은 세계문화유산과 세계자연유산에 동시에 등재된 카카두 국립공원, 리치필드 국립공원, 캐서린 협곡, 티위 아일랜드 등으로 가는 관문 중에 하나이다. 다윈은 아직 개척되지 않은 노던 테리토리에서도 세련된 라이프스타일을 즐길 수 있는 활기찬 해변 도시이다. 석양이 질 무렵 비치 마켓에서 유유자적 시간을 보낼 수 있다. 노던 테리토리의 거친 자연과 야생동물, 애버리지니 전통 예술을 만나보자. 다윈은 우기와 건기 두 계절로 명확하게 구분되는데 5월부터 10월 사이가 건기, 기온은 21도에서 32도 사이이며 습도가 낮고 일교차가 심하지만, 여행하기 적합하다. 
	  			</c:if>
	  			<c:if test="${selarea eq 'kancoon'}">
		  			<b>[1.역사와 종교의 흥망성쇠, 치첸이사(Chichen Itza)]</b><br>
		  			건조한 석회암 지대에 위치한 이 곳은 '치첸이사' 또는 '치첸이차'로 발음되기도 합니다. 치첸이사는 마야문명 中 종교 유적지로 유명한 곳인데, 스페인 정복기를 거친 후에도 마야족의 성지로 알려져있습니다. 이 곳은 이트사족에 의하여 최초로 건설되기 시작하였다고 하며, 7세기경 중단되었다가 10세기에 재건이 되었고, 다시 11세기 이후에는 마야 신제국 종교 중심지 역할을 하며 번영을 누렸다고 합니다. 하지만, 번영의 세월은 15세기 무렵에 그 종말을 고하게 되었고 현재는 세계문화유산에 등재된 오랜 역사의 흔적으로만 남겨져 있습니다. 
	  			</c:if>
	  			<c:if test="${selarea eq 'moldiv'}">
		  			<b>[1.몰디브 일정을 짤때 3가지 고려사항]</b><br>
		  			(1)한 섬에서 여유를 즐길 것인지? 여러섬을 갈 것인지? (몰디브는 섬이 많아, 공항 섬 포함하여 수도 말레섬까지 간다면 기본 2+α의 섬을 가게 됨)<br>
		  			(2)숙박은 어디서 할 것인지?<br>
		  			(3)여러 섬을 간다면, 섬끼리 이동할때의 교통수단은 무엇인지?<br>
					<b>▶보통 4박 5일 or 5박 6일 정도가 적당 (*비행시간 제외)</b>		  
	  			</c:if>
	  			<c:if test="${selarea eq 'puket'}">
		  			<b>[1.푸켓 여행을 가는 사람들이 많이 선택하는 투어, 피피섬!]</b><br>
		  			크루즈를 타고 피피섬 군도에서 2번째로 큰 피피 레이부터 톤사이 베이, 피피섬으로 이동하며 멋진 풍경을 선사합니다. 피피섬에 도착하면 레오나르도 디카프리오의 영화 비치가 눈에 들어옵니다. 여행을 떠나기 전에 영화를 미리 보고 가면 그 감동이 배가 되겠죠? 로사마 베이와 마야 베이를 둘러싼 가파른 석회암 언덕으로 이루어져 있습니다. 바이킹 동굴 탐험도 할 수 있으니 도전해보세요. 펠리 동굴과 원숭이 베이도 놓치지 마세요. 피피섬 군도에서 가장 큰 피피 돈은 번화한 섬으로 먹고 마시고 쇼핑하기 좋습니다. 
					6개의 군도로 이루어진 피피섬은 눈부시게 아름다운 해변뿐만 아니라 스노클링과 다이빙 하기에 가장 좋은 곳입니다. 
	  			</c:if>
	  			<c:if test="${selarea eq 'stlucia'}">
					<b>[1.세인트루시아 여행]</b><br>
					세인트루시아는 모래와 태양과 바다로 유명하지만, 내륙에서도 다양한 즐길거리를 찾아볼 수 있습니다.
	  			</c:if>
	  			<c:if test="${selarea eq 'tahiti'}">
		  			<b>[1.타히티다]</b><br>
	  			</c:if>
	  		</div> 
	  	</div>
	</div>
	
	<div class="hmmySlides hmfade">
	  <div class="hmnumbertext">4 / 5</div>
	  <img src="<%=request.getContextPath() %>/assets/images/honeymoon/area/${selarea}3.jpg" style="width:100%">
	</div>
	
	<div class="hmmySlides hmfade">
	  <div class="hmnumbertext">5 / 5</div>
	  <img src="<%=request.getContextPath() %>/assets/images/honeymoon/area/${selarea}3.jpg" style="width:100%">
	  <div class="hmtext">
	  		<div class="text">
	  			<c:if test="${selarea eq 'uro'}">
		  			<b>[2.폴란드 크라쿠프. (Krakow, Poland)]</b><br>
		  			크라쿠프는 17세기 초반, 바르샤바로 수도를 옮기기 전의 폴란드 학문, 문화, 예술의 중심지였다. 폴란드에서 나름 역사가 깊은 도시이고 도시는 대학도시, 관광도시로 유명하다. 주요 관광지로는 바벨성, 크라코프 광장, 소금 광산, 바벨 대성당이 있고 크라쿠프는 맥주가 맛있기로도 유명하다.
		  		</c:if>
		  		<c:if test="${selarea eq 'bali'}">
		  			<b>[2. 꾸다 해변 (Kuta Beach)]</b><br>
		  			꾸다 해변은 발리의 가장 대표적인 해변으로서 발리 웅우라이 공항에서 가장 가까운 해변이다. 꾸다 해변은 외국인 관광객뿐만 아니라 인도네시아인들도 대표적인 데이트 장소로 꼽을 정도로 아름다운 곳이다. 꾸따 해변이 이토록 유명해진데는 몇가지 이유가 있다. 끝이 보이지 않는 넓은 해변과 놀기에 적당한 파도 꾸따해변은 해변의 길이만으로는 단연 발리에서 가장 긴 해변이다. 수많은 관광객들과 발리 사람들 모두가 온다 하더라도 어디서나 볼 수 있는건 한적함과 여유뿐이다. 전선줄하나없이 탁트인 넓은 해변에서는 발바닥까지 오는 파도선부터 지평선까지 한눈에 담을 수 있다.
	  			</c:if>
	  			<c:if test="${selarea eq 'baliz'}">
		  			<b>[2.벨리즈 산호초 보호지역(Belize Barrier Reef)]</b><br>
		  			벨리즈의 해안은 북반구 최대 규모의 보초, 연안의 환상 산호섬, 수백 개의 모래섬, 맹그로브 숲, 연안 석호와 하구 퇴적지로 이루어진 뛰어난 자연 시스템이다. 이 자연계를 구성하는 총 7개 지역은 산호초의 발달과 진화의 역사를 그대로 보여 주며, 멸종 위기종의 매우 중요한 서식지이다.
	  			</c:if>
	  			<c:if test="${selarea eq 'croa'}">
		  			<b>[2. 아드리아해의 진주 두브로브니크]</b><br>
		  			크로아티아 최남단 달마티아 연안에 위치해 지중해의 아름다운 풍경과 고풍스러운 건물이 어우러져 아드리아해의 진주로 불리고 있는 두브로브니크. 유네스코 세계문화유산으로 지정 된 곳이기도 하며 세상에서 가장 아름다운 골목길을 가진 곳으로 웅장한 성벽으로 둘러쌓여 있는 구시가지의 성벽 내부 전체가 유네스코 
		  			세계문화유산으로 지정되어 있는 아름다운 곳이랍니다. 에메랄드 빛의 아드리아해와 붉은 색 지붕의 조화가 너무 아름다워 많은 사람들이 찾고 있는 곳이죠.
		  		</c:if>
	  			<c:if test="${selarea eq 'hawai'}">
		  			<b>[2.하와이 맥도날드만의 특별한 아침 즐기기]</b><br>
		  			하와이의 호텔에는 대부분 조식비가 포함돼 있기 때문에 따로 조식을 걱정할 필요가 없습니다. 하지만 하와이에 간다면 하루쯤은 맥도날드에서 아침 식사를 즐겨보세요! ‘왜 하와이까지 가서 맥도날드를 갈까’라고 생각하실 수 있지만, 이곳에서는 특별한 맥모닝을 경험해볼 수 있답니다. 하와이의 맥도날드에는 스팸 소비 1위 지역답게 스팸으로 이루어진 아침식사 메뉴, '블랙퍼스트 플레이트(Breakfast Platters)'가 판매되고 있었는데요. 스팸과 밥, 계란, 포르투갈 소세지로 구성된 이 메뉴는 거창하진 않지만 꽤 중독성 있는 맛을 냅니다. 이외에도 하와이 전통국수 사이민도 이곳에서만 맛볼 수 있는 메뉴입니다. 코코넛크림이 들어있는 하우피아 파이와 타로파이 등 색다른 디저트도 즐길 수 있답니다.
	  			</c:if>
		  		<c:if test="${selarea eq 'hoju'}">
		  			<b>[2.킴벌리, 웨스턴오스트레일리아]</b><br>
		  			서호주 북부 아웃백은 배낭여행자들의 메카와 같은 곳이다. 그중 더욱 모험심을 자극하는 곳이 바로 킴벌리 지역이다. 서호주 10대 여행지 중 하나로 꼽히는 킴벌리는 특히나 겨울에 빛나는 여행지이다. 카리지니 국립공원과 푸눌룰루 국립공원에서 거칠지만 때 묻지 않은 자연경관과 아웃백의 진면목을 체험할 수 있다.<br>
					특히 푸눌룰루 국립 공원 내에 위치한 벙글벙글 협곡은 원래 바닷속에 잠겨 있었으나 해수면이 낮아지면서 지금의 모습이 되었다. 경비행기를 타면 오렌지색 바탕에 검은 띠를 두르고 있는 신비로운 형상을 더욱 잘 볼 수 있다. 아웃백 외에도 킴벌리에서 꼭 해봐야 할 체험은 낙타를 타고 20여킬로미터에 이르는 하얀 모래밭의 케이블 비치에서 아름다운 인도양의 일몰을 감상해보자. 킴벌리는 7월쯤 되면 참을 수 없이 더웠던 열기가 식으면서 여행하기에 훨씬 쾌적한 환경이 된다. 킴벌리에서 독특한 지형과 자연을 경험해보자.  
	  			</c:if>
	  			<c:if test="${selarea eq 'kancoon'}">
		  			<b>[2.고래상어 투어]</b><br>
		  			매년 6월 말 ~ 8월 말 사이 멕시코만을 지나는 고래상어 무리. 이 고래상어들과 에메랄드 빛 바다에서 함께 헤엄친다면 어떤 기분일까. 칸쿤에서 직접 체험해 보자! 
	  			</c:if>
	  			<c:if test="${selarea eq 'moldiv'}">
		  			<b>[2.몰디브의 해양 레저 스포츠]</b><br>
		  			 다양한 해양 레저 스포츠를 즐길 수 있는 몰디브는 바다 수심이 30~60m로 투명한 바닷속을 탐험할 수 있는데요. 스쿠버다이빙, 스노클링, 세일링, 윈드서핑, 카약, 아쿠아짐, 수영장, 밤 낚시 등 해양레저스포츠를 즐길 수 있어요.			
	  			</c:if>
	  			<c:if test="${selarea eq 'puket'}">
		  			<b>[2.롱테일 보트를 타고 푸켓 최고의 섬 중 하나인 제임스 본드섬을 방문해보세요!]</b><br>
		  			잊을 수 없는 하루를 보내고 싶다면 007 시리즈 '황금 총을 가진 사나이'의 촬영지 제임스 본드 섬으로 가보세요. 아름다운 바다를 둘러보고 수영, 스노클링을 즐길 수 있습니다. 롱테일 보트를 타고 떠나는 이 여행은 카누 타기, 거대한 부처상과 야생 원숭이가 가득한 원숭이 동굴도 가볼 수 있어 지루할 틈이 없습니다.
	  			</c:if>
	  			<c:if test="${selarea eq 'stlucia'}">
	  				<b>[2.롱테일 보트를 타고 푸켓 최고의 섬 중 하나인 제임스 본드섬을 방문해보세요!]</b><br>
		  			잊을 수 없는 하루를 보내고 싶다면 007 시리즈 '황금 총을 가진 사나이'의 촬영지 제임스 본드 섬으로 가보세요. 아름다운 바다를 둘러보고 수영, 스노클링을 즐길 수 있습니다. 롱테일 보트를 타고 떠나는 이 여행은 카누 타기, 거대한 부처상과 야생 원숭이가 가득한 원숭이 동굴도 가볼 수 있어 지루할 틈이 없습니다.
	  			</c:if>
	  			<c:if test="${selarea eq 'tahiti'}">
		  			<b>[2.타히티야]</b><br>
	  			</c:if>
	  		</div> 
	  </div>
	</div>
	
</div>
<a class="hmprev" onclick="plusSlides(-1)">&#10094;</a>
<a class="hmnext" onclick="plusSlides(1)">&#10095;</a>

<br>

<div style="text-align:center" id="dotdot">
	  <span class="hmdot" onclick="currentSlide(1)"></span> 
	  <span class="hmdot" onclick="currentSlide(2)"></span> 
	  <span class="hmdot" onclick="currentSlide(3)"></span> 
	  <span class="hmdot" onclick="currentSlide(4)"></span> 
	  <span class="hmdot" onclick="currentSlide(5)"></span>
</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("hmmySlides");
  var dots = document.getElementsByClassName("hmdot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
   for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" hmactive", "");
  } 
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " hmactive";
}
</script>
