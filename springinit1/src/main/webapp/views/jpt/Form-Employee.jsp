<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Saving New Employee</title>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>
<body>
<div id="container">
   <div>
   <h3> Spring Employee Form </h3>
   </div>
   <form:form  action="saveEmployee" modelAttribute="employees" method="POST">
   <form:hidden path="id"/>
   
      <table>
        <tbody>
        
        <tr>
          <td><label>First Name</label></td>
          <td><form:input path="firstName"/></td>        
        </tr>
        
         <tr>
          <td><label>Last Name</label></td>
          <td><form:input path="lastName"/></td>        
        </tr>
        
         <tr>
          <td><label>Email</label></td>
          <td><form:input path="email"/></td>        
        </tr>
        
        
        <tr> <td><input type="submit" value="Save"/></td>
        </tr>
        </tbody>
      
      </table>
   </form:form>
   
   <div style="clear;both;">
 
 </div>
 
 <p>
 <a href="${pageContext.request.contextPath }/kishor/employees">Back to List</a> 
</p>
   
</div>

</body>
</html>