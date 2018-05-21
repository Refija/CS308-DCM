<%@tag description="User Page template" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:simpletemplate>
    <jsp:attribute name="header">
    	
    	<nav class=" navbar navbar-expand bg-dark navbar-dark border-bottom">
    		<a href="/DCM/home" class="brand-link">
      			<img src="${pageContext.request.contextPath}/resources/img/logoHome.jpg"
           		alt="Dental Clinic Logo"
           		class="brand-image img-circle elevation-3"
           		style="opacity: .8">
      			<span class="brand-text font-weight-light">Dental Clinic</span>
    		</a>
    		<ul class="navbar-nav">
		      	<li class="nav-item d-none d-sm-inline-block">
		        	<a href='/DCM/home' class="nav-link">Home</a>
		      	</li>
		      	
      		</ul>
      		<ul class="navbar-nav ml-auto">
      
				<li class="nav-item d-none d-sm-inline-block">
					<a href='/DCM/user/appointments?history=true' class="nav-link">View appointment history</a>
				</li>
	      		<li class="nav-item d-none d-sm-inline-block">
					<a href="/DCM/user/appointment/create" class="nav-link">Make an appointment</a>
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