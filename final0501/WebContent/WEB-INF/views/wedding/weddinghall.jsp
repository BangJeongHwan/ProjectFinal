<%@page import="kh.com.a.model2.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%LoginDto login = (LoginDto)request.getSession().getAttribute("login"); %>
<%
LoginDto mem = (LoginDto)session.getAttribute("login");
if(mem==null){
	mem = new LoginDto("guest", "guest");
	session.setAttribute("login", mem);
}
%>


<!-- leftbar -->
	<div style="padding-left: 30px;">
		<div id="_leftbar" class="w3-bar-block w3-light-white w3-card" style="position:fixed; z-index:998; width:20%; float: left; background-color: write; display: none;">
			<jsp:include page="/WEB-INF/views/wedding/wh_left_bar.jsp"/>
		</div>
	</div>
<!-- 웨딩홀 사진
  ================================================== -->
  <section id="nino-uniqueDesign" style="height: 680px;">
  	<div class="container">
  		<h2 class="nino-sectionHeading">
		<span class="nino-subHeading" >Will you marry me?</span>
		wedding-hall
	</h2>
	<div class="sectionContent">
		<div class="nino-devices">
			<!-- <img class="tablet" src="assets/images/unique-design/img-1.png" alt=""> -->
			<!-- <img class="mobile" src="assets/images/unique-design/img-2.png" alt=""> -->
		</div>
	</div>
  	</div>
  </section><!--/#nino-uniqueDesign-->
<section id="nino-latestBlog" style="margin-bottom: 250px;">
	<!-- left bar -->
<%-- 	<div style="padding-left: 30px">
		<div class="w3-bar-block w3-light-white w3-card" style="position:fixed; width:15%; padding-left: 10px; float: left; background-color: write">
			<jsp:include page="/WEB-INF/views/wedding/wh_left_bar.jsp"/>
		</div>
	</div> --%>
   	<div class="container">   		
   		<h2 class="nino-sectionHeading">
			<span class="nino-subHeading">Will you marry me?</span>
			WEDDING-HALL
		</h2>
		
		<c:if test="${not empty recentlist }">
		<div style="border:1px solid pink;width:750px; height: 120px; border: 1px; padding-left:200px;">
			<h3>최근 본 상품 목록</h3>
				<c:forEach var="recentDto" items="${recentlist }" varStatus="i">
					<div style="float: left">
						<img style="padding-left:10px; width:100px; hight: 100px;" src="upload/${recentDto.pic }" onclick="view(${recentDto.seq })">  
						<p style="size: 10px">${recentDto.cname }</p>
					</div>
				</c:forEach>
		</div>
		<br><br>
		</c:if>
	
		<div id="wrapper" style="padding-left: 1px; width:80%; float: right;">	
			<div class="sectionContent">
				<div class="row nino-hoverEffect" id="_list">		<!-- css추가 : nino-hoverEffect -->
					<c:forEach var="wd" items="${list}">
						<div class="col-md-4 col-sm-4" style="padding-bottom: 20px">
							<article>
								<div class="articleThumb">
									<!-- css추가 -->			
									<div class="item">
										<a class="overlay" href="hallView.do?whseq=${wd.whseq }&pdseq=${wd.whseq }&usid=<%=login.getId()%>">			<!-- detail창 이동 -->	
											<span class="content">
												 <i class="fa fa-camera nino-icon "></i>
												<p>홀타입 : ${wd.htype }</p>
												<p>식사메뉴 : ${wd.menutype }</p>
												<p>보증인원 : ${wd.minpeople }~${wd.maxpeople }명</p>
											</span>
											<%-- <c:if test="${not empty wd.picture && wd.picture ne ''}"> --%>
												<img alt="이미지 없음" src="upload/${ wd.picture }" width="250px" height="200px" />
											<%-- </c:if>								 --%>
										</a>
									</div>
								</div>
								<h3 class="articleTitle"><a href="hallView.do?whseq=${wd.whseq }&pdseq=${wd.whseq }&usid=<%=login.getId()%>">${wd.cname }</a></h3>		<!-- detail창 이동 -->	
								<p class="articleDesc">
									${wd.content}
								</p>
								<div class="articleMeta">
									<a href="#"><i class="mdi mdi-eye nino-icon"></i>${wd.readcount }</a>
									<a href="#"><i class="mdi mdi-comment-multiple-outline nino-icon"></i>${wd.commentcount }</a>
								</div>
							</article>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
   	</div>
</section>

<script>

var data = "";
var type = "";
$("input:radio[name=Htype]").on('click',function () {
	data = $("input:radio[name=Htype]:checked").val();
	type = "Hall";
	//alert(type);
	//alert(data);
	resetList(type, data);
});
$("input:radio[name=Ctype]").on('click',function () {
	data = $("input:radio[name=Ctype]:checked").val();
	type = "Cook";
	//alert(type);
	//alert(data);
	resetList(type, data);
});
$("input:radio[name=Ptype]").on('click',function () {
	data = $("input:radio[name=Ptype]:checked").val();
	type = "People";
	//alert(type);
	//alert(data);
	resetList(type, data);
});

// List 초기화
function resetList(type, data){
	var datas = {
		type:type,
		data:data
	}
	$.ajax({
		url:"resetList.do",
		data:datas,
		success:function(msg){
			list = msg.list;
			if(list!=null){
				$("#_list").empty();
				var tagStr = "";
				for(var i=0;i<list.length;i++){
					tagStr += "<div class='col-md-4 col-sm-4' style='padding-bottom: 20px'>";
					tagStr += "	<article>";
					tagStr += "	<div class='articleThumb'>";
					tagStr += "		<div class='item'>";
					tagStr += "			<a class='overlay' href='hallView.do?whseq="+list[i].whseq+"'>";
					tagStr += "			<span class='content'>";
					tagStr += "				<i class='fa fa-camera nino-icon '></i>";
					tagStr += "				<p>홀타입 : "+list[i].htype+"</p>";
					tagStr += "				<p>식사메뉴 : "+list[i].menutype+"</p>";
					tagStr += "				<p>보증인원 : "+list[i].minpeople+"~"+list[i].maxpeople+"명</p>";
					tagStr += "			</span>";
					tagStr += "			<img alt='이미지 없음' src='upload/"+list[i].picture+"' width='250px' height='200px'/>";
					tagStr += "			</a>";
					tagStr += "		</div>";
					tagStr += "	</div>";
					tagStr += "	<h3 class='articleTitle'><a href='hallView.do?whseq="+list[i].whseq+"'>"+list[i].cname+"</a></h3>";
					tagStr += "	<p class='articleDesc'>"+list[i].content+"</p>";
					tagStr += "	<div class='articleMeta'>";
					tagStr += "		<a href='#'><i class='mdi mdi-eye nino-icon'></i>"+list[i].readcount+"</a>";
					tagStr += "		<a href='#'><i class='mdi mdi-comment-multiple-outline nino-icon'></i>"+list[i].commentcount+"</a>";
					tagStr += "	</div>";
					tagStr += "	</article>";
					tagStr += "</div>";
				}
				$("#_list").append(tagStr);
			}
			//alert(msg.list.length);
	    },
	    error:function(reqest, status, error){
	        alert("실패");
	    }
	});
}

// 스크롤에 따라 보이고 안보이고
$(window).scroll(function(){
	if ($(this).scrollTop() > 500) {
       $('#_leftbar').css("display","block");
    }else{
       $('#_leftbar').css("display","none");
    }
});

function view(x){
	if(x >= 1000 && x <2000){
		//웨딩홀 
		location.href = "hallView.do?whseq="+x+"&pdseq="+x+"&usid=<%=mem.getId()%>";
	}else if(x >= 2000 && x < 3000){
		//청첩장
		location.href="carddetail.do?cdseq="+x+"&usid=<%=mem.getId()%>";
	}else if(x >= 3000 && x < 4000){
		//스튜디오
		location.href="studioDetail.do?stseq="+x+"&pdseq="+x+"&usid=<%=mem.getId()%>";
	}else if(x >= 4000 && x < 5000){
		//드레스
		location.href="dressDetail.do?dsseq="+x+"&pdseq="+x+"&usid=<%=mem.getId()%>";
	}else if(x >= 5000 && x < 6000){
		//메이크업
		location.href="muDetailView.do?museq="+x;
	}
}
</script>
