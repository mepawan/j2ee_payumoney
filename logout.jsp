<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="page_title" scope="request" value="Logout"/>
<c:set var="page_name" scope="request" value="logout"/>
<jsp:include page="includes/head.jsp"/>
</head>
<body>
		<c:remove var="loggedInUser" scope="session" />
			
		<jsp:include page="includes/header.jsp"/>
		<div class="wrapper">
			<div class="background_container">
				<div class="container">
					<div class="join_form_background">
						<div class="join_form">
							<div class="member_form3">
								<strong>You have logged out</strong>
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
