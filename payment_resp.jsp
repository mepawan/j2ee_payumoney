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

		
		<jsp:include page="includes/header.jsp"/>
		<div class="wrapper">
			<div class="background_container">
				<div class="container">
					<section id="left_sec">
			            <h2 class="title">Payment Status</h2>
			            <div class="join_form">
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
								String key = "";
								String salt = "";
								String payuMoneyMode = application.getInitParameter("payuMoneyMode");
								if( payuMoneyMode == "live"){
									base_url = application.getInitParameter("payuMoneyLiveUrl");
									key = application.getInitParameter("payuMoneyLiveKey");
									salt = application.getInitParameter("payuMoneyLiveSalt");
								} else {
									base_url = application.getInitParameter("payuMoneyTestUrl");
									key = application.getInitParameter("payuMoneyTestKey");
									salt = application.getInitParameter("payuMoneyTestSalt");
								}
								
								String amount = request.getParameter("amount");
								String productinfo= request.getParameter("productinfo");
								String txnid = request.getParameter("txnid");
								String phone = request.getParameter("phone");
								String firstname = request.getParameter("firstname");
										
								String status = request.getParameter("status");
								String r_h =request.getParameter("hash");
								String hashString="";
								String udf1 =request.getParameter("udf1");
								String udf2 =request.getParameter("udf2");
								String udf3 =request.getParameter("udf3");
								String udf4 =request.getParameter("udf4");
								String udf5 =request.getParameter("udf5");
								String p_Id = request.getParameter("payuMoneyId");
								
								String additionalCharges = request.getParameter("additionalCharges");
								float totalPaid =  Float.valueOf(amount.trim()).floatValue() +  Float.valueOf(additionalCharges.trim()).floatValue();
								
								String uid = udf4;
								
								// SAVE order To DB
								String db_user = application.getInitParameter("username");
								String db_pass = application.getInitParameter("password");
								String db_driver = application.getInitParameter("driverClass");
								String db_con_url = application.getInitParameter("connectionURL");
								
								Connection connection = null;
								PreparedStatement pstatement = null;
								Class.forName(db_driver).newInstance();
								int updateQuery = 0;
								
								connection = DriverManager.getConnection(db_con_url,db_user,db_pass);
								String queryString = "INSERT INTO orders(uid,user_name, course_id,couse_name,subscription_plan,plan_price,additional_charges,total_paid,payment_id,transaction_id, transaction_status)  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
								//queryString =+ " VALUES ( '"+productinfo+"', '"+udf3+"', '"+amount+"', '"+additionalCharges+"', '"+totalPaid+"','"+p_Id+"','"+txnid+"','status')";
								pstatement = connection.prepareStatement(queryString);
								pstatement.setString(1, uid);
								pstatement.setString(2, firstname);
								pstatement.setString(3, udf1);
								pstatement.setString(4, productinfo);
								pstatement.setString(5, udf3);
								pstatement.setString(6, amount);
								pstatement.setString(7, additionalCharges);
								pstatement.setString(8, String.valueOf(totalPaid));
								pstatement.setString(9, p_Id);
								pstatement.setString(10, txnid);
								pstatement.setString(11, status);
								try{
									updateQuery = pstatement.executeUpdate();
								
								} catch (Exception e){
									//out.println("An exception occurred: " + e.getMessage());
								}
								
								out.println("<div class='forms_grp strong'>Payment ID  : " + p_Id + "</div>");
								 String hash;
								 String email = request.getParameter("email");
								 if(status.equals("success")){
									 if(additionalCharges!=null){
										 String hashSequence = additionalCharges+"|"+salt+"|"+status+"||||||"+udf5+"|"+udf4+"|"+udf3+"|"+udf2+"|"+udf1+"|"+email+"|"+firstname+"|"+productinfo+"|"+amount+"|"+txnid+"|";

										  hashString=hashSequence.concat(key);
										  //out.println(hashString);
										  hash=hashCal("SHA-512",hashString);
										  //out.println(hash);
										  if(r_h.equals(hash)){
											  out.println("<div class='forms_grp strong success'>Successfull with additional charges</div>");
											  out.println("<div class='member_form3 payment-status'>");
											  out.println("<h4>Transaction details</h4>");
											  out.println("<div class='forms_grp'><div class='form_label' />Amount:</div><div class='form_fill'>"+amount+"</div></div>");
											  out.println("<div class='forms_grp'><div class='form_label' />AdditionalCharges:</div><div class='form_fill'>"+additionalCharges+"</div></div>");
											  out.println("<div class='forms_grp'><div class='form_label' />Transaction status:</div><div class='form_fill'>"+status+"</div></div>");
											  out.println("<div class='forms_grp'><div class='form_label' />Transaction id:</div><div class='form_fill'>"+txnid+"</div></div>");
											  out.println("<div style='border-bottom:1px solid'>&nbsp;</div>");
											  out.println("<div class='forms_grp'><div class='form_label' />Course:</div><div class='form_fill'>"+productinfo+"</div></div>");
											  out.println("<div class='forms_grp'><div class='form_label' />Plan:</div><div class='form_fill'>"+udf3+"</div></div>");
											  out.println("</div>");
										  } else {
											  out.println("<div class='forms_grp strong red'>Failure</div>");
											  out.println("<div class='member_form3 payment-status'>");
											  out.println("<h4>Transaction details</h4>");
											  out.println("<div class='forms_grp'><div class='form_label' />Amount:</div><div class='form_fill'>"+amount+"</div></div>");
											  out.println("<div class='forms_grp'><div class='form_label' />AdditionalCharges:</div><div class='form_fill'>"+additionalCharges+"</div></div>");
											  out.println("<div class='forms_grp'><div class='form_label' />Transaction status:</div><div class='form_fill'>"+status+"</div></div>");
											  out.println("<div class='forms_grp'><div class='form_label' />Transaction id:</div><div class='form_fill'>"+txnid+"</div></div>");
											  out.println("<div style='border-bottom:1px solid'>&nbsp;</div>");
											  out.println("<div class='forms_grp'><div class='form_label' />Course:</div><div class='form_fill'>"+productinfo+"</div></div>");
											  out.println("<div class='forms_grp'><div class='form_label' />Plan:</div><div class='form_fill'>"+udf3+"</div></div>");
											  out.println("</div>");
										}
									} else {
											String hashSequence = salt+"|"+status+"||||||"+udf5+"|"+udf4+"|"+udf3+"|"+udf2+"|"+udf1+"|"+email+"|"+firstname+"|"+productinfo+"|"+amount+"|"+txnid+"|";
											hashString=hashSequence.concat(key);
											//out.println(hashString);
											hash=hashCal("SHA-512",hashString);
											//out.println(hash);
											if(r_h.equals(hash)){
												
												out.println("<div class='pay_resp strong success'>Successfull</div>");
												out.println("<div class='member_form3 payment-status'>");
												out.println("<h4>Transaction details</h4>");
												out.println("<div class='forms_grp'><div class='form_label' />Amount:</div><div class='form_fill'>"+amount+"</div></div>");
												out.println("<div class='forms_grp'><div class='form_label' />AdditionalCharges:</div><div class='form_fill'>"+additionalCharges+"</div></div>");
												out.println("<div class='forms_grp'><div class='form_label' />Transaction status:</div><div class='form_fill'>"+status+"</div></div>");
												out.println("<div class='forms_grp'><div class='form_label' />Transaction id:</div><div class='form_fill'>"+txnid+"</div></div>");
												out.println("<div style='border-bottom:1px solid'>&nbsp;</div>");
												out.println("<div class='forms_grp'><div class='form_label' />Course:</div><div class='form_fill'>"+productinfo+"</div></div>");
												out.println("<div class='forms_grp'><div class='form_label' />Plan:</div><div class='form_fill'>"+udf3+"</div></div>");
												out.println("</div>");
												
											} else{ 
												
												out.println("<div class='pay_resp strong red'>Failure</div>");
												out.println("<div class='member_form3 payment-status'>");
												out.println("<h4>Transaction details</h4>");
												out.println("<div class='forms_grp'><div class='form_label' />Amount:</div><div class='form_fill'>"+amount+"</div></div>");
												out.println("<div class='forms_grp'><div class='form_label' />AdditionalCharges:</div><div class='form_fill'>"+additionalCharges+"</div></div>");
												out.println("<div class='forms_grp'><div class='form_label' />Transaction status:</div><div class='form_fill'>"+status+"</div></div>");
												out.println("<div class='forms_grp'><div class='form_label' />Transaction id:</div><div class='form_fill'>"+txnid+"</div></div>");
												out.println("<div style='border-bottom:1px solid'>&nbsp;</div>");
												out.println("<div class='forms_grp'><div class='form_label' />Course:</div><div class='form_fill'>"+productinfo+"</div></div>");
												out.println("<div class='forms_grp'><div class='form_label' />Plan:</div><div class='form_fill'>"+udf3+"</div></div>");
												out.println("</div>");
												
											}
									}   
								} else {
										
										out.println("<div class='pay_resp strong red'>Failure</div>");
										out.println("<div class='member_form3 payment-status'>");
										out.println("<h4>Transaction details</h4>");
										out.println("<div class='forms_grp'><div class='form_label' />Amount:</div><div class='form_fill'>"+amount+"</div></div>");
										out.println("<div class='forms_grp'><div class='form_label' />AdditionalCharges:</div><div class='form_fill'>"+additionalCharges+"</div></div>");
										out.println("<div class='forms_grp'><div class='form_label' />Transaction status:</div><div class='form_fill'>"+status+"</div></div>");
										out.println("<div class='forms_grp'><div class='form_label' />Transaction id:</div><div class='form_fill'>"+txnid+"</div></div>");
										out.println("<div style='border-bottom:1px solid'>&nbsp;</div>");
										out.println("<div class='forms_grp'><div class='form_label' />Course:</div><div class='form_fill'>"+productinfo+"</div></div>");
										out.println("<div class='forms_grp'><div class='form_label' />Plan:</div><div class='form_fill'>"+udf3+"</div></div>");
										out.println("</div>");
										
									}
								%>
								
									
									
									
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

			});
		</script>
	
</body>
</html>
