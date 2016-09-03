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
<body onload="document.forms.payuForm.submit();">
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
			            <h2 class="title">Payment Confirmation</h2>
			            <div class="join_form">
							<c:choose>
								<c:when test="${pageContext.request.method=='POST'}">
										<%!
											public boolean empty(String s){
												if(s== null || s.trim().equals(""))
													return true;
												else
													return false;
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

											Enumeration paramNames = request.getParameterNames();
											Map<String,String> params= new HashMap<String,String>();
											while(paramNames.hasMoreElements()) {
													String paramName = (String)paramNames.nextElement();
													String paramValue = request.getParameter(paramName);
													params.put(paramName,paramValue);
											}
											String txnid ="";
											if(empty(params.get("txnid"))){
												Random rand = new Random();
												String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
												txnid=hashCal("SHA-256",rndm).substring(0,20);
											} else {
												txnid=params.get("txnid");
											}
											String udf2 = txnid;
											String txn="abcd";
											String hash="";
											String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
											if(empty(params.get("hash")) && params.size()>0){
												if( empty(params.get("key"))
													|| empty(params.get("txnid"))
													|| empty(params.get("amount"))
													|| empty(params.get("firstname"))
													|| empty(params.get("email"))
													|| empty(params.get("phone"))
													|| empty(params.get("productinfo"))
													|| empty(params.get("surl"))
													|| empty(params.get("furl"))
													|| empty(params.get("service_provider"))
											)
													
													error=1;
												else{
													String[] hashVarSeq=hashSequence.split("\\|");
													
													for(String part : hashVarSeq)
													{
														hashString= (empty(params.get(part)))?hashString.concat(""):hashString.concat(params.get(part));
														hashString=hashString.concat("|");
													}
													hashString=hashString.concat(salt);
													

													 hash=hashCal("SHA-512",hashString);
													action1=base_url.concat("/_payment");
												}
											}
											else if(!empty(params.get("hash"))){
												hash=params.get("hash");
												action1=base_url.concat("/_payment");
											}
										%>
										<form action="<%= action1 %>" method="post" name="payuForm" style="display:none;">
											<input type="hidden" name="amount" value="<%= (empty(params.get("amount"))) ? "" : params.get("amount") %>" />
											<input type="hidden" name="key" value="<%= merchant_key %>" />
											<input type="hidden" name="hash" value="<%= hash %>"/>
											<input type="hidden" name="txnid" value="<%= txnid %>" />
											<input type="hidden" name="udf2" value="<%= txnid %>" />
											<input type="hidden" name="service_provider" value="payu_paisa" />
											
											<input name="firstname" id="firstname" value="<%= (empty(params.get("firstname"))) ? "" : params.get("firstname") %>" />
											<input name="email" id="email" value="<%= (empty(params.get("email"))) ? "" : params.get("email") %>" />
											<input name="phone" value="<%= (empty(params.get("phone"))) ? "" : params.get("phone") %>" />
											<input name="productinfo" value="<%= (empty(params.get("productinfo"))) ? "" : params.get("productinfo") %>" size="64" />
											<input name="surl" value="<%= (empty(params.get("surl"))) ? "" : params.get("surl") %>" size="64" />
											<input name="furl" value="<%= (empty(params.get("furl"))) ? "" : params.get("furl") %>" size="64" />
											<input name="udf1" value="<%= (empty(params.get("udf1"))) ? "" : params.get("udf1") %>" />
											<input name="udf3" value="<%= (empty(params.get("udf3"))) ? "" : params.get("udf3") %>" />
											<input name="udf4" value="<%= (empty(params.get("udf4"))) ? "" : params.get("udf4") %>" />
										</form>
										<p>Please wait....</p>
								</c:when>
								<c:otherwise>
									<c:redirect url="index.jsp"/>
								</c:otherwise>
							</c:choose>
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
