<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

<t:menu>
<div class="container">
		<section class="content-header">
			<h1>
				Add a staff
			</h1>
		</section>

<c:url var="addAction" value="/staff/add" ></c:url>
<div class="card-body">
<form:form action="${addAction}" commandName="staff">
<div class="card">
<form:hidden path="id" />
<table class="table table-border table-hover mb-0">
	<c:if test="${!empty staff.firstName}">
	
	</c:if>
	<tr>
		<td>
			<form:label path="firstName">
				<spring:message text="First Name"/>
			</form:label>
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
			<form:label path="biography">
				<spring:message text="Biography"/>
			</form:label>
		</td>
		<td>
			<form:input class="form-control" path="biography" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="position">
				<spring:message text="Position"/>
			</form:label>
		</td>
		<td>
			<form:select class="form-control" path="position.id">
				<c:forEach items="${listPositions}" var="position">
			    <form:option value="${position.id}">${position.position}</form:option>
			    </c:forEach>
		    </form:select>
		</td> 
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty staff.firstName}">
				<input type="submit"  class="btn btn-primary"
					value="<spring:message text="Edit Staff"/>" />
			</c:if>
			<c:if test="${empty staff.firstName}">
				<input type="submit" class="btn btn-primary"
					value="<spring:message text="Add Staff"/>" />
			</c:if>
		</td>
	</tr>
</table>
</div>	
</form:form>
</div>
<br>
<div class="container">
		<section class="content-header">
			<h3>Staff List</h3>
		</section>
		<div class="card p-5">
			<table class="table table-bordered table-hover mb-0">
				<thead>
				<tr>
					<th>First Name</th>
					<th>Name</th>
					<th>Date of Birth</th>
					<th>Biography</th>
					<th>Position</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				<c:forEach items="${listStaff}" var="staff">
					<tr>
						<td>${staff.firstName}</td>
						<td>${staff.lastName}</td>
						<td><fmt:formatDate pattern="dd.MM.yyyy" value="${staff.dateOfBirth}"/></td>
						<td>${staff.biography}</td>
						<td>${staff.position.position}</td>
						<td><a href="<c:url value='/staff/edit/${staff.id}' />" >Edit</a></td>
						<td><a href="<c:url value='/staff/remove/${staff.id}' />" >Delete</a></td>
					</tr>
		</c:forEach>
		</table>
	</div>	
</div>
</div>
</t:menu>
