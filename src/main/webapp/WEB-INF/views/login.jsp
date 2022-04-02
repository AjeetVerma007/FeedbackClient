<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
	<head>
    	<!-- Required meta tags -->
    	<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet"> 
    	<!-- Bootstrap CSS -->
    	<link rel="stylesheet" href="resources/vendor/bootstrap/css/bootstrap.min.css">
    	<!-- Font Awesome -->
        <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    	<!-- Bootstrap Validator CSS -->
    	<link rel="stylesheet" href="resources/vendor/bootstrapValidator/css/bootstrapValidator.min.css">
    	<!-- Custom CSS -->
    	<link rel="stylesheet" href="resources/css/login.min.css">
    	<!-- Favicon -->
		<link rel="icon" href="resources/images/lichfl-favicon.png">
    	<title>LICHFL - Feedback Portal</title>
  	</head>
  	<body>
  		<header>     
        	<a class="navbar-image" href="#"><img src="resources/images/lichfl-logo.png"/></a>     
    	</header>
    	<div class="login login-lichfl">
        	<!-- begin login-image -->
            <div class="login-image">
            	<div class="news-image" style="background-image: url('resources/images/question-mark-1872665.jpg')"></div>
                <div class="news-caption">
                	<h4 class="caption-title"><b>Got Queries? </b>Login to Feedback Portal</h4>
                	<p>
                		The new feedback portal provides you a simple interface to raise and track your queries.
	                	<a href="http://10.0.0.196/upload/IT/writeups/Feedback_Portal.pdf" class="writeuplink" target="_blank">
		                	<i class="fa fa-info-circle fa-fw"></i>
		                	Click here
	                	</a>
	                	for the detailed write-up of the revamped feedback portal.
	                </p>
                </div>
            </div>
            <!-- end login-image -->
            <!-- begin right-content -->
            <div class="right-content">
                <!-- begin login-header -->
                <div class="login-header">
                    <div class="brand text-center">
                    	<b>Feedback Portal</b>
                        <small>Report and get your queries resolved.</small>
                    </div>
                </div>
                <!-- end login-header -->
                <!-- begin login-content -->
                <div class="login-content">
                	<form:form modelAttribute="dummy" id="loginForm" action="validate" method="post" cssClass="margin-bottom-0">
                        <div class="form-group m-b-15">
                            <input type="text" class="form-control form-control-lg" placeholder="SR Number" name="username">
                        </div>
                        <div class="form-group m-b-15">
                            <input type="password" class="form-control form-control-lg" placeholder="Password" name="password">
                        </div>
                        <div class="login-buttons">
                            <button type="submit" class="btn btn-success btn-block btn-lg">Login</button>
                        </div>
                        <div class="m-t-20 m-b-40 p-b-40 text-inverse d-none">
                            Account Locked? Click <a href="">here</a> unlock.
                        </div>
                        <c:if test="${error ne null }">
                        	<div class="notification"><i class="fa fa-exclamation-triangle fa-fw"></i>
                        		<span class="msg">${error}</span>
                        	</div>
                        </c:if>
                        <hr>
                        <p class="text-center text-grey-darker">
                            &#169; <a href="http://www.lichousing.com/" target="_blank">LIC Housing Finance Ltd.</a> All Right Reserved 2018
                        </p>
                	</form:form>
                	<div class="write-up row">
                		<div class="col-sm-12">
                			<i class="fa fa-exclamation-triangle fa-fw text-warning"></i>
						    <a href="http://10.0.0.196/upload/IT/writeups/Feedback_Portal.pdf" target="_blank">
						    	Click here
						    </a> for detailed write-up of revamped feedback portal.
						</div>
					</div>
					<div class="domain-password text-muted text-center pt-5" style="font-size: 11px;position: absolute;bottom: 15px;right: 8%;">
						<i class="fa fa-file-pdf-o text-danger" style="font-size: 15px;"></i>
						<a class="pr-2" href="http://10.0.0.196/upload/IT/writeups/Change_Domain_Password.pdf" 
							title="Steps to change Domain password." target="_blank"> 
							Change Domain Password
						</a>
						<i class="fa fa-file-pdf-o text-danger" style="font-size: 15px;"></i>
						<a class="" href="http://10.0.0.196/upload/IT/writeups/MSOutlook_Configuration.pdf" 
							title="Steps to configure MS Outlook application." target="_blank">
							Outlook Configuration
						</a>
					</div>
                </div>
                <!-- end login-content -->
            </div>
            <!-- end right-container -->           
        </div>
    	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    	<script src="resources/vendor/bootstrap/js/jquery-3.3.1.slim.min.js"></script>
    	<script src="resources/vendor/bootstrap/js/popper.min.js"></script>
    	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>    
    	<!-- Bootstrap Validator JavaScript -->
		<script src="resources/vendor/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	    
	    <script type="text/javascript">
	    	$('#loginForm').bootstrapValidator({
	    		fields: {
	    			username: {
	                    validators: {
	                        numeric: {
	                            message: 'Please enter numerical value',
	                        },
	                        notEmpty:{
	                        	message: 'Please enter a value'
	                        }
	    					
	                    }
	                },
	                password:{
	                	validators: {	                       
	                        notEmpty:{
	                        	message: 'Please enter a value'
	                        }
	    					
	                    }
	                }
	            },
	    	});
	    </script>
	    
  	</body>
</html>