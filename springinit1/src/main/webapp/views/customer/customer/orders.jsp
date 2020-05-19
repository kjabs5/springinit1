<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
       <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders - Evergreen Bookstore Administration</title>
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>


		   <jsp:directive.include file="/views/customer/header.jsp"/>
		   
		 
		  <c:set var="mainlink"  value="${pageContext.request.contextPath }" />   
		   
		   
		   
        <div align="center">
           
           <h1 class="heading">Orders History</h1>

        </div>
        
        <c:if test="${fn:length(orders)==0}">
		     <h2 align="center">You have no any items ordered</h2>
		</c:if>	
      
        <c:if test="${fn:length(orders)>0}">
        
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
               	 Quantity
               		</th>
               		
               		<th>
               		Total Amount 
               		</th>
               		
               		
               		<th>
               		Order Date
               		</th>
               		
               		
               	
               		<th>
               		Status
               		</th>
               		
               	
               		
               		<th>
               		Actions
               		</th>
               		
               
               </tr>
               <c:forEach var="order" items="${orders}" varStatus="status">
               
               

                <c:url var="details" value="showOrderDetailsForCustomer">
   
               <c:param name="orderId"  value="${order.orderId}" />
   
               </c:url>
               

               
               		<tr>
               		    <td> ${status.index+1 }</td>
              		    <td> ${order.orderId} </td> 
  						
               		    <td> ${order.bookCopies} </td>
               		    <td><fmt:formatNumber value="${order.total}" type="currency" /></td>
               		
               		    <td> ${order.orderDate} </td>
               		    <td> ${order.status} </td>  
               		    
               		    <td> 
               		        <a href="${details }">Details</a> 
               		    </td>
               		</tr>
               
               </c:forEach>
            	
            
            
            
            
            </table>
			
        
        </div>
		
		     
		</c:if>
        
        
		<hr width="60%"/>
		 <jsp:directive.include file="/views/customer/footer.jsp"/>
		
</body>

<script>
	$(document).ready(function(){
	
	});




</script>
</html>