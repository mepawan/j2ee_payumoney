<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="page_title" scope="request" value="FAQ"/>
<c:set var="page_name" scope="request" value="faq"/>
<jsp:include page="includes/head.jsp"/>
</head>
<body>
		<jsp:include page="includes/header.jsp"/>
		<div class="wrapper">
			<div class="background_container">
				<div class="container">
					<section id="left_sec">
						<h2 class="title">What Type of help are you looking for?</h2>
						<div class="faq_cover">
							<p class="questsicon"><span><img src="images/ques_icon.png"></span> What is Lorem Ipsum?</p>
							<p class="anserss">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
						</div><!--faq_cover-->
						<div class="faq_cover">
							<p class="questsicon"><span><img src="images/ques_icon.png"></span> What is Lorem Ipsum?</p>
							<p class="anserss">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
						</div><!--faq_cover-->
						<div class="faq_cover">
							<p class="questsicon"><span><img src="images/ques_icon.png"></span> What is Lorem Ipsum?</p>
							<p class="anserss">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
						</div><!--faq_cover-->
						<div class="faq_contact">
							<p class="notfound">Not found the answer?</p>
							<p>feel free to contact out customer service for free support</p>
							<div class="contactimage">
									<img src="images/telephone.png" width="50" height="48" />
									<p> - 1010101010</p>
							</div>
						</div>          
					</section><!--left_sec-->
					<section id="right_bar">
						<div class="more_opp">
							<h3 class="title">Message from the Director</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sodales erat tempor lorem lobortis varius. Proin ultrices interdum felis, et molestie ante ultrices a. Nulla eu velit eu tortor feugiat sodales non vel diam. Praesent malesuada magna a sollicitudin accumsan.</p>
						</div>
						<div class="more_opp">
							<h3 class="title">Message from the Vice-Chancellor</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sodales erat tempor lorem lobortis varius. Proin ultrices interdum felis, et molestie ante ultrices a. Nulla eu velit eu tortor feugiat sodales non vel diam. Praesent malesuada magna a sollicitudin accumsan.</p>
						</div>
					</section>
				</div>  <!----container----> 
				<div class="clearfix"></div>
			</div> <!--background_container-->  
		</div> <!-- /. wrapper-->
		<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
