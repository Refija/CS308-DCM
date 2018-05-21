<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page session="false" %>
<t:user>
<div class="container">
		<section class="content-header">
			<h1>
				Add an Appointment
			</h1>
		</section>
			

<c:url var="addAction" value="/user/appointment/add" ></c:url>

<form:form action="${addAction}" commandName="appointment">
<div class="card">
<table class="table table-border table-hover mb-0">
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
			    <form:option value="${operation.id}">${operation.operation} (${operation.price}KM)</form:option>
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
</t:user>
