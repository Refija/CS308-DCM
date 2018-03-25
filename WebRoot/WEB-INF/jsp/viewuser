    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

	<h1>User List</h1>
	<table border="2" width="70%" cellpadding="2">
	<tr><th>Id</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Date of Birth</th><th>Address</th><th>Username</th><th>Password</th><th>Edit</th><th>Delete</th></tr>
    <c:forEach var="user" items="${list}"> 
    <tr>
    <td>${user.id}</td>
    <td>${user.firstName}</td>
    <td>${user.email}</td>
    <td>${user.dateOfBirth}</td>
    <td>${user.address}</td>
    <td>${user.username}</td>
    <td>${user.password}</td>
    <td><a href="edituser/${user.id}">Edit</a></td>
    <td><a href="deleteuser/${user.id}">Delete</a></td>
    </tr>
    </c:forEach>
    </table>
    <br/>
    <a href="userform">Add New Employee</a>