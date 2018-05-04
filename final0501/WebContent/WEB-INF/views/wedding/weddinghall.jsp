<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery.min.js"></script>
<!-- 웨딩홀 사진
  ================================================== -->
  <section id="nino-uniqueDesign">
  	<div class="container">
  		<h2 class="nino-sectionHeading" >
		<span class="nino-subHeading" >Will you marry me?</span>
		wedding-hall
	</h2>
	<div class="sectionContent">
		<div class="nino-devices">
			<img class="tablet" src="assets/images/unique-design/img-1.png" alt="">
			<img class="mobile" src="assets/images/unique-design/img-2.png" alt="">
		</div>
	</div>
  	</div>
  </section><!--/#nino-uniqueDesign-->
<section id="nino-latestBlog">
	<!-- left bar -->
	<div style="padding-left: 30px">
		<div class="w3-bar-block w3-light-white w3-card" style="width:15%; padding-left: 10px; float: left; background-color: #ff99cc">
			<jsp:include page="/WEB-INF/views/wedding/wh_left_bar.jsp"/>
		</div>
	</div>
   	<div class="container">   		
   		<h2 class="nino-sectionHeading" onclick="location.href='views/hall/weddinghall.jsp'">
			<span class="nino-subHeading">Will you marry me?</span>
			WEDDING-HALL
		</h2>
				
		<div id="wrapper" style="padding-left: 1px; width:80%; float: right;">	
			<div class="sectionContent">
				<div class="row nino-hoverEffect">		<!-- css추가 : nino-hoverEffect -->
					<c:forEach var="wd" items="${list}">
						<div class="col-md-4 col-sm-4" style="padding-bottom: 20px">
							<article>
								<div class="articleThumb">
									<!-- css추가 -->			
									<div class="item">
										<a class="overlay" href="hallView.do?whseq=${wd.whseq }">			<!-- detail창 이동 -->	
											<span class="content">
												 <i class="fa fa-camera nino-icon "></i>
												<p>홀타입 : ${wd.htype }</p>
												<p>식사메뉴 : ${wd.menutype }</p>
												<p>보증인원 : ${wd.minpeople }~${wd.maxpeople }명</p>
											</span>
											<c:if test="${empty wd.picture || wd.picture eq ''}">
												<img src="assets/images/weddinghall/img-1.jpg">
											</c:if>
											<c:if test="${not empty wd.picture && wd.picture ne ''}">
												<img src="upload/${ wd.picture }" width="250px" height="200px" />
											</c:if>
											
											<!-- 
											<div class="date">
												<span class="number">글올린날짜</span>
												<span class="text">글올린날짜</span>
											</div>
											 -->										
										</a>
									</div>
								</div>
								<h3 class="articleTitle"><a href="hallView.do?whseq=${wd.whseq }">${wd.cname }</a></h3>		<!-- detail창 이동 -->	
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
