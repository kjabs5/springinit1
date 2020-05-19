<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Category</title>
</head>
<body>


		   <jsp:directive.include file="/views/admin/header1.jsp"/>
        <div align="center">
        
            <h2>Edit Category</h2>  
           
         </div>
         
         <div align="center">
            <form:form  action="editCategory" modelAttribute="category" method="POST">
   <form:hidden path="id"/>
   
      <table>
        <tbody>
        
        <tr>
          <td><label>Name</label></td>
          <td><form:input path="name"/></td>        
        </tr>
        
         
        
        <tr> <td><input type="submit" value="Save"/></td>
        </tr>
        </tbody>
      
      </table>
   </form:form>
         </div>
		
		<hr width="60%"/>
		 <jsp:directive.include file="/views/admin/footer1.jsp"/>
		
</body>
</html>