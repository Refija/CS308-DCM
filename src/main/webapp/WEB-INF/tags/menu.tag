<%@tag description="User Page template" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		      	
				<li class="nav-item d-none d-sm-inline-block">
				<c:url value="/logout" var="logoutUrl" />
				<form action="${logoutUrl}" method="post" id="logoutForm" style="display:none;">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
				<script>
					function formSubmit() {
						document.getElementById("logoutForm").submit();
					}
				</script>
					<a href="javascript:formSubmit()" class="nav-link">Logout</a>
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