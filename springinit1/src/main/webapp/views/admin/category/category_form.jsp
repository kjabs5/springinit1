<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Category</title>
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>


		   <jsp:directive.include file="/views/admin/header1.jsp"/>
        <div align="center">
        
            <h2>Create New Category</h2>  
           
         </div>
         
         <div align="center">
            <form:form  action="addCategory" id="CategoryForm" modelAttribute="category" method="POST">
            <form:hidden path="id"/>
   
      <table class="form">
        <tbody>
        
        <tr>
          <td><label>Name</label></td>
          <td><form:input id="name" path="name"/></td>        
        </tr>
        
         
        
        <tr> <td><button type="submit" >Save</button></td>
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
		
		$("#CategoryForm").validate({
			rules:{
				name:"required",
				
				
			},
			messages:{
				name:"Please enter name"
				
			}
		});
		
	});

</script>
</html>