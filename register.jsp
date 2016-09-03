<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="page_title" scope="request" value="Register"/>
<c:set var="page_name" scope="request" value="register"/>
<jsp:include page="includes/head.jsp"/>
</head>
<body>
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
								<sql:query dataSource="${uitsql}" var="username_rec">SELECT count(*) as cnt FROM users WHERE username='${param.username}';</sql:query>
								<sql:query dataSource="${uitsql}" var="email_rec">SELECT count(*) as cnt FROM users WHERE email='${param.email}';</sql:query>
							
								<c:choose>
									<c:when test="${username_rec.rowsByIndex[0][0] > 0}">
										<div style="font-weight:bold; color:red;" >Username already exists</div>
									</c:when>
									<c:when test="${email_rec.rowsByIndex[0][0] > 0}">
										<div style="font-weight:bold; color:red;" >Email already exists</div>
									</c:when>
								   <c:when test="${param.name==''}">
								   		<div style="font-weight:bold; color:red;" >Please fill name</div>
								   </c:when>
								   <c:when test="${param.username==''}">
								   		<div style="font-weight:bold;color: red;" >Please fill username</div>
								   </c:when>
								   <c:when test="${param.email==''}">
								   		<div style="font-weight:bold; color:red;" >Please fill email</div>
								   </c:when>
								   <c:when test="${param.password==''}">
								   		<div style="font-weight:bold; color:red;" >Please fill password</div>
								   </c:when>
								   <c:when test="${param.password!=param.confirm_password}">
								   		<div style="font-weight:bold; color:red;" >Password & confirm password doesn't match</div>
								   </c:when>
								   <c:otherwise>
								   		<c:catch var="exception">
											<sql:update dataSource="${uitsql}" var="updatedTable">
												INSERT INTO users (name, username, email, password) VALUES (?,?,?,?)
												<sql:param value="${param.name}" />
												<sql:param value="${param.username}" />
												<sql:param value="${param.email}" />
												<sql:param value="${param.password}" />
											</sql:update>
											<c:if test="${updatedTable>=1}">
												<span style="font-weight:bold; color:green;" >Congratulations ! You have registered successfully.</span>
												<c:if test="${not empty sessionScope['redirectUrl']}" >
													<c:set var="redirectUrl" value="${fn:replace(sessionScope['redirectUrl'],'&amp;','&')}" />
													<c:remove var="redirectUrl" scope="session" />
													<span style="font-weight:bold;" >Redirecting to your previous page</span>
													<script>
														window.location='<c:out value="${fn:replace(redirectUrl,\"&amp;\",\"&\")}" />';
													</script>
												</c:if>
											</c:if>
										</c:catch>
										<c:if test="${exception!=null}">
											<span style="font-weight:bold; color:red;" >Unable to save data.</span>
										</c:if>
								   </c:otherwise>
								</c:choose>
							</c:if>
						
						
						
							<h2 class="title">Create a New Account</h2>
							<div class="member_form3">
								<form id="reg-frm" method="post">
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
								<p>Already a member?<a class="sm_link" href="login.jsp">Sign in here</a></p>
							</div>
							<div class="clear"></div>
						</div><!-- /.join_form -->
					</div> <!-- / . join_form_background -->
				</div>  <!----container----> 
				<div class="clearfix"></div>
			</div> <!--background_container-->  
		</div> <!-- /. wrapper-->
		<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
