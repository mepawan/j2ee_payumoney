<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="page_title" scope="request" value="Welcome "/>
<c:set var="page_name" scope="request" value="home"/>
<jsp:include page="includes/head.jsp"/>
</head>
<body class="front">
		<jsp:include page="includes/header.jsp"/>
		<div class="wrapper">
			<div class="background_container">
				<div class="container">
					<section id="awesome_teacheres">
						<h2 class="title">Awesome Teacheres</h2>
						<h3 class="title">Handpicked to provide you wholesome learning experience.</h3>
						<div class="aw_con_bk">
							<figure><img src="images/promice.png" ></figure>
							<div class="aw_right">
								<ul class="a03_sub">
									<li>Personalized Learning</li>
									<li>Regular Tests and Assignments</li>
									<li>Doubts Busting and Thorough Revision</li>
									<li>Aligned with School curriculum</li>
									<li>Reporting to Parents</li>
								</ul>
							</div>
						</div>
					</section>
				</div><!----container----> 
				
				
				<div class="learning_bk">
					<div class="container">
						<h2 class="title"> Benefits of Live online tutoring</h2>
						<div class="thumb_con">
								<div class="thum_sec">
									<div class="thum_inner">
										<figure><img src="images/car1.png"></figure>
										<h3>Personalized Live Teaching</h3>
										<ul>
											<li>100% Personal attention</li>
											<li>Teaching at student's pace</li>
										</ul>  
									</div>  
								</div>

								<div class="thum_sec">
									<div class="thum_inner">
										<figure><img src="images/car2.png"></figure>
										<h3>Better Than Recorded Lectures</h3>
										<ul>
											<li>2 way interaction</li>
											<li>Monitoring & Counseling</li>
										</ul>  
									</div>  
								</div>

								<div class="thum_sec">
									<div class="thum_inner">
										<figure><img src="images/car3.png"></figure>
										<h3>Save on Time and more Safety</h3>
										<ul>
											<li>No commuting</li>
											<li>Learn @ safety of home</li>
										</ul>  
									</div>  
								</div>

								<div class="thum_sec">
									<div class="thum_inner">
										<figure><img src="images/car4.png"></figure>
										<h3>Anytime anywhere learning</h3>
										<ul>
											<li>Web and Mobile Platform</li>
											<li>your own topic/time/pace</li>
										</ul>  
									</div>  
								</div>
						</div><!--thumb_con-->
					</div><!---- / container----> 
				</div> <!-- / . learning_bk -->
				<div class="container">
					<article id="our_team">
						<h2 class="title">What makes us better</h2>   
						<div class="team_sec">
							<p>Superior Teachers</p>
							<ul class="a03_sub">
								<li>Personalized Learning</li>
								<li>Regular Tests and Assignments</li>
								<li>Doubts Busting and Thorough Revision</li>
							</ul>
						</div>
						<div class="team_sec">
							<p>Learn Anytime Anyware</p>
							<ul class="a03_sub">
								<li>Personalized Learning</li>
								<li>Regular Tests and Assignments</li>
								<li>Doubts Busting and Thorough Revision</li>
							</ul>
						</div>
						<div class="team_sec">
							<p>Friendly Staff</p>
							<ul class="a03_sub">
								<li>Personalized Learning</li>
								<li>Regular Tests and Assignments</li>
								<li>Doubts Busting and Thorough Revision</li>
							</ul>
						</div>
					</article>
				</div><!---- / container----> 
				<div class="container">
					<section id="student_speak">
						<div class="testimonials">
							<h3>Customers Speak</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sodales erat tempor lorem lobortis varius. Proin ultrices interdum felis, et molestie ante ultrices. 
								<span>- Gagan Varma</span>
							</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sodales erat tempor lorem lobortis varius. Proin ultrices interdum felis, et molestie ante ultrices. 
								<span>- Gagan Varma</span>
							</p>
						</div>
					</section>
				</div><!----container----> 
				<div class="clearfix"></div>
			</div> <!--background_container-->  
		</div> <!-- /. wrapper-->
		<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
