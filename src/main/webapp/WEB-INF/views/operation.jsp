<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page session="false" %>
<t:menu>
<div class="container">
		<section class="content-header">
			<h1>
				Add a Procedure
			</h1>
		</section>
<c:url var="addAction" value="/operation/add" ></c:url>
<div class="card-body">
<form:form action="${addAction}" commandName="operation">
<div class="card">
<form:hidden path="id" />
<table class="table table-border table-hover mb-0">	
	<tr>
		<td>
			<form:label path="operation">
				<spring:message text="Operation"/>
			</form:label>
		</td>
		<td>
			<form:input class="form-control" path="operation" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="price">
				<spring:message text="Price"/>
			</form:label>
		</td>
		<td>
			<form:input type="number" min="0" class="form-control" path="price" />
		</td> 
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty operation.operation}">
				<input type="submit" class="btn btn-primary"
					value="<spring:message text="Edit Operation"/>" />
			</c:if>
			<c:if test="${empty operation.operation}">
				<input type="submit" class="btn btn-primary"
					value="<spring:message text="Add Operation"/>" />
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
			<h3>Procedures List</h3>
		</section>
		<div class="card p-5">
			<table class="table table-bordered table-hover mb-0">
			<thead>
	<tr>
		<th>Procedure</th>
		<th>Price</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<c:forEach items="${listOperations}" var="operation">
		<tr>
			<td>${operation.operation}</td>
			<td>${operation.price}</td>
			<td><a class="btn btn-primary" href="<c:url value='/operation/edit/${operation.id}' />" >Edit</a></td>
			<td><a class="btn btn-primary" href="<c:url value='/operation/remove/${operation.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</div>
</div>
</div>
</t:menu>