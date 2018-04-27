<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page session="false" %>
<html>
<head>
	<title>Staff Page</title>
	<link href="<c:url value="/resources/css/adminlte.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">	
	
</head>
<body class="hold-transition sidebar-mini">
<t:menu>
<h1>
	Add a Staff
</h1>

<c:url var="addAction" value="/staff/add" ></c:url>

<form:form action="${addAction}" commandName="staff">
<table>
	<c:if test="${!empty staff.firstName}">
	<tr>
		<td>
			<form:label path="id">
				<spring:message text="ID"/>
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"  disabled="true" />
			<form:hidden path="id" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="firstName">
				<spring:message text="First Name"/>
			</form:label>
		</td>
		<td>
			<form:input path="firstName" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="lastName">
				<spring:message text="Last Name"/>
			</form:label>
		</td>
		<td>
			<form:input path="lastName" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="dateOfBirth">
				<spring:message text="Date of Birth"/>
			</form:label>
		</td>
		<td>
			<form:input path="dateOfBirth" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="picture">
				<spring:message text="Picture"/>
			</form:label>
		</td>
		<td>
			<form:input path="picture" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="biography">
				<spring:message text="Biography"/>
			</form:label>
		</td>
		<td>
			<form:input path="biography" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="position">
				<spring:message text="Position"/>
			</form:label>
		</td>
		<td>
			<form:input path="position.id" />
		</td> 
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty staff.firstName}">
				<input type="submit"
					value="<spring:message text="Edit Staff"/>" />
			</c:if>
			<c:if test="${empty staff.firstName}">
				<input type="submit"
					value="<spring:message text="Add Staff"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>Staffs List</h3>
<c:if test="${!empty listStaff}">
	<table class="tg">
	<tr>
		<th width="80">Staff ID</th>
		<th width="120">Staff Name</th>
		<th width="120">Staff Country</th>
		<th width="120">Staff Date of Birth</th>
		<th width="120">Staff Picture</th>
		<th width="120">Staff Biography</th>
		<th width="120">Staff Position</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listStaff}" var="staff">
		<tr>
			<td>${staff.id}</td>
			<td>${staff.firstName}</td>
			<td>${staff.lastName}</td>
			<td>${staff.dateOfBirth}</td>
			<td>${staff.picture}</td>
			<td>${staff.biography}</td>
			<td>${staff.position}</td>
			<td><a href="<c:url value='/staff/edit/${staff.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/staff/remove/${staff.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</t:menu>
</body>
</html>
