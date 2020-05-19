<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users List - Evergreen Bookstore Administration</title>
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>


		   <jsp:directive.include file="/views/admin/header1.jsp"/>
		   
		 
		  <c:set var="mainlink"  value="${pageContext.request.contextPath }" />   
		   
		   
		   
        <div align="center">
           
           <h1 class="heading">Users Management</h1>
<%--            <a href="${pageContext.request.contextPath }/Admin/userform">Create New User</a> --%>
            <a href="${ mainlink}/Admin/userform">Create New User</a>
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
               		Email
               		</th>
               		
               		<th>
               		Password
               		</th>
               		
               		<th>
               		FullName
               		</th>
               		
               		<th>
               		Action
               		</th>
               		
               		
               
               </tr>
               <c:forEach var="user" items="${users}" varStatus="status">
               
               
               <c:url var="update" value="showFormForUpdate">
   
               <c:param name="userId"  value="${user.userId}" />
   
               </c:url>
               
               
               <c:url var="delete" value="delete">
   
   			   <c:param name="userId"  value="${user.userId}" />
   
   			   </c:url>
               
               		<tr>
               		    <td> ${status.index+1 }</td>
               		    <td> ${user.userId} </td>
               		    <td> ${user.email} </td>
               		    <td> ${user.password} </td>
               		    <td> ${user.fullName} </td>
               		    <td> 
							<a href="${update }">Edit</a>              		    
<%--                		    	<a href="${delete }" class="deleteUser" id="${user.userId}">Delete</a> --%>
               		    	<a href="javascript:void(0)" class="deleteUser" id="${user.userId}">Delete</a>
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
		$(".deleteUser").each(function(){
			$(this).on("click",function(){
				userId=$(this).attr("id");
				if(confirm('Are you sure you want to delete the user with Id '+userId))
				window.location='delete?userId='+userId;
			});
			
		
		});
	});




</script>
</html>