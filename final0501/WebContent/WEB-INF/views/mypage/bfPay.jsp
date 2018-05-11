<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 결제 api를 위해 라이브러리 추가 -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/bootstrap.min.js"></script>

<style type="text/css">
.backet table {
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
.cpbtn{
    border: 5px solid inherit;
    background: none;
    border-radius: 15px;
    font-size: 13px;
    font-weight: bold;
    padding: 5px 10px;
}
.delbtn{
	background: #ff5555;
    color: white;
    border: none;
    border-radius: 10px;
    padding: 4px 10px;
    font-weight: bold;
    margin-left: 7px;
}
</style>

<body>

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
  
<div align="center">
	<div align="center" class="backet ">
		<form id="_payFrm" action="afPayView.do" method="post">
			<input type="hidden" name="totalPrice" id="_totalPrice" value="0">
			<table>
				<colgroup>
					<col width="20%"><col width="15%"><col width="27%"><col width="23%"><col width="15%"></colgroup> 
						<tr>
							<th><!-- <input type="checkbox" id="_allck" onclick="allcheck(this.checked)"> --></th>
							<th>상품정보</th>			
							<th>옵션</th>
							<th>할인</th>
							<th>가격</th>
						</tr>
			</table>
			<!-- 							thead 					 -->
			
			<table>
				<colgroup>
					<col width="5%"><col width="95%">
				</colgroup>
				<c:forEach items="${ bskList }" var="bsk" varStatus="i">
				
					<tr>
						<td>
							<input type="checkbox" name="selectedIndex" value="${i.index}" onclick="selectChange()" checked>
							<input type="hidden" name="payList[${i.index}].pdseq" value="${bsk.pdseq}">
							<!-- 결제하면서 해당하는 bsk를 삭제해주기 위해 bkseq 전달. 임의로 payseq에 담는다. -->
							<input type="hidden" name="payList[${i.index}].payseq" value="${bsk.bkseq}">
							<input type="hidden" name="payList[${i.index}].total_price" id="_price${i.index}" value="${bsk.total_price}">
						</td>
						<c:choose>
							<c:when test="${bsk.pdseq >= 5000 && bsk.pdseq < 6000}">
								<td>
									<!-- 메이크업 -->
									<input type="hidden" name="payList[${i.index}].option1" value="${bsk.option1}">
									<input type="hidden" name="payList[${i.index}].rvseq" value="${bsk.rvseq}">
									<table style="width:100%">
										<colgroup>
											<col width="20%"><col width="15%"><col width="27%"><col width="23%"><col width="15%"> 
										</colgroup>
										<tr>
											<td>
												<img src="upload/${bsk.pdDto.pic1}" alt="사진없음" style="width:50px;height: 50px;"/>
												&nbsp;&nbsp;${bsk.pdDto.cname}
											</td>
											<td>메이크업</td>
											<td>
												${bsk.option1}&nbsp;/&nbsp;${bsk.reservDto.redate}&nbsp;/&nbsp;${bsk.reservDto.retime}
											</td>
											<td id="td${i.index}"></td>
											<td>
											<input type="text" value="${bsk.total_price}" style="border: none; 
											background: none; text-align: right;" size="8" readonly="readonly" id="totalprice${i.index}">원
										</td>
										</tr>
									</table>								
								</td>
							</c:when>
							<c:when test="${bsk.pdseq >= 3000 && bsk.pdseq < 4000}">
								<td>
									<!-- 스튜디오 -->
									<input type="hidden" name="payList[${i.index}].option1" value="${bsk.option1}">
									<input type="hidden" name="payList[${i.index}].rvseq" value="${bsk.rvseq}">
									<table style="width:100%">
										<colgroup>
											<col width="20%"><col width="15%"><col width="27%"><col width="23%"><col width="15%"> 
										</colgroup>
										<tr>
											<td>
												<img src="upload/${bsk.pdDto.pic1}" alt="사진없음" style="width:50px;height: 50px;"/>
												&nbsp;&nbsp;${bsk.pdDto.cname}
											</td>
											<td>스튜디오</td>
											<td>
												${bsk.option1}&nbsp;/&nbsp;${bsk.reservDto.redate}&nbsp;/&nbsp;${bsk.reservDto.retime}
											</td>
											<td id="td${i.index}"></td>
										<td>
											<input type="text" value="${bsk.total_price}" style="border: none; 
											background: none; text-align: right;" size="8" readonly="readonly" id="totalprice${i.index}">원
										</td>
										</tr>
									</table>								
								</td>
							</c:when>
							<c:when test="${bsk.pdseq >= 2000 && bsk.pdseq < 3000}">
								<td>
									<!-- 청첩장 -->
									<input type="hidden" name="payList[${i.index}].option1" value="${bsk.option1}">
									<input type="hidden" name="payList[${i.index}].option2" value="${bsk.option2}">
									<table style="width:100%">
										<colgroup>
											<col width="20%"><col width="15%"><col width="27%"><col width="23%"><col width="15%"></colgroup> 
										</colgroup>
										<tr onclick="clickCdTd(${i.index})" style="cursor:pointer;">
											<td>
												<img src="upload/${bsk.pdDto.picture0}" alt="사진없음" style="width:50px;height: 50px;"/>
												&nbsp;&nbsp;${bsk.pdDto.title}
											</td>
											<td>청첩장</td>
											<td>
												${bsk.option1}&nbsp;/&nbsp;${bsk.option2}
											</td>
											<td id="td${i.index}"></td>
											<td>
											<input type="text" value="${bsk.total_price}" style="border: none; 
											background: none; text-align: right;" size="8" readonly="readonly" id="totalprice${i.index}">원
										</td>
										</tr>
										<tr style="padding: 0px 0px;height:0px">
											<td id="_cpoTd${i.index}" colspan="4" style="align-content: left;text-align: left;padding: 15px">
<!-- 청첩장 상세 : _cpoTd에 들어가는 내용 -->
<div id = "product">
	<div class="order2">
		<h4>>>카드 기본인쇄 정보를 입력합니다</h4>
		<div class="cpo">
			<h6>폰트/레이아웃 선택</h6>
			<div class="cpo_content">
			<!-- <button id="fontbtn">폰트/레이아웃 선책</button>
			<input type="text" name="c_font"><br>
			폰트/레이아웃 선택버튼을 클릭하시면 카드에 인쇄될 폰트(서체)를 선택하실 수 있습니다. -->
				<select name="cpoList[${i.index}].font">
					<option value="윤명조">윤명조</option>
					<option value="윤고딕">윤고딕</option>
					<option value="서울한강">서울한강</option>
				</select>
			</div>
			<h6>인사말 선택</h6>
			<div class="cpo_content">
				<button id="o_msgbtn" onclick="msgSmp()">인사말 샘플보기</button>
				<textarea rows="10" cols="50" name="cpoList[${i.index}].content" id="_content" style="resize:none">
같은 생각, 같은 마음으로 지혜롭게 살겠습니다. 
저희 두 사람이 소중한 분들을 모시고
사랑의 결실을 이루려 합니다. 
오로지 믿음과 사랑만을 약속하는 귀한 날에
축복의 걸음을 하시어 저희의 하나 됨을 
지켜보아 주시고 격려해 주시면 
더없는 기쁨으로 간직하겠습니다.
				</textarea><br>
				인사말은 고객님이 직접 입력하시거나 제공되는 인사말샘플을 참고하여 작성할 수 있습니다.<br>
				인사말 샘플 참고시에는 반드시 오탈자, 띄어쓰기가 제대로 되었는지 다시 한번 꼼꼼히 확인 하시기 바랍니다.<br>
				* 고객님이 직접 입력하신 인사말 경우, 추후 고객 우수 인사말로 등록되어 활용될 수 있습니다.<br>
			</div>
			<h6>신랑/신부 정보입력</h6>
			<input type="hidden" name="cpoList[${i.index}].wfname" id="_wfname${i.index}" value=" "><!-- 신부 부 -->
			<input type="hidden" name="cpoList[${i.index}].wmname" id="_wmname${i.index}" value=" "><!-- 신부 모  -->
			<input type="hidden" name="cpoList[${i.index}].wc" id="_wc${i.index}" value="장녀"><!-- 신부 관계 -->
			<input type="hidden" name="cpoList[${i.index}].wname" id="_wname${i.index}" value=" "><!-- 신부 --><br>
			<input type="hidden" name="cpoList[${i.index}].mfname" id="_mfname${i.index}" value=" "><!-- 신랑 부  -->
			<input type="hidden" name="cpoList[${i.index}].mmname" id="_mmname${i.index}" value=" "><!-- 신랑 모 -->
			<input type="hidden" name="cpoList[${i.index}].mc" id="_mc${i.index}" value="장남"><!-- 신부 관계 -->
			<input type="hidden" name="cpoList[${i.index}].mname" id="_mname${i.index}" value=" "><!-- 신랑 --><br>
			<input type="hidden" name="cpoList[${i.index}].cpdate" id="_cpdate${i.index}" value=" ">
			<input type="hidden" name="cpoList[${i.index}].cpadd" id="_cpadd${i.index}" value=" ">
			<input type="hidden" name="cpoList[${i.index}].cptel" id="_cptel${i.index}" value=" ">
			<div class="cpo_content">
				<table class="ta01 mgt10" style="width:100%">
					<colgroup>
						<col width="20%"/><col width="80%"/>
					</colgroup>
					<tr>
						<td class="tit">신랑측</td>
						<td>
							<table class="ta04" style="width:100%">
								<caption>신랑</caption>
								<colgroup>
									<col width="28"/>
									<col width="22"/>
									<col width="40"/>
									<col width="77"/>
									<col width="82"/>
									<col width="23"/>
									<col width="134"/>
									<col width="51"/>
									<col width="75"/>
									<col width="91"/>
									<col width="110"/>
									<col width=""/>
								</colgroup>
								<tr>
									<td>
										고인
										<input type="hidden" name="groom_father_header" value="">
										<input type="hidden" name="groom_mother_header" value="">
										<input type="hidden" name="isgroom_tail" value="">
										<input type="hidden" name="isbride_tail" value="">
										<p class="mgt3"><input type="checkbox" onclick="nameCk('mf', ${i.index})" id="_mfck${i.index}"></p>
										<p class="mgt3"><input type="checkbox" onclick="nameCk('mm', ${i.index})" id="_mmck${i.index}"></p>
										<!-- <p class="mgt3"><input type="checkbox" name="groom_father_header_tmp" value="(故)"  onClick="OnChk_ParentHeader(0,'groom_father')" tabindex=10 /></p>
										<p class="mgt3"><input type="checkbox" name="groom_mother_header_tmp" value="(故)"  onClick="OnChk_ParentHeader(0,'groom_mother')" tabindex=18/></p>
									 --></td>
									<td>
										<p class="mgt13">부</p>
										<p class="mgt20">모</p>
									</td>
									<td class="al_c">
										성
										<p class="mgt3"><input type="text" onblur="nameCk('mf', ${i.index})" class="input02" style="width:32px;" id="_mffirst${i.index}" value="" maxlength="10" tabindex=11 /></p>
										<p class="mgt5"><input type="text" onblur="nameCk('mm', ${i.index})"  class="input02" style="width:32px;" id="_mmfirst${i.index}" value="" maxlength="10" tabindex=19/></p>
									</td>
									<td class="al_c">
										이름
										<p class="mgt3"><input type="text" onblur="nameCk('mf', ${i.index})"  class="input02" style="width:59px;" id="_mflast${i.index}" value="" maxlength="15" tabindex=12/></p>
										<p class="mgt5"><input type="text" onblur="nameCk('mm', ${i.index})"  class="input02" style="width:59px;" id="_mmlast${i.index}" value="" maxlength="15" tabindex=20/></p>
									</td>
									<td class="al_c">
										<!--세례명/아명 표기체크시 보여지면됩니다.-->
										<div id="d_groom_parent_tail0" style="display:none">
											세례명
											<p class="mgt3"><input type="text" class="input02" style="width:59px;" name="groom_father_tail" value="" maxlength="15"  tabindex=13/></p>
											<p class="mgt5"><input type="text" class="input02" style="width:59px;" name="groom_mother_tail" value="" maxlength="15" tabindex=21/></p>
										</div>
									<!--//세례명/아명 표기체크시 보여지면됩니다.-->
											</td>
											<td class="al_c">
												<p class="mgt13">의</p>
											</td>
											<td class="al_c">
												<select onchange="conncectionCk('mc', ${i.index})" id="_mcsel${i.index}">
													<!-- <select name="groom_rank" onChange="if(this.value=='직접입력'){set_display_id('groom_rank_tmp0','block');groom_rank_tmp0.value=='';}else{set_display_id('groom_rank_tmp0','none');groom_rank_tmp0.value=='';}"  tabindex=14> -->
													<option value='장남'>장남</option>
													<option value='차남'>차남</option>
													<option value='삼남'>삼남</option>
													<option value='사남'>사남</option>
													<option value='오남'>오남</option>
													<option value='막내'>막내</option>
													<option value='조카'>조카</option>
													<option value='동생'>동생</option>
													<option value='아들'>아들</option>
													<option value='직접입력'>직접입력</option>
												</select>
												<div id="groom_rank_tmp0" style="display:none;"><input type="text" class="input02" style="width:65px;"  name="groom_rank_tmp" size=7 maxlength=7
														style="width:75px;" value=""/></div>
											</td>
									<td class="al_c">
										<p>성</p>
										<p class="mgt3"><input type="text" onblur="nameCk('m', ${i.index})"  class="input02" style="width:32px;" id="_mfirst${i.index}" value="" maxlength="10" onClick="if(this.value==''){alert('확인!!\n\n일반적으로 부친이 생존해 계신 경우 성은 아버지 성만 넣고 결혼 당사자의 성은 넣지 않는 것이 일반적입니다.\n\n올바른 표기법을 참조하시기 바라며, 성을 꼭 넣어야 하는 경우 입력하시기 바랍니다.');this.focus();}"  tabindex=15/></p>
									</td>
									<td class="al_c">
										<p>이름</p>
										<p class="mgt3"><input type="text"  onblur="nameCk('m', ${i.index})" class="input02" style="width:59px;" id="_mlast${i.index}" value="" maxlength="10"  tabindex=16/></p>
									</td>
									<td class="al_c">
									<!--세례명/아명 표기체크시 보여지면됩니다.-->
										<div id="d_groom_tail0" style="display:none">
											<p>세례명</p>
											<p class="mgt3"><input type="text" class="input02" style="width:59px;" name="groom_tail" value="" maxlength="10"  tabindex=17/></p>
										</div>
									<!--//세례명/아명 표기체크시 보여지면됩니다.-->
									</td>
									<td class="al_c">
										<p class="mgt13"><input type="checkbox" name="isgroom_tail_tmp" value="1"  onClick="OnChk_Tail(0,'groom')"/> 세례명/아명 표기</p>
									</td>
								</tr>
							</table>
							<p class="text05 mgt10">예) 김철수, 이영희의 장남 길동 </p>
						</td>
					</tr>
					<tr>
						<td class="tit">신부측</td>
						<td>
							<table class="ta04" style="width:100%">
								<caption>신부</caption>
								<colgroup>
									<col width="28"/>
									<col width="22"/>
									<col width="40"/>
									<col width="77"/>
									<col width="82"/>
									<col width="23"/>
									<col width="134"/>
									<col width="51"/>
									<col width="75"/>
									<col width="91"/>
									<col width="110"/>
									<col width=""/>
								</colgroup>
								<tr>
									<td>
										고인
										<input type="hidden" name="bride_father_header" value="">
										<input type="hidden" name="bride_mother_header" value="">
										<p class="mgt3"><input type="checkbox" onclick="nameCk('wf', ${i.index})" id="_wfck${i.index}"></p>
										<p class="mgt3"><input type="checkbox" onclick="nameCk('wm', ${i.index})" id="_wmck${i.index}"></p>
										<!-- <p class="mgt3"><input type="checkbox" name="bride_father_header_tmp" value="(故)"  onClick="OnChk_ParentHeader(0,'bride_father')" tabindex=23/></p>
										<p class="mgt3"><input type="checkbox" name="bride_mother_header_tmp" value="(故)"  onClick="OnChk_ParentHeader(0,'bride_mother')"/></p>
									 --></td>
									<td>
										<p class="mgt13">부</p>
										<p class="mgt20">모</p>
									</td>
									<td class="al_c">
										성
										<p class="mgt3"><input type="text" onblur="nameCk('wf', ${i.index})"  class="input02" style="width:32px;" id="_wffirst${i.index}" value="" maxlength="10" tabindex=24/></p>
										<p class="mgt5"><input type="text" onblur="nameCk('wm', ${i.index})"  class="input02" style="width:32px;" id="_wmfirst${i.index}" value="" maxlength="10" tabindex=32/></p>
									</td>
									<td class="al_c">
										이름
										<p class="mgt3"><input type="text" onblur="nameCk('wf', ${i.index})"  class="input02" style="width:59px;" id="_wflast${i.index}" value="" maxlength="15" tabindex=25/></p>
										<p class="mgt5"><input type="text" onblur="nameCk('wm', ${i.index})"  class="input02" style="width:59px;" id="_wmlast${i.index}" value="" maxlength="15" tabindex=33/></p>
									</td>
									<td class="al_c">
										<!--세례명/아명 표기체크시 보여지면됩니다.-->
										<div id="d_bride_parent_tail0" style="display:none">
											세례명
											<p class="mgt3"><input type="text" class="input02" style="width:59px;" name="bride_father_tail" value="" maxlength="15" tabindex=26/></p>
											<p class="mgt5"><input type="text" class="input02" style="width:59px;" name="bride_mother_tail" value="" maxlength="15" tabindex=34/></p>
										</div>
									<!--//세례명/아명 표기체크시 보여지면됩니다.-->
											</td>
											<td class="al_c">
												<p class="mgt13">의</p>
											</td>
											<td class="al_c">
												<p class="mgt13">
													<select  onchange="conncectionCk('wc', ${i.index})" id="_wcsel${i.index}">
													<!-- <select name="bride_rank" onChange="if(this.value=='직접입력'){set_display_id('bride_rank_tmp0','block');bride_rank_tmp0.value=='';}else{set_display_id('bride_rank_tmp0','none');bride_rank_tmp0.value=='';}" tabindex=27>
													 -->
														<option value='장녀'>장녀</option>
														<option value='차녀'>차녀</option>
														<option value='삼녀'>삼녀</option>
														<option value='사녀'>사녀</option>
														<option value='오녀'>오녀</option>
														<option value='육녀'>육녀</option>
														<option value='칠녀'>칠녀</option>
														<option value='막내'>막내</option>
														<option value='딸'>딸</option>
														<option value='조카'>조카</option>
														<option value='동생'>동생</option>
														<option value='직접입력'>직접입력</option>
													</select>
													<div id="bride_rank_tmp0" style="display:none"><input type="text" class="input02" style="width:65px;"  name="bride_rank_tmp" size=7 maxlength=7
															 value="" tabindex=28/></div>
										</p>
									</td>
									<td class="al_c">
										<p>성</p>
										<p class="mgt3"><input type="text" onblur="nameCk('w', ${i.index})"  class="input02" style="width:32px;" id="_wfirst${i.index}" value="" maxlength="10" onClick="if(this.value==''){alert('확인!!\n\n일반적으로 부친이 생존해 계신 경우 성은 아버지 성만 넣고 결혼 당사자의 성은 넣지 않는 것이 일반적입니다.\n\n올바른 표기법을 참조하시기 바라며, 성을 꼭 넣어야 하는 경우 입력하시기 바랍니다.');this.focus();}" tabindex=29/></p>
									</td>
									<td class="al_c">
										<p>이름</p>
										<p class="mgt3"><input type="text" onblur="nameCk('w', ${i.index})"  class="input02" style="width:59px;" id="_wlast${i.index}" value="" maxlength="10" tabindex=30/></p>
									</td>
									<td class="al_c">
									<!--세례명/아명 표기체크시 보여지면됩니다.-->
										<div id="d_bride_tail0" style="display:none">
											<p>세례명</p>
											<p class="mgt3"><input type="text" class="input02" style="width:59px;" name="bride_tail" value="" maxlength="10" tabindex=31/></p>
										</div>
									<!--//세례명/아명 표기체크시 보여지면됩니다.-->
									</td>
									<td class="al_c">
										<p class="mgt13"><input type="checkbox" name="isbride_tail_tmp" value="1"  onClick="OnChk_Tail(0,'bride')"/> 세례명/아명 표기</p>
									</td>
								</tr>
							</table>
						<!-- <button name="font1">궁서체</button> -->
							<p class="text03 mgt10">예) 김철수, 이영희의 장녀 수정 </p>
							<p class="text01 mgt20">청첩장과 봉투에는 통상 고인의 성함을 기재하지 않습니다.<br/>기재를 원하실 때는 반드시 <span>양가부모님과 상의하신 후 고인란에 체크</span>하시고 기재하시기 바랍니다. </p>
						</td>
					</tr>
				</table>
			</div>
			<h6>예식장 정보</h6>
			<div class="cpo_content">
				<table style="width:100%">
					<colgroup>
						<col width="30%"><col width="70%">
					</colgroup>
					<tr>
						<td>예약일시</td>
						<td>
						<select id="_year${i.index}" onchange="selectDate(${i.index})">
							<c:forEach var="j" begin="2018" end="2022">
							<option value="${j}">${j}</option>
							</c:forEach>
						</select>년
						<select id="_month${i.index}" onchange="selectDate(${i.index})">
							<c:forEach var="j" begin="1" end="12">
							<option value="${j}">${j}</option>
							</c:forEach>
						</select>월
						<select id="_day${i.index}" onchange="selectDate(${i.index})">
							<c:forEach var="j" begin="1" end="31">
							<option value="${j}">${j}</option>
							</c:forEach>
						</select>일
						<select id="_hour${i.index}" onchange="selectDate(${i.index})">
							<c:forEach var="j" begin="8" end="23">
							<option value="${j}">${j}</option>
							</c:forEach>
						</select>시
						<select id="_min${i.index}" onchange="selectDate(${i.index})">
							<c:forEach var="j" begin="0" end="50" step="10">
							<option value="${j}">${j}</option>
							</c:forEach>
						</select>분
						</td>
					</tr>
					<tr>
						<td colspan="2" >* [예식장/약도 검색]에서 찾고자 하는 예식장을 검색해주세요. (층/홀/실은 직접 입력해주시기 바랍니다.)
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<input type="text" id="_addr1${i.index}" size="30" readonly="readonly">
							<button type="button" id="addrbtn" onclick="DaumPostcode(${i.index})">주소찾기</button><br>
							<input type="text" id="_addr2${i.index}" size="30" onblur="cpaddSet(${i.index})">
						</td>
					</tr>
					<tr>
						<td>층/홀/실</td>
						<td>
							<input type="text" id="_addr3${i.index}" onblur="cpaddSet(${i.index})">
						<!-- <input type="checkbox" name="hall_detail_1">층/홀/실 없음 -->
						</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" id="hall_tel${i.index}" onblur="cptelSet(${i.index})"></td>
					</tr>
					<!-- <tr>
						<td>* 예식장을 선택한 경우 주소, 전화번호 정보는 고정됩니다. 변경원하실 경우 주문단의 '추가요청/전달사항' 항목에 수정사항을 입력해 주세요.</td>
						<td>* 예식장 약도는 이전 주문고객의 데이터를 기반으로 한 정보입니다. 변경사항이 발생할 수 있으니 약도 및 주소, 전화번호를 꼼꼼히 확인하시기 바랍니다.</td>
					</tr> -->
					<!-- <tr>
						<td colspan="2">----------------------------------------------------------------------------------------------------</td>
					</tr> -->
				</table>
			</div>
		</div>
	</div>
</div>
<p style="background: gray;text-align: center;cursor:pointer;" onclick="clickCdTd(${i.index})"><font color="white">접기</font></p>
<!-- 청첩장 상세 : 종료 -->
											</td>
										</tr>
									</table>								
								</td>
							</c:when>
							<c:otherwise>스파이</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
			
			<table>
				<colgroup>
					<col width="40%"><col width="20%"><col width="20%"><col width="20%">
				</colgroup>
				<tr>
					<td>
						<b>합계</b><br>
						고객님의 총 주문 합계 금액입니다.
					</td>
					<td>
						<b style="float: left;">총금액:</b>
						<p id="_nodcP" style="float: left; "></p>
						<b style="float: left;">원</b>
					</td>				
					<td>
						<b style="float: left;">할인금액:</b>&nbsp;&nbsp;&nbsp;
						<p id="_dcP" style="float: left;"></p>
						<b style="float: left;">원</b>
					</td>				
					<td>
						<b style="float: left;">결제금액:</b>&nbsp;&nbsp;&nbsp;
						<p id="_priceP" style="float: left;"></p>
						<b style="float: left;">원</b>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="align-content: right"><input type="button" value="결제" onclick="payCheck()"></td>
				</tr>
			</table>
			
		</form>
	</div>
</div>

<script type="text/javascript">
var totalPrice = 0;
var allnoDc = 0;
var allDc = 0;

function selectChange() {
	var selectedIndex = document.getElementsByName("selectedIndex");

	totalPrice = 0;
	allnoDc = 0;
	allDc = 0;
	
	for (var i = 0; i < selectedIndex.length; i++) {
		if (selectedIndex[i].checked) {
			//_price${i.index}
			var priceFldId = "#_price" + i;
			var nodcPrice = parseInt($(priceFldId).val());
			allnoDc += nodcPrice;
			
			var dcPrice = $("#dcp"+i).val();
			
			if(dcPrice != "NaN" && dcPrice != null && dcPrice != "undefined"){
				dcPrice = Number(dcPrice);
				nodcPrice = nodcPrice-dcPrice;
				allDc += dcPrice;
			   }
				
			totalPrice += nodcPrice;
		}
	}
	$("#_priceP").text(totalPrice);
	$("#_totalPrice").val(totalPrice);
	
	$("#_dcP").text(allDc);
	$("#_nodcP").text(allnoDc);
}
selectChange();

/* 결제 전 체크 */
function payCheck() {
	var flag = false;
	
	var selectedIndex = document.getElementsByName("selectedIndex");
	for (var i = 0; i < selectedIndex.length; i++) {
		if (selectedIndex[i].checked) {
			flag = true;
			break;
		}
	}
	
	if (!flag) alert("하나 이상의 상품을 선택해주세요.");
	if (flag) pay();
}

// 청첩장 상세 접기/펼치기
function clickCdTd(index) {
	var tdId = "#_cpoTd" + index;
	$(tdId).toggle();
}

// 내용 샘플
function msgSmp() {
	
}

// 이름
function nameCk(header, index) {
	// header : wf(신부 부), wm(신부 모), mf(신랑 부), mm(신랑 모), w(신부), m(신랑)
	var nameFldId = "#_" + header + "name" + index;
	
	var ckDeceasedId = "#_" + header + "ck" + index;
	var firstId = "#_" + header + "first" + index;
	var lastId = "#_" + header + "last" + index;
	
	var first = " ";
	if ($(firstId).val() != "") first = $(firstId).val();
	var last = " ";
	if ($(lastId).val() != "") last = $(lastId).val();
	var deceased = "";
	if (header != "w" && header != "m") {
		if ($(ckDeceasedId).is(":checked") == true) {
			deceased = "故 ";
		}
	}
	
	$(nameFldId).val(deceased + first + last);
}

// 관계
function  conncectionCk(header, index) {
	var cFldId = "#_" + header + index;
	var selectId = "#_" + header + "sel" + index + " option:selected";
	$(cFldId).val($(selectId).val());
}

// 홀 예약 정보
function selectDate(index) {
	var yearId = "#_year" + index;
	var monthId = "#_month" + index;
	var dayId = "#_day" + index;
	var hourId = "#_hour" + index;
	var minId = "#_min" + index;
	
	var str = "";
	str += $(yearId).val() + "년 ";
	str += $(monthId).val() + "월 ";
	str += $(dayId).val() + "일 ";
	str += $(hourId).val() + "시 ";
	str += $(minId).val() + "분 ";
	
	var cpdateFldId = "#_cpdate" + index;
	$(cpdateFldId).val(str);
}

// 홀 주소
function cpaddSet(index) {
	var addr1Id = "#_addr1" + index;
	var addr2Id = "#_addr2" + index;
	var addr3Id = "#_addr3" + index;
	
	var addr1Str = " ";
	if ($(addr1Id).val() != "") addr1Str = $(addr1Id).val();
	var addr2Str = " ";
	if ($(addr2Id).val() != "") addr2Str = $(addr2Id).val();
	var addr3Str = " ";
	if ($(addr3Id).val() != "") addr3Str = $(addr3Id).val();
	
	var str = addr1Str + " " + addr2Str + " " + addr3Str;
	
	var cpaddId = "#_cpadd" + index;
	$(cpaddId).val(str);
}

function DaumPostcode(index) {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('_addr1' + index).value = fullRoadAddr;
            document.getElementById('_addr1' + index).value = data.jibunAddress;

            cpaddSet(index);  
        }
    }).open();
      
}

// 홀 전화번호
function cptelSet(index){
	var halltelId = "#hall_tel" + index;
	var cptelFldId = "#_cptel" + index;
	
	var str = " ";
	if ($(halltelId).val() != null) str = $(halltelId).val();
	
	$(cptelFldId).val(str);
}


</script>

<!-- 결제 api 처리 -->
<script type="text/javascript">
var IMP = window.IMP; // 생략가능
IMP.init('imp38938843'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

function pay() {
	$("#_payFrm").attr("action", "afPayView.do").submit();
}
/* 
function pay() {
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : 'for you with us:결제',
	    amount : $("#_totalPrice").val(),
	    buyer_email : "${login.email}",
	    buyer_name : "${login.id}",
	    buyer_tel : "${login.phone}",
	    buyer_addr : "${login.address}",
	    buyer_postcode : '123-456',
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'	// 모바일 결제시 redirect 페이지
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        
	        //폼 action 실행
	    	$("#_payFrm").attr("action", "afPayView.do").submit();
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    //alert(msg);
	});
} */




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

<c:forEach items="${ bskList }" var="bsk" varStatus="i">
	<script type="text/javascript">

	 var tdId;
	 
	$.ajax({
		url:"getpaycp.do",
		type:"post",
		data:"bkseq=${bsk.bkseq}",
		 async : true,
		 success : function(cpdto){
			 if(cpdto.bkseq != null && cpdto.bkseq != "undefined"){
				 console.log("있음");
				 tdId = "#td${i.index}";
				
				 var title = cpdto.title; 
				 var discount =	cpdto.discount;
				 var price = "${bsk.total_price}";
				var dcprice = price*0.01*discount;
				dcprice = Math.ceil(dcprice);
				var seq = cpdto.seq;
				
				console.log("2"+tdId);
				console.log(cpdto.seq);
				console.log(cpdto.bkseq);
				
				 $(tdId).append("<div id='_cdiv${i.index}'>"+title+"(-"+discount+"%)"+dcprice+"원"+"</div>");
				 $(tdId).append("<button type='button' class='delbtn' id='_delbtn${i.index}'>삭제</button>");
				 $("#_delbtn${i.index}").attr("onclick","cpfunc('del',${i.index},${bsk.bkseq})");
				 $(tdId).append("<input type='hidden' value='"+dcprice+"' id='dcp${i.index}'>");
				 $(tdId).append("<input type='hidden' value='"+seq+"' id='cpseq${i.index}'>");
			 }else{
				 console.log("없음");
				 tdId = "#td${i.index}";
				 $(tdId).append("<button type='button' class='cpbtn' value='${bsk.bkseq}' id='_cpbtn${i.index}')>사용가능 쿠폰</button>");
				 $("#_cpbtn${i.index}").attr("onclick","cpfunc('add',${i.index},${bsk.bkseq})");
			 }
		 }
	}); 
	</script>
</c:forEach>


</body>











