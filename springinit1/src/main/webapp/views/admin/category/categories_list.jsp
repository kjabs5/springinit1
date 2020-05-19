<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Evergreen Bookstore Book Categories</title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>


		   <jsp:directive.include file="/views/admin/header1.jsp"/>
		   
		 
		  <c:set var="mainlink"  value="${pageContext.request.contextPath }" />   
		   
		   
		   
        <div align="center">
           
           <h1 class="heading">Category Management</h1>
<%--            <a href="${pageContext.request.contextPath }/Admin/userform">Create New User</a> --%>
            <a href="${ mainlink}/Admin/categoryForm">Create New Category</a>
        </div>
        
        <div align="center">
       
       <h4 class="message"> ${message}</h4> 
        </div>
        <br>
        
        <div align="center">
            <table border="1" cellpadding="5">
               <tr>
               		<th>
               		Index
               		</th>
               		
               		<th>
               		Id
               		</th>
               		
               		<th>
               		Category
               		</th>
               		
               	    <th>
               		Action
               		</th>
               		
               		
               
               </tr>
               <c:forEach var="category" items="${categories}" varStatus="status">
               
               
               <c:url var="update" value="showCategoryFormForUpdate">
   
               <c:param name="categoryId"  value="${category.id}" />
   
               </c:url>
               
               
               <c:url var="delete" value="deleteCategory">
   
   			   <c:param name="categoryId"  value="${category.id}" />
   
   			   </c:url>
               
               		<tr>
               		    <td> ${status.index+1 }</td>
               		    <td> ${category.id} </td>
               		    <td> ${category.name} </td>
               		   
               		    <td> 
							<a href="${update }">Edit</a>              		    
               		    	<a href="${delete }">Delete</a>
               		    </td>
               		</tr>
               
               </c:forEach>
            	
            
            
            
            
            </table>
			
        
        </div>
		
		<hr width="60%"/>
		 <jsp:directive.include file="/views/admin/footer1.jsp"/>
		
</body>
</html>