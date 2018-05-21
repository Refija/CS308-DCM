<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page session="false" %>
<t:menu>
<div class="container">
		<section class="content-header">
			<h1>
				Add a Position
			</h1>
		</section>

<c:url var="addAction" value="/position/add" ></c:url>
<div class="card-body">
<form:form action="${addAction}" commandName="position" >
<div class="card">
<form:hidden path="id" />
<table class="table table-border table-hover mb-0">
	<tr>
		<td>
		<div class="form-group">
			<form:label path="position">
				<spring:message text="Position" />
			</form:label>
			</div>
		</td>
		<td>
			<form:input class="form-control" path="position" />
		</td> 
	</tr>
</table>
</div>	
</form:form>
</div>
<br>
<div class="container">
		<section class="content-header">
			<h1>Positions List</h1>
		</section>
		<div class="card p-5">
			<table class="table table-bordered table-hover mb-0">
			<thead>
		<tr>
			<th>ID</th>
			<th>Position</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		</thead>
	<c:forEach items="${listPositions}" var="position">
		<tr>
			<td>${position.id}</td>
			<td>${position.position}</td>
			<td><a href="<c:url value='/position/edit/${position.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/position/remove/${position.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
	</div>
	</div>
</div>	
</t:menu>
</body>
</html>
