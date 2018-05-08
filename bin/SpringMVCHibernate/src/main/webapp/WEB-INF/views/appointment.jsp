<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page session="false" %>
<html>
<head>
	<title>Appointment Page</title>
	<link href="<c:url value="/resources/css/adminlte.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">	
	
</head>
<body class="hold-transition sidebar-mini">
<t:menu>
<h1>
	Add a Appointment
</h1>

<c:url var="addAction" value="/appointment/add" ></c:url>

<form:form action="${addAction}" commandName="appointment">
<table>
	<c:if test="${!empty appointment.date}">
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
			<form:label path="date">
				<spring:message text="Date"/>
			</form:label>
		</td>
		<td>
			<form:input path="date" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="time">
				<spring:message text="Time"/>
			</form:label>
		</td>
		<td>
			<form:input path="time" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="user">
				<spring:message text="User"/>
			</form:label>
		</td>
		<td>
			<form:input path="user.id" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="staff">
				<spring:message text="Staff"/>
			</form:label>
		</td>
		<td>
			<form:input path="staff.id" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="operation">
				<spring:message text="Operation"/>
			</form:label>
		</td>
		<td>
			<form:input path="operation.id" />
		</td> 
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty appointment.date}">
				<input type="submit"
					value="<spring:message text="Edit Appointment"/>" />
			</c:if>
			<c:if test="${empty appointment.date}">
				<input type="submit"
					value="<spring:message text="Add Appointment"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>Appointments List</h3>
<c:if test="${!empty listAppointments}">
	<table class="tg">
	<tr>
		<th width="80">Appointment ID</th>
		<th width="120">Appointment Date</th>
		<th width="120">Appointment Time</th>
		<th width="120">Appointment User</th>
		<th width="120">Appointment Staff</th>
		<th width="120">Appointment Operation</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listAppointments}" var="appointment">
		<tr>
			<td>${appointment.id}</td>
			<td>${appointment.date}</td>
			<td>${appointment.time}</td>
			<td>${appointment.user}</td>
			<td>${appointment.staff}</td>
			<td>${appointment.operation}</td>
			<td><a href="<c:url value='/appointment/edit/${appointment.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/appointment/remove/${appointment.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</t:menu>
</body>
</html>
