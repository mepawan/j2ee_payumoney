<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="page_title" scope="request" value="Courses"/>
<c:set var="page_name" scope="request" value="courses"/>
<jsp:include page="includes/head.jsp"/>
</head>
<body>
		<sql:setDataSource var="uitsql" 
		   driver="${initParam['driverClass']}"
		   url="${initParam['connectionURL']}" 
		   user="${initParam['username']}"
		   password="${initParam['password']}" />
		
		<sql:query dataSource="${uitsql}" var="courses">SELECT * FROM courses WHERE id=${param["id"]};</sql:query>

		<jsp:include page="includes/header.jsp"/>
		<div class="wrapper">
			<div class="background_container">
				<div class="container">
					<section id="left_sec">
			            <h2 class="title">Recent Online Courses</h2>
			            <div class="course_det">
			            	<c:forEach var="course" items="${courses.rows}">
						           <h3><c:out value="${course.title}"/></h3>
						            <div class="left_div">
						            	<figur><img src="images/courses/<c:out value="${course.image}"/>" width="377" height="160"></figur>
						            </div>
						            <div class="right_div">
							            <c:out value="${course.description}"/>
						            </div>
							
									<div class="join_form">
										<h4>Choose Your Plan</h4>
										<div class="member_form2">
											<form id="buy_plan_frm" action="payment.jsp">
												<input type="hidden" name="course_id" value="${course.id}"; />
												<div class="forms_grp">
													<div class="form_fill"><input id="pack_onetime" name="plan" type="radio" value="onetime"></div>
													<label for="pack_onetime" class="form_label">One Time - $500 </label>
													<div class="clear"></div>
												</div>
												<div class="forms_grp">
													<div class="form_fill"><input id="pack_monthly" name="plan" type="radio" value="monthly"></div>
													<label for="pack_monthly" class="form_label">Monthly - $70</label>
													<div class="clear"></div>
												</div>
												<div class="forms_grp">
													<div class="form_fill"><input id="pack_weekly" name="plan" type="radio" value="weekly"></div>
													<label for="pack_weekly" class="form_label">weekly - $11 </label>
													<div class="clear"></div>
												</div>
												<div class="forms_grp">
													<div class="form_label"></div>
													<div class="push_btn">
														<input type="submit" value="Pay Now" class="btn_login">
													</div>
													<div class="clear"></div>
												</div>
											</form>
										</div>
									</div>
									<div class="clear"></div>
							</c:forEach>
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
		<script type="text/javascript">
			jQuery(document).ready(function(){
				jQuery("#buy_plan_frm").submit(function(e){
						
						var plans = jQuery('input[name="plan"]:checked', jQuery(this));
						console.log(plans);
						if(plans.length <= 0){
							e.preventDefault();
							return false;
						}
				});
			});
		</script>
	
</body>
</html>
