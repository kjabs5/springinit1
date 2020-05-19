<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Students List</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />


</head>
<body>

<div id="wrapper">
  <div id="header">
    Company Spring Employees
  </div>

</div>

<div id="container">
 <form:form action="search" method="GET">
                Search Employee: 
                <input type="text" name="theSearchName" />
                
                <input type="submit" value="Search" class="add-button" />
 </form:form>
<input type="button" value="Add Employee" 
       onclick="window.location.href='showFormForAdd'; return false;" class="add-button"/>
 <div id="content">
 <table>
 
    <tr>
     <th> First Name </th>
     <th> Last Name </th>
     <th> Email </th>
  
   </tr>
   
   <c:forEach var="tempEmployee" items="${employeesList}">
   
   <!-- Need to Create a variable for putting update link in action for update -->
   <c:url var="updateLink" value="showFormForUpdate">
   
    <c:param name="EmployeeId"  value="${tempEmployee.id}" />
   
   </c:url>
   
    <!-- Need to Create a variable for putting delete link in action for update -->
     <c:url var="deleteLink" value="delete">
   
    <c:param name="EmployeeId"  value="${tempEmployee.id}" />
   
   </c:url>
     <tr>
     
       <td> ${tempEmployee.firstName}</td>
         <td>${tempEmployee.lastName}</td>
           <td> ${tempEmployee.email}</td>
            
             
             <td>
            <a href= "${updateLink}" >Update</a>
            ||
            <a href="${deleteLink}"
            onClick="if(!(confirm('Are you sure you want to delete this Employee?'))) return false">Delete</a>
             </td>
       
     </tr>
   </c:forEach> 
 
 </table>
 
 
 
 </div>

</div>

</body>
</html>