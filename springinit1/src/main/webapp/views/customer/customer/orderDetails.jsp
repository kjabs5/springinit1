<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Order Details- Evergreen Bookstore</title>
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>


		   <jsp:directive.include file="/views/customer/header.jsp"/>
		   
		 
		  <c:set var="mainlink"  value="${pageContext.request.contextPath }" />   
		   
		   
		   
        <div align="center">
           
           <h1 class="heading">Your OrderId: ${orderDetails.orderId}</h1>

        </div>
        
        <c:if test="${message!=null}">
       
         <div align="center">
       
          <h4 class="message"> ${message}</h4> 
        </div>
         </c:if>
          <div align="center">
           
           
           <table border="1">
              <tr>
                <td><b>Order Status</b></td>
                <td>${orderDetails.status}</td> 
             </tr>
             
               <tr>
                <td><b>Order Date</b></td>
                <td>${orderDetails.orderDate}</td> 
             </tr>
          
              <tr>
                <td><b>Quantities</b></td>
                <td>${orderDetails.bookCopies}</td> 
             </tr>
              <tr>
                <td><b>Total Amount</b></td>
                <td><fmt:formatNumber value="${orderDetails.total}" type="currency" /></td> 
             </tr>
              <tr>
                <td><b>Recipient Name</b></td>
                <td>${orderDetails.recipientName}</td> 
             </tr>
              <tr>
                <td><b>Recipient Phone</b></td>
                <td>${orderDetails.recipientPhone}</td> 
             </tr>
              <tr>
                <td><b>Ship To</b></td>
                <td>${orderDetails.shippingAddress}</td> 
             </tr>
              <tr>
                <td><b>Payment Method</b></td>
                <td>${orderDetails.paymentMethod}</td> 
             </tr>
             
           
           
           </table>

        </div>
        <div  align="center">
          <h2>Ordered Books</h2>
          
          <table border="1">
            <tr>
            <th>Index</th>
            <th>Book</th>
            <th>Author</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>SubTotal</th>
            
            </tr>
            <c:forEach items="${orderDetails.orderDetails}" var="orderDetail" varStatus="status">
            	<tr>
            	 <td> ${status.index+1 }</td>
            	 <td> 
            	 <img style="vertical-align:middle;" src="/uploads/${orderDetail.book.file_name }" width="48" height="64" alt="ImagePreview"/>
            	 ${orderDetail.book.title} </td>
             	<td> ${orderDetail.book.author} </td>	    
            	<td><fmt:formatNumber value=" ${orderDetail.book.price}" type="currency" /> </td>
            	<td> ${orderDetail.quantity} </td>
            	<td><fmt:formatNumber value=" ${orderDetail.subtotal}" type="currency" /> </td>
            	</tr>
            
            </c:forEach>
            <tr>
                <td colspan="4" align="right">Total</td>
                <td><b>${orderDetails.bookCopies}</b></td>
                <td><b><fmt:formatNumber value=" ${orderDetails.total}" type="currency" /></b></td>
            
            </tr>
          
          </table>
        
        
        </div>
        <br>
     
       
		 <jsp:directive.include file="/views/customer/footer.jsp"/>
		
</body>

<script>
	$(document).ready(function(){

	});




</script>
</html>