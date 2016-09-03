<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<c:set var="page_title" scope="request" value="Contact Us"/>
<c:set var="page_name" scope="request" value="contact"/>
<jsp:include page="includes/head.jsp"/>
</head>
<body>
		<jsp:include page="includes/header.jsp"/>
		<div class="wrapper">
			<div class="background_container">
				<div class="container">
					<div class="join_form_background">
						<div class="join_form">
							<h2 class="title">Contact Us</h2>
							<div class="member_form3">
								<form method="post">
									<div class="forms_grp">
										<div class="form_label">Name : <span class="red_color">*</span></div>
										<div class="form_fill"><input type="text"  id="textfield"  class="fill_text_login"/></div>
									</div>
									<div class="forms_grp">
										<div class="form_label">Email<span class="red_color">*</span></div>
										<div class="form_fill"><input type="text"  id="textfield"  class="fill_text_login"/></div>
									</div>
									<div class="forms_grp">
										<div class="form_label">Subject : <span class="red_color">*</span></div>
										<div class="form_fill"><input type="text"  id="textfield"  class="fill_text_login"/></div>
									</div>
									<div class="forms_grp">
										<div class="form_label">Message : <span class="red_color">*</span></div>
										<div class="form_fill">
											<textarea name="" cols="" rows="" class="fill_text_login"></textarea>
										</div>
									</div>
									<div class="forms_grp">
										<div class="form_label"></div>
										<div class="push_btn">
											<input  type="submit" class="btn_login" value="Send"/>
										</div>
									</div>
								</form>
							</div>
						</div><!-- /.join_form -->
					</div> <!-- / . join_form_background -->
				</div>  <!----container----> 
				<div class="clearfix"></div>
			</div> <!--background_container-->  
		</div> <!-- /. wrapper-->
		<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
