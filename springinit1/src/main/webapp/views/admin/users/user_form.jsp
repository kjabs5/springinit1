<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New User</title>
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>


		   <jsp:directive.include file="/views/admin/header1.jsp"/>
        <div align="center">
        
            <h2>Create New User</h2>  
           
         </div>
         
         <div align="center">
            <form:form  action="addUser" modelAttribute="users" method="POST" id="UserForm">
   		<form:hidden path="userId"/>
   
      	<table class="form">
        <tbody>
        
        <tr>
          <td><label>Email</label></td>
          <td><form:input path="email" id="email"/></td>        
        </tr>
        
         <tr>
          <td><label>Password</label></td>
          <td><form:input path="password" id="password"/></td>        
        </tr>
        
         <tr>
          <td><label>Full Name</label></td>
          <td><form:input path="fullName" id="fullname"/></td>        
        </tr>
        
            <tr><td></td><td> <button type="submit">Save</button> <button type="submit">Cancel</button></td>
          
        </tr>

        </tbody>
        
            
      
      </table>
    
   </form:form>
         </div>
		
		<hr width="60%"/>
		 <jsp:directive.include file="/views/admin/footer1.jsp"/>
		
</body>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#UserForm").validate({
			rules:{
				email:{required:true,
					   email:true},
				fullName:"required",
				password:"required"
				
			},
			messages:{
				email:{
					required:"Please enter email",
					email:"Please enter a valid email address"
				},
				fullName:"Please enter fullName",
				password:"Please enter password"
			}
		});
		
	});






</script>
</html>