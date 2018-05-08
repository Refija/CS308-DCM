<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page session="false" %>
<html>
<head>
	<title>Operation Page</title>
	<link href="<c:url value="/resources/css/adminlte.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">	
	
</head>
<body class="hold-transition sidebar-mini">
<t:menu>
<h1>
	Add a Operation
</h1>

<c:url var="addAction" value="/operation/add" ></c:url>

<form:form action="${addAction}" commandName="operation">
<table>
	<c:if test="${!empty operation.operation}">
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
			<form:label path="operation">
				<spring:message text="Operation"/>
			</form:label>
		</td>
		<td>
			<form:input path="operation" />
		</td> 
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty operation.operation}">
				<input type="submit"
					value="<spring:message text="Edit Operation"/>" />
			</c:if>
			<c:if test="${empty operation.operation}">
				<input type="submit"
					value="<spring:message text="Add Operation"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>Operations List</h3>
<c:if test="${!empty listOperations}">
	<table class="tg">
	<tr>
		<th width="80">Operation ID</th>
		<th width="120">Operation Operation</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listOperations}" var="operation">
		<tr>
			<td>${operation.id}</td>
			<td>${operation.operation}</td>
			<td><a href="<c:url value='/operation/edit/${operation.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/operation/remove/${operation.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</t:menu>
</body>
</html>
