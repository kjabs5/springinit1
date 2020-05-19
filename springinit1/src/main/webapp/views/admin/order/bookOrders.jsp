<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Order - Evergreen Bookstore Administration</title>
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>


		   <jsp:directive.include file="/views/admin/header1.jsp"/>
		   
		 
		  <c:set var="mainlink"  value="${pageContext.request.contextPath }" />   
		   
		   
		   
        <div align="center">
           
           <h1 class="heading">Book Orders Management</h1>

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
               		Order Id
               		</th>
               		
               		<th>
               		Order By
               		</th>
               		
               		<th>
               		Book Copies
               		</th>
               		
               		
               		<th>
               		Total
               		</th>
               		
               		<th>
               		Payment Method
               		</th>
               	
               		<th>
               		Status
               		</th>
               		
               		<th>
               		Order Date
               		</th>
               		
               		<th>
               		Actions
               		</th>
               		
               
               </tr>
               <c:forEach var="order" items="${bookOrders}" varStatus="status">
               
               
               <c:url var="update" value="EditForBookOrder">
   
               <c:param name="orderId"  value="${order.orderId}" />
   
               </c:url>
               
                <c:url var="details" value="showOrderDetails">
   
               <c:param name="orderId"  value="${order.orderId}" />
   
               </c:url>
               
               <c:url var="delete" value="deleteBookOrder">
   
   		        <c:param name="orderId"  value="${order.orderId}" />
   
   			   </c:url>
               
               		<tr>
               		    <td> ${status.index+1 }</td>
              		    <td> ${order.orderId} </td> 
  						<td> ${order.customer.fullname} </td>
               		    <td> ${order.bookCopies} </td>
               		    <td><fmt:formatNumber value="${order.total}" type="currency" /></td>
               		    <td> ${order.paymentMethod} </td>
               		    <td> ${order.status} </td>  
               		    <td> ${order.orderDate} </td>
               		    
               		    <td> 
               		        <a href="${details }">Details</a> 
							<a href="${update }">Edit</a>              		                    		    
               		    	<a href="javascript:void(0)" class="deleteOrder" id="${order.orderId}">Delete</a>
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
		$(".deleteOrder").each(function(){
			$(this).on("click",function(){
				orderId=$(this).attr("id");
				if(confirm('Are you sure you want to delete the order with Id '+orderId))
				window.location='deleteOrder?orderId='+orderId;
			});
			
		
		});
	});




</script>
</html>