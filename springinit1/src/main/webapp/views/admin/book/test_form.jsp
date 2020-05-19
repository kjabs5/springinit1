<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New User</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/jquery-ui.min.css">

<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>

<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
</head>
<body>


		   <jsp:directive.include file="/views/admin/header1.jsp"/>
        <div class="center">
        
            <h2>Create New Book</h2>  
           
         </div>
         
         <div class="center">
            <form:form  action="saveTest" modelAttribute="testbook" method="POST" enctype="multipart/form-data" >
   		<form:hidden path="id"/>
   
      	<table class="form">
        <tbody>
        
       
        
         <tr> 
          <td><label>Name</label></td>
          <td><form:input path="name" /></td>        
        </tr>
        
<!--         <tr>  -->
<!--           <td><label>file_name</label></td> -->
<%--           <td><form:input path="file_name" /></td>         --%>
<!--         </tr> -->
<!--         <tr>  -->
<!--           <td><label>file_path</label></td> -->
<%--           <td><form:input path="file_path" /></td>         --%>
<!--         </tr> -->
<!--          <tr>  -->
<!--           <td><label>fileSize</label></td> -->
<%--           <td><form:input path="file_size" /></td>         --%>
<!--         </tr> -->
<!--          <tr>  -->
<!--           <td><label>fileType</label></td> -->
<%--           <td><form:input path="file_type" /></td>         --%>
<!--         </tr> -->
   
        
         <tr>
          <td><label>Image</label></td>
          <td><form:input type="file" path="" name="image" id="image" size="20"/><br/>
          
          <img id="thumbnail" alt="imgPreview" style="width:20%; margin-top:10px;"/>
          </td>        
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
		
		
		
		
	});

	   function showImageThumbnail(fileInput){
		    var file=fileInput.files[0];
		    
		    var reader= new FileReader();
		    reader.onload=function(e)
		    {
		    	$('#thumbnail').attr('src',e.target.result);
		    };
		    reader.readAsDataURL(file);
	   }
	




</script>
</html>