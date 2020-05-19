<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customers List - Evergreen Bookstore Administration</title>
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>


		   <jsp:directive.include file="/views/admin/header1.jsp"/>
		   
		 
		  <c:set var="mainlink"  value="${pageContext.request.contextPath }" />   
		   
		   
		   
        <div align="center">
           
           <h1 class="heading">Customers Management</h1>
<%--            <a href="${pageContext.request.contextPath }/Admin/userform">Create New User</a> --%>
            <a href="${ mainlink}/Admin/customerform">Create New Customer</a>
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
               		Email
               		</th>
               		
               		<th>
               		Full Name
               		</th>
               		
               		
               		<th>
               		City
               		</th>
               		
               		<th>
               		Country
               		</th>
               	
               		<th>
               		Register Date
               		</th>
               		
               		<th>
               		Actions
               		</th>
               		
               
               </tr>
               <c:forEach var="customer" items="${customers}" varStatus="status">
               
               
               <c:url var="update" value="showFormForCustomerUpdate">
   
               <c:param name="customerId"  value="${customer.customerId}" />
   
               </c:url>
               
               
               <c:url var="delete" value="deleteCustomer">
   
   		        <c:param name="customerId"  value="${customer.customerId}" />
   
   			   </c:url>
               
               		<tr>
               		    <td> ${status.index+1 }</td>
              		    <td> ${customer.customerId} </td> 
  						<td> ${customer.email} </td>
               		    <td> ${customer.fullname} </td>
               		    <td> ${customer.city} </td>
               		    <td> ${customer.country} </td>
               		    <td> ${customer.register_date} </td>
               		    
               		    <td> 
							<a href="${update }">Edit</a>              		                    		   
               		    	<a href="javascript:void(0)" class="deleteCustomer" id="${customer.customerId}">Delete</a>
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
		$(".deleteCustomer").each(function(){
			$(this).on("click",function(){
				customerId=$(this).attr("id");
				if(confirm('Are you sure you want to delete the customer with Id '+customerId))
				window.location='deleteCustomer?customerId='+customerId;
			});
			
		
		});
	});




</script>
</html>