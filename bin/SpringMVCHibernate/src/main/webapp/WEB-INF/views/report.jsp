<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page session="false" %>
<html>
<head>
	<title>Report Page</title>
	<link href="<c:url value="/resources/css/adminlte.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">	
	
</head>
<body class="hold-transition sidebar-mini">
<t:menu>
<h1>
	Add a Report
</h1>

<c:url var="addAction" value="/report/add" ></c:url>

<form:form action="${addAction}" commandName="report">
<table>
	<c:if test="${!empty report.description}">
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
			<form:label path="description">
				<spring:message text="Description"/>
			</form:label>
		</td>
		<td>
			<form:input path="description" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="appointment">
				<spring:message text="Appointment"/>
			</form:label>
		</td>
		<td>
			<form:input path="appointment.id" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty report.description}">
				<input type="submit"
					value="<spring:message text="Edit Report"/>" />
			</c:if>
			<c:if test="${empty report.description}">
				<input type="submit"
					value="<spring:message text="Add Report"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>Reports List</h3>
<c:if test="${!empty listReports}">
	<table class="tg">
	<tr>
		<th width="80">Report ID</th>
		<th width="120">Report Description</th>
		<th width="120">Report Appointment</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listReports}" var="report">
		<tr>
			<td>${report.id}</td>
			<td>${report.description}</td>
			<td>${report.appointment}</td>
			<td><a href="<c:url value='/editreport/${report.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/removereport/${report.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</t:menu>
</body>
</html>
