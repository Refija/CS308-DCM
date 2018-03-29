<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

		<h1>Edit Employee</h1>
       <form:form method="POST" action="/CS308-DCM-project/editsave">  
      	<table >  
      	<tr>
      	<td>ID :</td>  
         <td><form:hidden  path="id" /></td>
         </tr>
         <td>First Name : </td> 
          <td><form:input path="firstName"  /></td>
         </tr>  
         <tr>  
          <td>Last Name :</td>  
          <td><form:input path="lastName" /></td>
         </tr> 
         <tr>  
          <td>Email :</td>  
          <td><form:input path="email" /></td>
         </tr>
         <tr>  
          <td>Date of Birth :</td>  
          <td><form:input path="dateOfBirth" /></td>
         </tr> 
         <tr>  
          <td>Address :</td>  
          <td><form:input path="address" /></td>
         </tr>
         <tr>  
          <td>Username :</td>  
          <td><form:input path="username" /></td>
         </tr> 
         <tr>  
          <td>Password :</td>  
          <td><form:input path="password" /></td>
         </tr>  
         <tr>  
          <td> </td>  
          <td><input type="submit" value="Edit Save" /></td>  
         </tr>  
        </table>  
       </form:form>  
