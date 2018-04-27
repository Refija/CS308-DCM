<%@tag description="User Page template" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<link href="/resources/css/adminlte.css" rel="stylesheet">	


<t:simpletemplate>
    <jsp:attribute name="header">
    	
    	<nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
    		<ul class="navbar-nav">
      		<li class="nav-item">
        		<a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
      	</li>
      	<li class="nav-item d-none d-sm-inline-block">
        <a href='/SpringMVCHibernate/' class="nav-link">Home</a>
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
   							
	
    </jsp:attribute>
    <jsp:attribute name="footer">
      <p id="copyright">Copyright 2018, Dental Clinic Management</p>
    </jsp:attribute>
    <jsp:body>
        <jsp:doBody/>
    </jsp:body>
</t:simpletemplate>