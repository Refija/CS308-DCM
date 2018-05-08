<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home Page</title>
	<link href="<c:url value="/resources/css/adminlte.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">	
	
</head>
<body class="hold-transition sidebar-mini">
<nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
    		<ul class="navbar-nav">
      		<li class="nav-item">
        		<a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
      	</li>
      	<li class="nav-item d-none d-sm-inline-block">
        <a href='/SpringMVCHibernate/login' class="nav-link">Login</a>
      	</li>
      	<li class="nav-item d-none d-sm-inline-block">
        <a href='/SpringMVCHibernate/users' class="nav-link">Users</a>
      	</li>
      	<li class="nav-item d-none d-sm-inline-block">
        <a href='/SpringMVCHibernate/positions' class="nav-link">Positions</a>
      	</li>
      	<li class="nav-item d-none d-sm-inline-block">
        <a href='/SpringMVCHibernate/staff' class="nav-link">Staff</a>
      	</li>
      	<li class="nav-item d-none d-sm-inline-block">
        <a href='/SpringMVCHibernate/operations' class="nav-link">Operations</a>
      	</li>
      	<li class="nav-item d-none d-sm-inline-block">
        <a href='/SpringMVCHibernate/appointments' class="nav-link">Appointments</a>
      	</li>
      	<li class="nav-item d-none d-sm-inline-block">
        <a href='/SpringMVCHibernate/reports' class="nav-link">Reports</a>
      	</li>
      	</ul>
      	</nav>
<h1>
	Wellcome
</h1>
</body>
</html>
