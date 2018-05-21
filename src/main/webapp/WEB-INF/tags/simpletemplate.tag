<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<html>
	<head>
		<title>Appointment Page</title>
		<link href="<c:url value="/resources/css/adminlte.css" />" rel="stylesheet">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">	
		<style>
		/* Sticky footer styles
		-------------------------------------------------- */
		html {
		  position: relative;
		  min-height: 100%;
		}
		body {
		  margin-bottom: 60px; /* Margin bottom by footer height */
		  min-height: unset;
		}
		.footer {
		  position: absolute;
		  bottom: 0;
		  width: 100%;
		  height: 60px; /* Set the fixed height of the footer here */
		  line-height: 60px; /* Vertically center the text there */
		  background-color: #f5f5f5;
		}
		</style>
	</head>
  	<body class="hold-transition">
	    <div id="pageheader">
	      <jsp:invoke fragment="header"/>
	    </div>
	    <div id="body">
	      <jsp:doBody/>
	    </div>
	    <div id="pagefooter">
	      <jsp:invoke fragment="footer"/>
	    </div>
  	</body>
</html>