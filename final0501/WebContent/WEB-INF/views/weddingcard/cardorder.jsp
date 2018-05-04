<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>

#product{
	width: 80%;
	height: 100%;
	background-color: white;
	margin : 0 auto;
	align: center;
	border: 1px solid lightgray;
}

div{
	
}

</style>

<div id = "product">
<form name="frmForm" id="_frmForm" action="orderAf.do" method="post" 
enctype="multipart/form-data">



<div class="order2">
	<h2>>>카드 기본인쇄 정보를 입렵합니다</h2>
	<div class="o_font">
		<h2>폰트/레이아웃 선택</h2>
		<div class="d_font2">
		<button id="fontbtn">폰트/레이아웃 선책</button>
		<input type="text" name="c_font"><br>
		폰트/레이아웃 선택버튼을 클릭하시면 카드에 인쇄될 폰트(서체)를 선택하실 수 있습니다.
		</div>
	</div>
</div>

	<div class="o_msg">
		<h2>인사말 선택</h2>
		<div class="o_asg2">
			<button id="o_msgbtn">인사말 샘플보기</button>
			<textarea rows="10" cols="50" name="content" id="_content"></textarea><br>
			인사말은 고객님이 직접 입력하시거나 제공되는 인사말샘플을 참고하여 작성할 수 있습니다.<br>
			인사말 샘플 참고시에는 반드시 오탈자, 띄어쓰기가 제대로 되었는지 다시 한번 꼼꼼히 확인 하시기 바랍니다.<br>
			* 고객님이 직접 입력하신 인사말 경우, 추후 고객 우수 인사말로 등록되어 활용될 수 있습니다.<br>
			
		</div>
	</div>
	
	<div class="wed_info">
		<h2>신랑/신부 정보입력</h2>
		<div class="w_info">
		<div class="box_st1_5">
						<table class="ta01 mgt10">
							<colgroup>
								<col width="150"/>
								<col width=""/>
							</colgroup>
							<tr>
								<td class="tit">신랑측</td>
								<td>
									<table class="ta04">
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

												<p class="mgt3"><input type="checkbox" name="groom_father_header_tmp" value="(故)"  onClick="OnChk_ParentHeader(0,'groom_father')" tabindex=10/></p>
												<p class="mgt3"><input type="checkbox" name="groom_mother_header_tmp" value="(故)"  onClick="OnChk_ParentHeader(0,'groom_mother')" tabindex=18/></p>
											</td>
											<td>
												<p class="mgt13">부</p>
												<p class="mgt20">모</p>
											</td>
											<td class="al_c">
												성
												<p class="mgt3"><input type="text" class="input02" style="width:32px;"name="groom_father_fname" value="" maxlength="10" tabindex=11/></p>
												<p class="mgt5"><input type="text" class="input02" style="width:32px;"name="groom_mother_fname" value="" maxlength="10" tabindex=19/></p>
											</td>
											<td class="al_c">
												이름
												<p class="mgt3"><input type="text" class="input02" style="width:59px;" name="groom_father" value="" maxlength="15" tabindex=12/></p>
												<p class="mgt5"><input type="text" class="input02" style="width:59px;" name="groom_mother" value="" maxlength="15" tabindex=20/></p>
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
												<p class="mgt13">
													<select name="groom_rank" onChange="if(this.value=='직접입력'){set_display_id('groom_rank_tmp0','block');groom_rank_tmp0.value=='';}else{set_display_id('groom_rank_tmp0','none');groom_rank_tmp0.value=='';}"  tabindex=14>
													<option value="">선택</option>
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
												</p>
											</td>
											<td class="al_c">
												<p>성</p>
												<p class="mgt3"><input type="text" class="input02" style="width:32px;" name="groom_fname" value="" maxlength="10" onClick="if(this.value==''){alert('확인!!\n\n일반적으로 부친이 생존해 계신 경우 성은 아버지 성만 넣고 결혼 당사자의 성은 넣지 않는 것이 일반적입니다.\n\n올바른 표기법을 참조하시기 바라며, 성을 꼭 넣어야 하는 경우 입력하시기 바랍니다.');this.focus();}"  tabindex=15/></p>
											</td>
											<td class="al_c">
												<p>이름</p>
												<p class="mgt3"><input type="text" class="input02" style="width:59px;" name="groom_name" value="" maxlength="10"  tabindex=16/></p>
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
									<table class="ta04">
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
												<p class="mgt3"><input type="checkbox" name="bride_father_header_tmp" value="(故)"  onClick="OnChk_ParentHeader(0,'bride_father')" tabindex=23/></p>
												<p class="mgt3"><input type="checkbox" name="bride_mother_header_tmp" value="(故)"  onClick="OnChk_ParentHeader(0,'bride_mother')"/></p>
											</td>
											<td>
												<p class="mgt13">부</p>
												<p class="mgt20">모</p>
											</td>
											<td class="al_c">
												성
												<p class="mgt3"><input type="text" class="input02" style="width:32px;"name="bride_father_fname" value="" maxlength="10" tabindex=24/></p>
												<p class="mgt5"><input type="text" class="input02" style="width:32px;"name="bride_mother_fname" value="" maxlength="10" tabindex=32/></p>
											</td>
											<td class="al_c">
												이름
												<p class="mgt3"><input type="text" class="input02" style="width:59px;" name="bride_father" value="" maxlength="15" tabindex=25/></p>
												<p class="mgt5"><input type="text" class="input02" style="width:59px;" name="bride_mother" value="" maxlength="15" tabindex=33/></p>
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
													<select name="bride_rank" onChange="if(this.value=='직접입력'){set_display_id('bride_rank_tmp0','block');bride_rank_tmp0.value=='';}else{set_display_id('bride_rank_tmp0','none');bride_rank_tmp0.value=='';}" tabindex=27>
													<option value="">선택</option>
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
												<p class="mgt3"><input type="text" class="input02" style="width:32px;" name="bride_fname" value="" maxlength="10" onClick="if(this.value==''){alert('확인!!\n\n일반적으로 부친이 생존해 계신 경우 성은 아버지 성만 넣고 결혼 당사자의 성은 넣지 않는 것이 일반적입니다.\n\n올바른 표기법을 참조하시기 바라며, 성을 꼭 넣어야 하는 경우 입력하시기 바랍니다.');this.focus();}" tabindex=29/></p>
											</td>
											<td class="al_c">
												<p>이름</p>
												<p class="mgt3"><input type="text" class="input02" style="width:59px;" name="bride_name" value="" maxlength="10" tabindex=30/></p>
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
<button name="font1">궁서체</button>
									<p class="text03 mgt10">예) 김철수, 이영희의 장녀 수정 </p>
									<p class="text01 mgt20">청첩장과 봉투에는 통상 고인의 성함을 기재하지 않습니다.<br/>기재를 원하실 때는 반드시 <span>양가부모님과 상의하신 후 고인란에 체크</span>하시고 기재하시기 바랍니다. </p>
								</td>
							</tr>
						</table>
					</div>

		</div>
	</div>
	
	<div class="hall_info">
	<h2>예식장 정보</h2>
	<div class="hall_info2">
	<table>

		<tr>
			<td>예약일시</td>
			<td>
			<select name="year">
				<c:forEach var="i" begin="2018" end="2022">
				<option value="${i}">${i}</option>
				</c:forEach>
			</select>년
				 
			<select name="month">
				<c:forEach var="i" begin="1" end="12">
				<option value="${i}">${i}</option>
				</c:forEach>
			</select>월
				 
			<select name="day">
				 
				<c:forEach var="i" begin="1" end="31">
				<option value="${i}">${i}</option>
				</c:forEach>일
			</select>
			<select name="hall_time1">
				<c:forEach var="i" begin="8" end="23">
				<option value="${i}">${i}</option>
				</c:forEach>
			</select>시
			<select name="hall_time2">
				<c:forEach var="i" begin="0" end="50" step="10">
				<option value="${i}">${i}</option>
				</c:forEach>
			</select>분
			</td>
		</tr>
		<tr>
			<td colspan="2" >* [예식장/약도 검색]에서 찾고자 하는 예식장을 검색해주세요. (층/홀/실은 직접 입력해주시기 바랍니다.)
			</td>
		</tr>
		<tr>
			<td>층/홀/실</td>
			<td><input type="text" name="hall_detail"><input type="checkbox" name="hall_detail_1">층/홀/실 없음</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="hall_tel"></td>
		</tr>
		<tr>
			<td><img src="assets/images/others/regiimg.png">주소</td>
			<td>
				<input type="hidden" name="address" id="_address">
				<input type="text" id="_addr1" size="30" readonly="readonly">
				<button type="button" id="addrbtn" onclick="DaumPostcode()">주소찾기</button><br>
				<input type="text" id="_addr2" size="30">
			</td>
		</tr>
		<tr>
			<td>* 예식장을 선택한 경우 주소, 전화번호 정보는 고정됩니다. 변경원하실 경우 주문단의 '추가요청/전달사항' 항목에 수정사항을 입력해 주세요.</td>
			<td>* 예식장 약도는 이전 주문고객의 데이터를 기반으로 한 정보입니다. 변경사항이 발생할 수 있으니 약도 및 주소, 전화번호를 꼼꼼히 확인하시기 바랍니다.</td>
		</tr>
		<tr>
			<td colspan="2">----------------------------------------------------------------------------------------------------</td>
		</tr>
	</table>
	</div>
	
	</div>

</form>
</div>	


<script>
function DaumPostcode() {
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
            document.getElementById('_addr1').value = fullRoadAddr;
            document.getElementById('_addr1').value = data.jibunAddress;
          
        }
    }).open();
}

</script>
