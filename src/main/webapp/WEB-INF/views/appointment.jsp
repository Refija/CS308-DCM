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
				Add an appointment
			</h1>
		</section>

<c:url var="addAction" value="/appointment/add" ></c:url>
<div class="card-body">
<form:form action="${addAction}" commandName="appointment">
<div class="card">
<form:hidden path="id" />
<table class="table table-border table-hover mb-0">
	<tr>
		<td>
			<form:label path="date">
				<spring:message text="Date"/>
			</form:label>
		</td>
		<td>
			<form:input type="date" class="form-control" path="date" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="time">
				<spring:message text="Time"/>
			</form:label>
		</td>
		<td>
			<form:input class="form-control" path="time" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="user">
				<spring:message text="User"/>
			</form:label>
		</td>
		<td>
			<form:select class="form-control" path="user.id">
				<c:forEach items="${listUsers}" var="user">
			    <form:option value="${user.id}">${user.firstName} ${user.lastName}</form:option>
			    </c:forEach>
		    </form:select>
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="staff">
				<spring:message text="Staff"/>
			</form:label>
		</td>
		<td>
			<form:select class="form-control" path="staff.id">
				<c:forEach items="${listStaff}" var="staff">
			    <form:option value="${staff.id}">${staff.firstName} ${staff.lastName}</form:option>
			    </c:forEach>
		    </form:select>
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="operation">
				<spring:message text="Operation"/>
			</form:label>
		</td>
		<td>
			<form:select class="form-control" path="operation.id">
				<c:forEach items="${listOperations}" var="operation">
			    <form:option value="${operation.id}">${operation.operation}</form:option>
			    </c:forEach>
		    </form:select>
		</td> 
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty appointment.date}">
				<input type="submit" class="btn btn-primary"
					value="<spring:message text="Edit Appointment"/>" />
			</c:if>
			<c:if test="${empty appointment.date}">
				<input type="submit" class="btn btn-primary"
					value="<spring:message text="Add Appointment"/>" />
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
			<h3>Appointments List</h3>
		</section>
		<div class="card p-5">
			<table class="table table-bordered table-hover mb-0">
			<thead>
	<tr>
		<th>Date</th>
		<th>Time</th>
		<th>Patient</th>
		<th>Doctor</th>
		<th>Operation</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	</thead>
	<c:forEach items="${listAppointments}" var="appointment">
		<tr>
			<td><fmt:formatDate pattern="dd.MM.yyyy" value="${appointment.date}"/></td>
			<td>${appointment.time}</td>
			<td>${appointment.user.firstName} ${appointment.user.lastName}</td>
			<td>${appointment.staff.firstName} ${appointment.staff.lastName}</td>
			<td>${appointment.operation.operation}</td>
			<td><a href="<c:url value='/appointment/edit/${appointment.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/appointment/remove/${appointment.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
	</div>
</div>
</div>
</t:menu>
