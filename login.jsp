<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="page_title" scope="request" value="Login"/>
<c:set var="page_name" scope="request" value="login"/>
<jsp:include page="includes/head.jsp"/>
</head>
<body>
		<c:if test="${not empty sessionScope['loggedInUser']}">
			<c:redirect url="index.jsp"/>
		</c:if>
		<sql:setDataSource var="uitsql" 
		   driver="${initParam['driverClass']}"
		   url="${initParam['connectionURL']}" 
		   user="${initParam['username']}"
		   password="${initParam['password']}" />
			
		<jsp:include page="includes/header.jsp"/>
		<div class="wrapper">
			<div class="background_container">
				<div class="container">
					<div class="join_form_background">
						<div class="join_form">
						
							<c:if test="${pageContext.request.method=='POST'}">
								<c:choose>
								   <c:when test="${param.login==''}">
								   		<div style="font-weight:bold; color:red;" >Please fill email or username</div>
								   </c:when>
								   <c:when test="${param.password==''}">
								   		<div style="font-weight:bold;color: red;" >Please fill password</div>
								   </c:when>				   
								   <c:otherwise>
								   		<c:catch var="exception">
											<sql:query dataSource="${uitsql}" var="user_rec">SELECT * FROM users WHERE username='${param.login}'  AND password='${param.password}' ;</sql:query>
											<c:choose>
												<c:when test="${fn:length(user_rec.rows) > 0}">
													<c:forEach var="u" items="${user_rec.rows}">
														<c:set scope="session" var="loggedInUser" value="${u}"/>
													</c:forEach>
													<c:choose>
														<c:when test="${not empty sessionScope['redirectUrl']}" >
															<c:set var="redirectUrl" value="${fn:replace(sessionScope['redirectUrl'],'&amp;','&')}" />
															<c:remove var="redirectUrl" scope="session" />
															<c:redirect url="${fn:replace(redirectUrl,'&amp;','&')}"/>
														</c:when>
														<c:otherwise>
															<c:redirect url="index.jsp"/>
														</c:otherwise>
													</c:choose>
													
												</c:when>
												<c:otherwise>
													<span style="font-weight:bold; color:red;" >Email/username & password does not match</span>
												</c:otherwise>
											</c:choose>
										</c:catch>
										<c:if test="${exception!=null}">
											<span style="font-weight:bold; color:red;" >Unable to process request. <br /> ERROR: ${exception}</span>
										</c:if>
								   </c:otherwise>
								</c:choose>
							</c:if>
						
						
						
						
							<h2 class="title">Login</h2>
							<div class="member_form3">
								<form id="login-frm" method="post">
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
										<h4>OR Connect with your Social Media Account</h4>
										<div class="foot-socials">
											<ul>
												<li><a target="_blank" class="facebook"><img src="images/face_icc.png"></a></li>
												<li><a target="_blank" class="twitter"><img src="images/twitter_icc.png"></a></li>
												<li><a target="_blank" class="linkedin"><img src="images/linkin_icc.png"></a></li>
											</ul>
										</div>
										<h4>Don,t have an Account?</h4>
										<div class="forms_grp">
											<div class="form_label"></div>
											<div class="push_btn">
												<input  type="submit" class="btn_login" value="Register Now!"/>
											</div>
										</div>
								</form>
							</div><!-- /.member_form3 --> 
						</div><!-- /.join_form -->
					</div> <!-- / . join_form_background -->
				</div>  <!----container----> 
				<div class="clearfix"></div>
			</div> <!--background_container-->  
		</div> <!-- /. wrapper-->
		<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
