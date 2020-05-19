<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users List - Evergreen Bookstore Administration</title>
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>


		   <jsp:directive.include file="/views/admin/header1.jsp"/>
		   
		 
		  <c:set var="mainlink"  value="${pageContext.request.contextPath }" />   
		   
		   
		   
        <div align="center">
           
           <h1 class="heading">Books Management</h1>
<%--            <a href="${pageContext.request.contextPath }/Admin/userform">Create New User</a> --%>
            <a href="${ mainlink}/Admin/bookform">Create New Book</a>
        </div>
        <br>
         <div align="center">
       
       <h4 class="message"> ${msg}</h4> 
        </div>
        <br>
        
        <div align="center" style="">
            <table border="1" cellpadding="2">
               <tr>
               		<th>
               		Index
               		</th>
               		
               		<th>
               		Id
               		</th>
               		
               		<th>
               		Image
               		</th>
               		
               		<th>
               		Title
               		</th>
               		
               		<th>
               		Author
               		</th>
               		
               		<th>
               		Category
               		</th>
               		
               		<th>
               		Price
               		</th>
               		
               		<th>
               		Publish Date
               		</th>
               		
               		
               		
               		<th>
               		Action
               		</th>
               		
               
               </tr>
               <c:forEach var="book" items="${books}" varStatus="status">
               
               
               <c:url var="update" value="showFormForBookUpdate">
   
               <c:param name="bookId"  value="${book.bookId}" />
   
               </c:url>
               
               
               <c:url var="delete" value="deleteBook">
   
   		        <c:param name="bookId"  value="${book.bookId}" />
   
   			   </c:url>
               
               		<tr>
               		    <td> ${status.index+1 }</td>
               		    <td> ${book.bookId} </td>
<%--                  	    <td><img src="data:image/jpg;base64,${book.base64Image}" width="84" height="110"/></td>  --%>
  						<td><img src="/uploads/${book.file_name}" width="84" height="110"/></td>  
               		    <td> ${book.title} </td>
               		    <td> ${book.author} </td>
               		    <td> ${book.category.name} </td>
               		    <td>${book.price}</td>
               		    
               		    <td>${book.publishDate}</td>
               		
               		    
               		    <td> 
							<a href="${update }">Edit</a>              		    
<%--                		    	<a href="${delete }" class="deleteUser" id="${book.bookId}">Delete</a> --%>
               		    	<a href="javascript:void(0)" class="deleteBook" id="${book.bookId}">Delete</a>
               		    </td>
               		</tr>
               
               </c:forEach>
            	
            
            
            
            
            </table>
			
        
        </div>
		
		<hr width="60%"/>
		 <jsp:directive.include file="/views/admin/footer1.jsp"/>
		
</body>

<script>
	$(document).ready(function(){
		$(".deleteBook").each(function(){
			$(this).on("click",function(){
				bookId=$(this).attr("id");
				if(confirm('Are you sure you want to delete the book with Id '+bookId))
				window.location='deleteBook?bookId='+bookId;
			});
			
		
		});
	});




</script>
</html>