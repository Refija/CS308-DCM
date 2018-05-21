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
				Add a Report
			</h1>
		</section>

<c:url var="addAction" value="/report/add" ></c:url>
<div class="card-body">
<form:form action="${addAction}" commandName="report">
<div class="card">
<form:hidden path="id" />
<table class="table table-border table-hover mb-0">
	<tr>
		<td>
		<div class="form-group">
			<form:label path="description">
				<spring:message text="Description" />
			</form:label>
			</div>
		</td>
		<td>
			<form:input class="form-control" path="description" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="appointment">
				<spring:message text="Appointment"/>
			</form:label>
		</td>
		<td>
			<form:select class="form-control" path="appointment.id">
				<c:forEach items="${listAppointments}" var="appointment">
			    <form:option value="${appointment.id}">${appointment.user.firstName} ${appointment.user.lastName}, <fmt:formatDate pattern="dd.MM.yyyy" value="${appointment.date}"/></form:option>
			    </c:forEach>
		    </form:select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty report.description}">
				<input class="bth btn-primary" type="submit"
					value="<spring:message text="Edit Report"/>" />
			</c:if>
			<c:if test="${empty report.description}">
				<input class="btn btn-primary" type="submit"
					value="<spring:message text="Add Report"/>" />
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
			<h3>Reports List</h3>
		</section>
		<div class="card p-5">
			<table class="table table-bordered table-hover mb-0">
			<thead>
			<tr>
				<th>Description</th>
				<th>Appointment Date</th>
				<th>Doctor</th>
				<th>Patient</th>
				<th>Operation</th>
			</tr>
			<c:forEach items="${listReports}" var="report">
				<tr>
					<td>${report.description}</td>
					<td><fmt:formatDate pattern="dd.MM.yyyy" value="${report.appointment.date}"/></td>
					<td>${report.appointment.staff.firstName} ${report.appointment.staff.lastName}</td>
					<td>${report.appointment.user.firstName} ${report.appointment.user.lastName}</td>
					<td>${report.appointment.operation.operation}</td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</div>
</div>	
</t:menu>