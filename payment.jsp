<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="java.security.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		
		<sql:query dataSource="${uitsql}" var="courses">SELECT * FROM courses WHERE id=${param["course_id"]};</sql:query>

		<jsp:include page="includes/header.jsp"/>
		<div class="wrapper">
			<div class="background_container">
				<div class="container">
					<section id="left_sec">
			            <h2 class="title">Payment Confirmation</h2>
			            <div class="join_form">
							<table>
								<tbody>
			            	<c:forEach var="course" items="${courses.rows}">
									<c:set var="course_id" value="${course.id}" />
									<c:set var="course_title" value="${course.title}" />
						            <tr>
										<th width="100px">Course: </th>
										<td><c:out value="${course.title}"/></td>
									</tr>
							</c:forEach>
									<tr>
									<c:choose>
										<c:when test="${param['plan'] == 'onetime'}" >
											<c:set var="amount" value="500" />
											<th>Plan: </th><td>One Time ($500)</td>
										</c:when>
										<c:when test="${param['plan'] == 'monthly'}" >
											<c:set var="amount" value="70" />
											<th>Plan: </th><td>Monthly ($70)</td>
										</c:when>
										<c:when test="${param['plan'] == 'weekly'}" >
											<c:set var="amount" value="11" />
											<th>Plan: </th><td>Weekly ($11)</td>
										</c:when>
									</c:choose>
									</tr>
								</tbody>
							</table>
							<c:choose>
								<c:when test="${empty sessionScope['loggedInUser']}">
										<c:set scope="session" var="redirectUrl" value="payment.jsp?course_id=${param['course_id']}&plan=${param['plan']}"/>
										<br /><br />
										<h4><strong>Please login to process payment</strong></h4>
										<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
											<li class="active"><a href="#tab-login" data-toggle="tab">Login</a></li>
											<li><a href="#tab-register" data-toggle="tab">Register</a></li>
										</ul>
										<div class="tab-content">
											<div id="tab-login" class="tab-pane fade in active ">
														<div class="member_form3">
															<form id="login-frm" method="post" action="login.jsp">
																	<h4>Login Details</h4>
																	<div class="forms_grp">
																		<div class="form_label">Email/Username : <span class="red_color">*</span></div>
																		<div class="form_fill"><input required type="text" name="login" id="login"  class="fill_text_login"/></div>
																	</div>
																	<div class="forms_grp">
																		<div class="form_label">Password : <span class="red_color">*</span></div>
																		<div class="form_fill"><input required type="password" name="password"  id="password"  class="fill_text_login"/></div>
																	</div>
																	<a class="sm_link" href="forget_password.jsp">Forgot Password?</a>
																	<div class="forms_grp">
																		<div class="form_label"></div>
																		<div class="push_btn">
																			<input  type="submit" class="btn_login" value="Login"/>
																		</div>
																	</div>
																	
															</form>
														</div><!-- /.member_form3 -->  
											</div>
											<div id="tab-register" class="tab-pane fade">
														<div class="member_form3">
															<form id="reg-frm" method="post" action="register.jsp">
																	<h4>Sign Up Form</h4>
																	<div class="forms_grp">
																		<div class="form_label">Full Name : <span class="red_color">*</span></div>
																		<div class="form_fill"><input required type="text" name="name"  id="textfield"  class="fill_text_login" value="<c:if test="${pageContext.request.method=='POST'}"> <c:out value="${param.name}"/> </c:if>" /></div>
																	</div>
																	<div class="forms_grp">
																		<div class="form_label">User Name : <span class="red_color">*</span></div>
																		<div class="form_fill"><input required type="text" name="username"  id="textfield"  class="fill_text_login" value="<c:if test="${pageContext.request.method=='POST'}"> <c:out value="${param.username}"/> </c:if>"  /></div>
																	</div>
																	<div class="forms_grp">
																		<div class="form_label">Email Address : <span class="red_color">*</span></div>
																		<div class="form_fill"><input required type="text" name="email"  id="textfield"  class="fill_text_login" value="<c:if test="${pageContext.request.method=='POST'}"> <c:out value="${param.email}"/> </c:if>" /></div>
																	</div>
									
																	<div class="forms_grp">
																		<div class="form_label">Password : <span class="red_color">*</span></div>
																		<div class="form_fill"><input required type="password" name="password" id="textfield"  class="fill_text_login"/></div>
																	</div>
									
									
																	<div class="forms_grp">
																		<div class="form_label">Re-Password : <span class="red_color">*</span></div>
																		<div class="form_fill"><input required type="password" name="confirm_password"  id="textfield"  class="fill_text_login"/></div>
																	</div>
																	<div class="forms_grp">
																		<div class="form_label"></div>
																		<div class="push_btn">
																			<input  type="submit" class="btn_login" name="reg" value="Register Now!"/>
																		</div>
																	</div>
															</form>
														</div>
											</div>
										</div>
								</c:when>
								<c:otherwise>
									<%!
										public boolean empty(String s){
												if(s== null || s.trim().equals(""))
													return true;
												else
													return false;
										}
										public static String getURLWithContextPath(HttpServletRequest request) {
												String url = request.getRequestURL().toString();
												String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
												return baseURL;
										}
										%>
										<%!
											public String hashCal(String type,String str){
												byte[] hashseq=str.getBytes();
												StringBuffer hexString = new StringBuffer();
												try{
													MessageDigest algorithm = MessageDigest.getInstance(type);
													algorithm.reset();
													algorithm.update(hashseq);
													byte messageDigest[] = algorithm.digest();
													for (int i=0;i<messageDigest.length;i++) {
														String hex=Integer.toHexString(0xFF & messageDigest[i]);
														if(hex.length()==1) hexString.append("0");
														hexString.append(hex);
													}
												}catch(NoSuchAlgorithmException nsae){ }
												return hexString.toString();
											}
										%>
										<% 	
											String base_url = "";
											String merchant_key = "";
											String salt = "";
											String payuMoneyMode = application.getInitParameter("payuMoneyMode");
											if( payuMoneyMode == "live"){
												base_url = application.getInitParameter("payuMoneyLiveUrl");
												merchant_key = application.getInitParameter("payuMoneyLiveKey");
												salt = application.getInitParameter("payuMoneyLiveSalt");
											} else {
												base_url = application.getInitParameter("payuMoneyTestUrl");
												merchant_key = application.getInitParameter("payuMoneyTestKey");
												salt = application.getInitParameter("payuMoneyTestSalt");
											}
											
											String action1 ="";
											int error=0;
											String hashString="";
											String txnid ="";
											
											Random rand = new Random();
											String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
											txnid = hashCal("SHA-256",rndm).substring(0,20);
											
											String udf2 = txnid;
											String hash="";
											StringBuffer response_url = request.getRequestURL();// + "/payment_resp.jsp";
												

								%>
								
									<form action="payment_process.jsp" method="post" name="payuForm">
										<input type="hidden" name="amount" value="${amount}" />
										<input type="hidden" name="key" value="<%= merchant_key %>" />
										<input type="hidden" name="hash" value="<%= hash %>"/>
										<input type="hidden" name="txnid" value="<%= txnid %>" />
										<input type="hidden" name="udf2" value="<%= txnid %>" />
										<input type="hidden" name="service_provider" value="payu_paisa" />
										
										<input type="hidden" name="course_id" value="${course_id}" />
										<input type="hidden" name="plan" value="${param['plan']}" />
										
										<input type="hidden" name="firstname" value="${sessionScope['loggedInUser'].name}" />
										<input type="hidden" name="email" value="${sessionScope['loggedInUser'].email}" />
										<input type="hidden" name="phone" value="9039842785" />
										<input type="hidden" name="productinfo" value="${course_title}" />
										<input type="hidden" name="surl" value="<%= getURLWithContextPath(request) %>payment_resp.jsp" />
										<input type="hidden" name="furl" value="<%= getURLWithContextPath(request) %>payment_resp.jsp" />
										<input type="hidden" name="udf1" value="${course_id}" />
										<input type="hidden" name="udf3" value="${param['plan']}" />
										<input type="hidden" name="udf4" value="${sessionScope['loggedInUser'].id}" />
										<br /><br />
										<input  type="submit" class="btn_login" value="Confirm Pay"/>
										
										
									</form>
								</c:otherwise>
							</c:choose>
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
			jQuery(document).ready(function ($) {
				$('#tabs').tab();
				console.log('tabs initiated');
				$("#buy_plan_frm").submit(function(e){
						
						var plans = $('input[name="plan"]:checked', $(this));
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
