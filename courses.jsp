<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE HTML>
<html>
<c:set var="page_title" scope="request" value="Courses"/>
<c:set var="page_name" scope="request" value="courses"/>
<head>
<jsp:include page="includes/head.jsp"/>
</head>
<body>

		<sql:setDataSource var="uitsql" 
		   driver="${initParam['driverClass']}"
		   url="${initParam['connectionURL']}" 
		   user="${initParam['username']}"
		   password="${initParam['password']}" />
		   
		<sql:query dataSource="${uitsql}" var="courses">
			SELECT * FROM courses;
		</sql:query>
		
		
		<jsp:include page="includes/header.jsp"/>
		<div class="wrapper">
			<div class="background_container">
				<div class="container">
					<section id="left_sec">
						<h2 class="title">Recent Online Courses</h2>
						<div class="row">
							<c:forEach var="row" items="${courses.rows}">
								<div class="col-md-6 col-sm-6">
									<div class="course_sec">
										<h3><c:out value="${row.title}"/></h3>
										<figur><img src="images/courses/<c:out value="${row.image}"/>" width="377" height="160"></figur>
										<a href="course.jsp?id=<c:out value="${row.id}"/>">More Details</a>
									</div>
								</div>
							</c:forEach>
						</div> <!-- / .row -->
			 
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
