<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<c:set var="page_title" scope="request" value="About Us"/>
<c:set var="page_name" scope="request" value="aboutus"/>
<head>
<jsp:include page="includes/head.jsp"/>
</head>
<body>
		<jsp:include page="includes/header.jsp"/>
		<div class="wrapper">
			<div class="background_container">
				<div class="container">
					<section id="left_sec">
						<div class="about_com">
							<div class="abut_left">
								<h2 class="title">About Company</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sodales erat tempor lorem lobortis varius. Proin ultrices interdum felis, et molestie ante ultrices a. Nulla eu velit eu tortor feugiat sodales non vel diam. Praesent malesuada magna a sollicitudin accumsan. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							</div>
							<div class="abut_left">
								<img src="images/ab_company.jpg" width="586" height="359">
							</div>
						</div>
						<div class="about_com">
							<div class="abut_sections">
								<h2 class="title">Who we are?</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sodales erat tempor lorem lobortis varius. Proin ultrices interdum felis, et molestie ante ultrices a.</p>
							</div>
							<div class="abut_sections">
								<h2 class="title">What we do?</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sodales erat tempor lorem lobortis varius. Proin ultrices interdum felis, et molestie ante ultrices a.</p>
							</div>
						</div>
						<div class="about_com">
								<h2 class="title">Our Services</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sodales erat tempor lorem lobortis varius. Proin ultrices interdum felis, et molestie ante ultrices a.</p>
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
				</div><!----container----> 
				<div class="clearfix"></div>
			</div> <!--background_container-->  
		</div> <!-- /. wrapper-->
		<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
