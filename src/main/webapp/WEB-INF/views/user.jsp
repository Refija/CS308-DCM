<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@page session="true"%>

<t:menu>

<div class="container">
	<section class="content-header">
		<h1>
			Add a User		
		</h1>
	</section>
	
<c:url var="addAction" value="/user/add" ></c:url>
<div class="card-body">
<form:form action="${addAction}" commandName="user" >
<div class="card">
<form:hidden path="id" />
<table class="table table-border table-hover mb-0">
	<tr>
		<td>
		<div class="form-group">
			<form:label path="firstName">
				<spring:message text="First Name" />
			</form:label>
			</div>
		</td>
		<td>
			<form:input class="form-control" path="firstName" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="lastName">
				<spring:message text="Last Name"/>
			</form:label>
		</td>
		<td>
			<form:input class="form-control" path="lastName" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="email">
				<spring:message text="Email"/>
			</form:label>
		</td>
		<td>
			<form:input type="email" class="form-control" path="email" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="dateOfBirth">
				<spring:message text="Date of Birth"/>
			</form:label>
		</td>
		<td>
			<form:input type="date" class="form-control" path="dateOfBirth" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="address">
				<spring:message text="Address"/>
			</form:label>
		</td>
		<td>
			<form:input class="form-control" path="address" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="username">
				<spring:message text="Username"/>
			</form:label>
		</td>
		<td>
			<form:input class="form-control" path="username" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="password">
				<spring:message text="Password"/>
			</form:label>
		</td>
		<td>
			<form:input type="password" class="form-control" path="password" />
		</td> 
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty user.firstName}">
				<input type="submit"  class="btn btn-primary"
					value="<spring:message text="Edit User"/>" />
			</c:if>
			<c:if test="${empty user.firstName}">
				<input type="submit" class="btn btn-primary"
					value="<spring:message text="Add User"/>" />
			</c:if>
		</td>
	</tr>
</table>
</div>	
</form:form>
</div>
<br><div class="container">
		<section class="content-header">
			<h3>User List</h3>
		</section>
		<div class="card p-5">
			<table class="table table-bordered table-hover mb-0">
				<thead>
	<tr>
		<th>User Name</th>
		<th>User Country</th>
		<th>User Email</th>
		<th>User Date of Birth</th>
		<th>User Address</th>
		<th>User Username</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	</thead>
	<c:forEach items="${listUsers}" var="user">
		<tr>
			<td>${user.firstName}</td>
			<td>${user.lastName}</td>
			<td>${user.email}</td>
			<td><fmt:formatDate pattern="dd.MM.yyyy" value="${user.dateOfBirth}"/></td>
			<td>${user.address}</td>
			<td>${user.username}</td>
			<td><a class="btn btn-primary" href="<c:url value='/user/edit/${user.id}' />" >Edit</a></td>
			<td><a class="btn btn-primary" href="<c:url value='/user/remove/${user.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
	</div>
	</div>
	</div>
	</t:menu>

