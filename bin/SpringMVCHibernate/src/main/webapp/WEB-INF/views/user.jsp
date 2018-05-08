<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page session="false" %>
<html>
<head>
	<title>User Page</title>
	<link href="<c:url value="/resources/css/adminlte.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">	
	
</head>
<body class="hold-transition sidebar-mini">
<t:menu>

<h1>
	Add a User
</h1>

<c:url var="addAction" value="/user/add" ></c:url>

			<form role="form">
				<div class="card-body">
                  <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" name="firstName" class="form-control" id="firstName" placeholder="Enter first name">
                  </div>
                  <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" name="lastName" class="form-control" id="lastName" placeholder="Enter email">
                  </div>
                  <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" class="form-control" id="email" placeholder="Enter email">
                  </div>
                  <div class="form-group">
                    <label for="dateOfBirth">Date of birth</label>
                    <input type="date" name="dateOfBirth" class="form-control" id="dateOfBirth" placeholder="Enter date of birth">
                  </div>
                  <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" name="address" class="form-control" id="address" placeholder="Enter address">
                  </div>
                  <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="username" class="form-control" id="username" placeholder="Enter username">
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="Enter password">
                  </div>
				<div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
                </div>
                </form>
                
                      
	
<br>
<h3>Users List</h3>
<c:if test="${!empty listUsers}">
	<table class="tg">
	<tr>
		<th width="80">User ID</th>
		<th width="120">User Name</th>
		<th width="120">User Country</th>
		<th width="120">User Email</th>
		<th width="120">User Date of Birth</th>
		<th width="120">User Address</th>
		<th width="120">User Username</th>
		<th width="120">User Password</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listUsers}" var="user">
		<tr>
			<td>${user.id}</td>
			<td>${user.firstName}</td>
			<td>${user.lastName}</td>
			<td>${user.email}</td>
			<td>${user.dateOfBirth}</td>
			<td>${user.address}</td>
			<td>${user.username}</td>
			<td>${user.password}</td>
			<td><a href="<c:url value='/user/edit/${user.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/user/remove/${user.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
	</c:if>

	</t:menu>
</body>
</html>
