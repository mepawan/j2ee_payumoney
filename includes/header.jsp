<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <header id="header" class="background_header">
      <div class="hd_top_bk">
			<div class="container">
                  <div class="call_section">
                     <img src="images/ph_icon.png">&nbsp;+91-9191919191 &nbsp; &nbsp; Email: <a href="mailto:info@online@education.gmail.com" class="invo_btn">online@education.gmail.com</a>
                  </div>
                  <nav  class="fot_nave">
                     <ul>
						<c:choose>
							 <c:when test="${empty sessionScope['loggedInUser']}">
								<li><a href="login.jsp">Login</a></li>
								<li>|</li>
								<li><a href="register.jsp">Register</a></li>
							</c:when>
							<c:otherwise>
								<li><c:out value="${sessionScope['loggedInUser'].name}" /></li>
								<li>|</li>
								<li><a href="logout.jsp">Logout</a></li>
							</c:otherwise>
						</c:choose>
                     </ul>
                  </nav>
			</div>
		</div>
		<div class="hd_bottom_bk">
			<div class="container">
				<div class="logo"><a href="index.jsp"><img src="images/logo.png"></a></div>       
			</div>
			<nav class="nav">
				<div class="container">
                     <label for="menu-toggle" class="togglebutton"><img src="images/mob_icon.png"><span>Menu</span></label>
                     <input type="checkbox" id="menu-toggle">
                     <ul id="nav">page_name
                        <li><a <c:if test="${page_name=='home'}"> class="selected" </c:if>  href="/home.jsp">Home</a></li>
                        <li><a <c:if test="${page_name=='aboutus'}"> class="selected" </c:if>  href="about-us.jsp">About us</a></li>
                        <li><a <c:if test="${page_name=='courses'}"> class="selected" </c:if>  href="courses.jsp">Courses</a></li>
                        <li><a <c:if test="${page_name=='faq'}"> class="selected" </c:if>  href="faq.jsp">FAQ</a></li>
                        <li><a <c:if test="${page_name=='career'}"> class="selected" </c:if>  href="career.jsp">Career</a></li>
                        <li><a <c:if test="${page_name=='contact'}"> class="selected" </c:if>  href="contact.jsp">Contact </a></li>
                     </ul>
				</div>
			</nav>
		</div> <!-- / .hd_bottom_bk -->
		<div class="banner">
			<div class="container">
				<div class="inq_form_bk join_form">
					<div class="member_form3">
						<h2 class="title">Register For Demo Class</h2>
						<div class="forms_grp">
							<div class="form_label">Name : <span class="red_color">*</span></div>
							<div class="form_fill"><input type="text" class="fill_text_login" id="textfield"></div>
						</div>
						<div class="forms_grp">
							<div class="form_label">Email<span class="red_color">*</span></div>
							<div class="form_fill"><input type="text" class="fill_text_login" id="textfield"></div>
						</div>
						<div class="forms_grp">
							<div class="form_label">Subject : <span class="red_color">*</span></div>
							<div class="form_fill"><input type="text" class="fill_text_login" id="textfield"></div>
						</div>
						<div class="forms_grp">
							<div class="form_label">Message : <span class="red_color">*</span></div>
							<div class="form_fill">
								<textarea class="fill_text_login" rows="" cols="" name=""></textarea>
							</div>
						</div>
						<div class="forms_grp">
							<div class="form_label"></div>
							<div class="push_btn">
								<input type="submit" value="Send" class="btn_login">
							</div>
						</div>
					</div> <!-- / .member_form3 -->
				</div> <!--  /.join_form -->
			</div> <!-- / .container -->
			<img src="images/bnr04.jpg" width="1920" height="566" /> 
		</div><!--banner-->
	
		<div class="featured">
			<div class="container">
				<div class="row">
					<div class="ftr_section">
						<div class="ftr_img"><img src="images/fc1.png"></div>
						<div class="ftr_con">
							<h3>PG Diploma   </h3>
							<p>Lorem ipsum dolor sit <br /> amet conse ctetur </p>
						</div>
					</div>
					<div class="ftr_section">
						<div class="ftr_img"><img src="images/fc2.png"></div>
						<div class="ftr_con">
							<h3>Online MBA</h3>
							<p>Lorem ipsum dolor sit <br /> amet conse ctetur  </p>
						</div>
					</div>
					<div class="ftr_section">
						<div class="ftr_img"><img src="images/fc3.png"></div>
						<div class="ftr_con">
							<h3>Across Campus</h3>
							<p>Lorem ipsum dolor sit<br> 
							   amet conse ctetur 
							</p>
						</div>
					</div>
				</div> <!-- / .row -->
			</div>
		</div> <!-- / .featured -->
   </header>
