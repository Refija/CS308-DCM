<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page session="false" %>
<html>
<head>
	<title>Position Page</title>
	<link href="<c:url value="/resources/css/adminlte.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">	
	
</head>
<body>
<t:menu>
<h1>
	Add a Position
</h1>

<c:url var="addAction" value="/position/add" ></c:url>

<form role="form" method="POST" action="${addAction}" >
				<div class="card-body">
                  <div class="form-group">
                    <label for="position">Position</label>
                    <input type="text" name="position" class="form-control" id="position" placeholder="Enter position">
                  </div>
                  <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
                  </div>
                  </form>
                  <br>
<h3>Positions List</h3>
<c:if test="${!empty listPositions}">
	<table class="tg">
	<tr>
		<th width="80">Position ID</th>
		<th width="120">Position Position</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listPositions}" var="position">
		<tr>
			<td>${position.id}</td>
			<td>${position.position}</td>
			<td><a href="<c:url value='/position/edit/${position.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/position/remove/${position.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</t:menu>
</body>
</html>
