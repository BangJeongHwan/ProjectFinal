<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>


<%
String scategory = (String)request.getAttribute("s_category");
if(scategory == null) scategory = "";

String category = (String)request.getAttribute("category");
if(category == null) category = "";

int cbag = (int)request.getAttribute("cbag");
if(cbag == 0) cbag = 0;

String cardsize = (String)request.getAttribute("cardsize");
if(cardsize == null) cardsize = "";
%>

<script type="text/javascript">
var str='<%=scategory %>';
$(document).ready(function(){	
	document.frmForm1.s_category.value = str;
	
	if($("#_s_keyword").val().trim() == ""){
		document.frmForm1.s_category.value = "";
	}	
}); 

var str2 = '<%=category %>';
$(document).ready(function() {
	document.frmForm1.category.value = str2;
});

var str3 = '<%=cbag %>';
$(document).ready(function() {
	document.frmForm1.cbag.value = str3;
});

var str4 = '<%=cardsize%>';
$(document).ready(function() {
	document.frmForm1.cardsize.value = str4;
});

</script> 

<style>
.c_list{
margin-top: 50px;
}

.cardlist_main{
background-color: white;
}

.c_list_{
margin-top: 30px;
margin-left: 40px;
width: 20%;
height: 20%;
text-align: center;
float: left;
}


img{
width:200px;
height:170px;
}

.search_bar{
margin : 0 auto;
width: 80%;
height:10%;
align: left;
}

.c_title{
font-size: 5px;
}

</style>
<input type="hidden" name="wiseq" value="${ccd.wiseq}">
<div class="cardlist_main">
<div class = "container">
<section id="nino-portfolio">

		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">What we do</span>
				Wedding-Card
			</h2>
		</div>
		<div class="sectionContent">
			<ul class="nino-portfolioItems">
				<li class="item">
					<a href="views/card/card.jsp">
						<img src="assets/images/card/img-1.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-crown nino-icon"></i>
								<h4 class="title">creatively designed</h4>
								<span class="desc">Lorem ipsum dolor sit</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="assets/images/card/img-2.jpg">
						<img src="assets/images/card/img-2.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-cube-outline nino-icon"></i>
								<h4 class="title">creatively designed</h4>
								<span class="desc">Lorem ipsum dolor sit</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="assets/images/card/img-3.jpg">
						<img src="assets/images/card/img-3.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-desktop-mac nino-icon"></i>
								<h4 class="title">creatively designed</h4>
								<span class="desc">Lorem ipsum dolor sit</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="assets/images/card/img-4.jpg">
						<img src="assets/images/card/img-4.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-flower nino-icon"></i>
								<h4 class="title">creatively designed</h4>
								<span class="desc">Lorem ipsum dolor sit</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="assets/images/card/img-5.jpg">
						<img src="assets/images/card/img-5.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-gamepad-variant nino-icon"></i>
								<h4 class="title">creatively designed</h4>
								<span class="desc">Lorem ipsum dolor sit</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="assets/images/card/img-6.jpg">
						<img src="assets/images/card/img-6.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-gnome nino-icon"></i>
								<h4 class="title">creatively designed</h4>
								<span class="desc">Lorem ipsum dolor sit</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="assets/images/card/img-7.jpg">
						<img src="assets/images/card/img-7.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-guitar-electric nino-icon"></i>
								<h4 class="title">creatively designed</h4>
								<span class="desc">Lorem ipsum dolor sit</span>
							</div>
						</div>
					</a>
				</li>
			</ul>
		</div>
	</section><!--/#nino-portfolio-->

	<div style="border-bottom:1px solid lightgray;" class="c_list">
	<h1>&nbsp;&nbsp;${ccd.cid}</h1> 
	<h2>&nbsp;&nbsp;청첩장 보기</h2>
	<span>행복이 시작되는 아름다운 날 for you, with us와 함께하세요. </span><br>
	</div>
	
	
<c:forEach var="cdlist" items="${cdlist}" varStatus="cdlistS"> 

	<div class="c_list_">
		<div class="c_list_1">
			<div class="c_image">
				<a href = 'carddetail.do?cdseq=${cdlist.cdseq}'> <img src="upload/${cdlist.picture0}">
				</a>
			</div>
			<h4 class="c_name">${cdlist.title}</h4>
			<p class="c_price">${cdlist.price}원</p>
			<p class="c_title">${cdlist.content} </p>
		</div>
	</div>
	
</c:forEach>	
	</div>
	

<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>						

<div id="paging_wrap">
<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
	<jsp:param value="${pageNumber }" name="pageNumber"/>
	<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
	<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
	<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
</jsp:include>
</div>


	<div class="search_bar" style="border-top:1px solid lightgray; width: 60%">
	<form name="frmForm1" id="_frmFormSearch" method="post" action="">
<table>
<tr>
	<th colspan="2">검색</th>
</tr>
<tr>
	<td>
		<select id="order" name="order">
			<option value="cdseq desc">판매인기순</option>
			<option value="sysdate desc">신상품순</option>	
			<option value="sysdate desc">후기많은순</option>	
			<option value="price asc">높은가격순</option>	
			<option value="price desc">낮은가격순</option>							
		</select>
	</td>
</tr>
<tr>
	<th style="padding-left:5px;">
		종류
	</th>
	<td style="padding-left:5px;">
		<select id="category" name="category" >
			<option value="" selected="selected">선택</option>
			<option value="mobile">모바일</option>
			<option value="analog">아날로그</option>								
		</select>
	</td>
</tr>
<tr>
	<th style="padding-left:5px;">
		봉투
	</th>
	<td colspan="3" style="padding-left:5px;">
	<select id="cbag" name="cbag" >
			<option value="" selected="selected">선택</option>
			<option value=2>봉투있음</option>
			<option value=1>봉투없음</option>								
		</select>
	</td>
</tr>
<tr>
	<th style="padding-left:5px;">
		모양
	</th>
	<td colspan="3" style="padding-left:5px;">
	<select id="cardsize" name="cardsize" >
			<option value="" selected="selected">선택</option>
			<option value="recwidth">직사각형세로</option>
			<option value="recheight">직사각형가로</option>	
			<option value="square">정사각형</option>							
		</select>	
	</td>
</tr>
<tr>
	<td style="padding-left:5px;">
		<select id="_s_category" name="s_category">
			<option value="" selected="selected">선택</option>
			<option value="title">카드이름</option>
			<option value="content">키워드</option>								
		</select>
	</td>
	<td colspan="2" style="padding-left:5px;"><input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/>
	<span><button type="button" id="_btnSearch"> 검색 </button>
	</span></td>
</tr>
</table>
</form>
</div>
</div>	



<script>

  $("#_btnSearch").click(function() {
  	alert('search');	
 	$("#_frmFormSearch").attr({ "target":"_self", "action":"pagingcdlist.do?wiseq=${ccd.wiseq}"}).submit();
	
  });

function goPage(pageNumber) {	
	$("#_pageNumber").val(pageNumber) ;
	$("#_frmFormSearch").attr("target","_self").attr("action","pagingcdlist.do?wiseq=${ccd.wiseq}").submit();
}

// $(document).ready(function () {
// 	var select1 = $("#category").val();
// 	var select2 = $("#cbag").value;
// 	var select3 = $("#cardsize").value;

	
// 	if(select1.trim()!=""){
// 		document.getElementById("cbag").disabled = false;
// 	}else(select2.trim()!=""){
// 		document.getElementById("cardsize").disabled = false;
// 	}

// });

</script>
