<%@tag description="User Page template" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:simpletemplate>
    <jsp:attribute name="header">
    	
    	<nav class=" navbar navbar-expand bg-dark navbar-dark border-bottom">
    		<ul class="navbar-nav">
		      	<li class="nav-item d-none d-sm-inline-block">
		        	<a href='/DCM/' class="nav-link">Home</a>
		      	</li>
		      	<li class="nav-item d-none d-sm-inline-block">
		        	<a href='/DCM/users' class="nav-link">Users</a>
		      	</li>
		      	<li class="nav-item d-none d-sm-inline-block">
		        	<a href='/DCM/positions' class="nav-link">Positions</a>
		      	</li>
		      	<li class="nav-item d-none d-sm-inline-block">
		        	<a href='/DCM/staff' class="nav-link">Staff</a>
		      	</li>
		      	<li class="nav-item d-none d-sm-inline-block">
		        	<a href='/DCM/operations' class="nav-link">Operations</a>
		      	</li>
		      	<li class="nav-item d-none d-sm-inline-block">
		        	<a href='/DCM/appointments' class="nav-link">Appointments</a>
		      	</li>
		      	<li class="nav-item d-none d-sm-inline-block">
		        	<a href='/DCM/reports' class="nav-link">Reports</a>
		      	</li>
      		</ul>
      	</nav>
   							
	
    </jsp:attribute>
    <jsp:attribute name="footer">
    <footer class="footer">
      <div class="container">
        <span class="text-muted">&copy; Copyright 2018, Dental Clinic Management</span>
      </div>
    </footer>
    </jsp:attribute>
    <jsp:body>
        <jsp:doBody/>
    </jsp:body>
</t:simpletemplate>