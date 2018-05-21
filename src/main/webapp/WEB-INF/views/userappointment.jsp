<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<t:menu>
	<div class="container">
		<section class="content-header">
			<h1>Your appointments</h1>
		</section>
		<div class="card p-5">
			<c:if test="${!empty listAppointments}">
				<table class="table table-bordered table-hover mb-0">
				<thead>
					<tr>
						<th>Procedure</th>
						<th>Staff</th>
						<th>Date</th>
						<th>Time</th>
						<th>Price</th>
					</tr>
				</thead>
				<c:forEach items="${listAppointments}" var="appointment">
					<tr>
						<td>${appointment.operation.operation}</td>
						<td>${appointment.staff.firstName} ${appointment.staff.lastName}</td>
						<td><fmt:formatDate pattern="dd.MM.yyyy" value="${appointment.date}" /></td>
						<td>${appointment.time}</td>
						<td>${appointment.operation.price}KM</td>
					</tr>
				</c:forEach>
				</table>
			</c:if>
			<div class="row mt-3">
				<div class="col">
					<c:if test="${history}">
						<a class="btn btn-primary" href="<c:url value="/user/appointments"/>">View upcoming appointments</a>
					</c:if>
					<c:if test="${!history}">
						<a class="btn btn-primary" href="<c:url value="/user/appointments?history=true"/>">View appointments history</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</t:menu>