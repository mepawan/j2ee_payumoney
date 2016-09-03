<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="page_title" scope="request" value="Career"/>
<c:set var="page_name" scope="request" value="career"/>
<jsp:include page="includes/head.jsp"/>
</head>
<body>
		<jsp:include page="includes/header.jsp"/>
		<div class="wrapper">
			<div class="background_container">
				<div class="container">
					<section id="left_sec">
						<div class="about_com">
							<h2 class="title">Easy way to success</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sodales erat tempor lorem lobortis varius. Proin ultrices interdum felis, et molestie ante ultrices a. Nulla eu velit eu tortor feugiat sodales non vel diam. Praesent malesuada magna a sollicitudin accumsan.</p>
						</div>     
						<div class="career_gallery">
							<div class="gallery_sec_bk">
								<div class="gallery_sec">
									<figure><img src="images/crc1.png"></figure>
									Analytics
								</div>
							</div>

							<div class="gallery_sec_bk">
								<div class="gallery_sec">
									<figure><img src="images/crc2.png"></figure>
									Designers
								</div>
							</div>

							<div class="gallery_sec_bk">
								<div class="gallery_sec">
									<figure><img src="images/crc3.png"></figure>
									Marketers
								</div>
							</div>


							<div class="gallery_sec_bk">
								<div class="gallery_sec">
									<figure><img src="images/crc5.png"></figure>
									Recruiters
								</div>
							</div>


							<div class="gallery_sec_bk">
								<div class="gallery_sec">
									<figure><img src="images/crc6.png"></figure>
									Sales
								</div>
							</div>
							<div class="gallery_sec_bk">
								<div class="gallery_sec">
									<figure><img src="images/crc4.png"></figure>
									Technology
								</div>
							</div>
						</div>  <!-- / .career_gallery -->
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
