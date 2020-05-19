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
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/richtext.min.css">


<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>

<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/jquery.richtext.min.js"></script>


</head>
<body>


		   <jsp:directive.include file="/views/admin/header1.jsp"/>
        <div align="center">
        
        
            <h2>
            
             <c:if test="${value==0}">
              Create New Book
            </c:if>
            
             <c:if test="${value==1}"> 
               Edit Book 
             </c:if> 
            
           
            
            </h2>  
           
         </div>
         
         <div align="center">
            <form:form  action="addBook" modelAttribute="book" method="POST" id="BookForm" enctype="multipart/form-data">
   		<form:hidden path="bookId"/>
   
      	<table class="book">
        <tbody>
        
         <tr>
          <td><label>Category:</label></td>
          
          <td>


				<form:select name="category" path="category" >
				         <form:option value="" label="---Select----" />
				    <c:forEach items="${categories}" var="category" >
				        
				        <option value="${category.id }"> 
 				            ${category.name}  
				        </option> 
				    </c:forEach>
				</form:select>
            
          
          </td>        
        </tr>
        
         <tr> 
          <td><label>Title</label></td>
          <td><form:input path="title" id="title"/></td>        
        </tr>
        
         <tr>
          <td><label>Author</label></td>
          <td><form:input path="author" id="author"/></td>        
        </tr>
        
         <tr>
          <td><label>ISBN</label></td>
          <td><form:input path="isbn" id="isbn"/></td>        
        </tr>
        
         <tr>
          <td><label>Publish Date</label></td>
          <td><form:input path="PublishDate" id="PublishDate"/></td>        
        </tr>
        
         <tr>
          <td><label>Book Image</label></td>
          <td><form:input type="file" path="" name="image" id="image" size="20"/><br/>
          
          <img id="thumbnail" alt="imgPreview" style="width:20%; margin-top:10px;"/>
          </td>        
        </tr>
        
         <tr>
          <td><label>Price</label></td>
          <td><form:input path="price" id="price"/></td>        
        </tr>
        
         <tr>
          <td><label>Description</label></td>
          <td><form:textarea rows="5" cols="20" path="description" id="description"/></td>        
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
		
		$('#PublishDate').datepicker();
		$('#description').richText();

		$('#image').change(function(){
			
			showImageThumbnail(this);
		});
		
		$("#BookForm").validate({
			rules:{
				category:"required",
				title:"required",
				author:"required",
				isbn:"required",
				//image:"required",
				price:"required",
				PublishDate:"required",
				description:"required",
				
			},
			messages:{
				category:"Please select category",
				title:"Please enter title of the book",
				author:"Please enter author of the book",
				isbn:"Please enter the isbn number",
			    //image:"Please select the image of the book",
				price:"Please select price of the book",
				PublishDate:"Please select publish date",
				description:"Please enter the description of the book"
				
			}
		});
		
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