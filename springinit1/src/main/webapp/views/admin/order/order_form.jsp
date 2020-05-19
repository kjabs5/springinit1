<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Order - Evergreen Bookstore Administration</title>
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>


		   <jsp:directive.include file="/views/admin/header1.jsp"/>
		   
		 
		  <c:set var="mainlink"  value="${pageContext.request.contextPath }" />   
		   
		   
		   
        <div align="center">
           
           <h1 class="heading">Edit OrderId: ${orderDetails.orderId}</h1>

        </div>
        
        <c:if test="${message!=null}">
       
         <div align="center">
       
          <h4 class="message"> ${message}</h4> 
        </div>
         </c:if>
         
         <form action="update_order" method="post" id="updateorder" > 
          <div align="center">
           
        
           <table border="1">
             <tr>
                <td><b>Order By</b></td>
                <td>${orderDetails.customer.fullname}</td> 
             </tr>
             
              <tr>
                <td><b>Order Date</b></td>
                <td>${orderDetails.orderDate}</td> 
             </tr>
             
               <tr>
                <td><b>Recipient Name</b></td>
                <td><input type="text" name="RecipientName" value="${orderDetails.recipientName}" size="25"/></td> 
             </tr>
             
              <tr>
                <td><b>Recipient Phone</b></td>
                <td><input type="text" name="RecipientPhone" value="${orderDetails.recipientPhone}" size="25" /></td> 
             </tr>
             
              <tr>
                <td><b>Ship To</b></td>
                <td><input type="text" name="ShippingAddress" value="${orderDetails.shippingAddress}" size="25" /></td> 
             </tr>
             
              <tr>
                <td><b>Payment Method</b></td>
                <td>
                <select name="paymentMethod" style="width:210px;"  >
                 <option value="Cash on Delivery" >Cash on Delivery</option>
                </select>
                </td> 
             </tr>
    
              <tr>
                <td><b>Order Status</b></td>
                <td>
                <select name="orderStatus" style="width:210px;" >
                  <option value="Processing">Processing</option>
                  <option value="Shipping">Shipping</option>
                  <option value="Delivered">Delivered</option>
                  <option value="Completed">Completed</option>
                  <option value="Cancelled">Cancelled</option>
                
                </select>
                </td> 
             </tr>
            
           
           </table>

        </div>
        <div  align="center">
          <h2>Ordered Books</h2>
          
          <table border="1">
            <tr>
            <th>Index</th>
            <th>Book Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>SubTotal</th>
            <th></th>
            
            </tr>
            <c:forEach items="${orderDetails.orderDetails}" var="orderDetail" varStatus="status">
            	<tr>
            	 <td> ${status.index+1 }</td>
            	 <td> 
            	 <img style="vertical-align:middle;" src="/uploads/${orderDetail.book.file_name }" width="48" height="64" alt="ImagePreview"/>
            	 ${orderDetail.book.title} 
            	 </td>
             	<td> ${orderDetail.book.author} </td>	    
            	<td>
            	<input type="hidden" name="price" value="${orderDetail.book.price}"/>
            	<fmt:formatNumber value=" ${orderDetail.book.price}" type="currency" /> 
            	</td>
            	<td>
            	<input type="hidden" name="bookId" value="${orderDetail.book.bookId}"/>
 <%--            	 <input type="text" name="quantity" value="${orderDetail.quantity}" size="5">     --%>
<%--                 <input type="text"  name="quantity${status.index+1}" value="${orderDetail.quantity}" size="5">  --%>
            	  <input type="text"  name="quantity${status.index+1}" value="${orderDetail.quantity}" size="5"> 
<%--             	<input type="text" name="ShippingAddress" value="${orderDetail.quantity}" size="5"/> --%>
            	 </td>
            	<td><fmt:formatNumber value=" ${orderDetail.subtotal}" type="currency" /> </td>
            	<td><a href="RemoveBookFromOrder?id=${orderDetail.book.bookId}">Remove</a></td>
            	</tr>
            
            </c:forEach>
            <tr>
                <td colspan="4" align="right">Total</td>
                <td><b>${orderDetails.bookCopies}</b></td>
                <td><b><fmt:formatNumber value=" ${orderDetails.total}" type="currency" /></b></td>
                 <td></td>
            </tr>
          
          </table>
        
        
        </div>
        <br>
        <div align="center">
        <br/>
        <a href="javascript:showAddBookPopup()">Add Books</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <button type="submit" >Save</button>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <input type="button"  value="Cancel" onclick="javascript:window.location='bookOrders' "/> 
        </div>
       </form>
		 <jsp:directive.include file="/views/admin/footer1.jsp"/>
		
</body>

<script>
    function showAddBookPopup()
    {   
    	var width=700;
    	var height=250;
    	var left=(screen.width-width)/2;
    	var top=(screen.height-height)/2;
    	window.open('addBookForm','_blank',
    			'width='+width+ ', height='+height+',top='+top+',left='+left);
    }
    
    
    
$(document).ready(function(){
		
		$("#updateorder").validate({
			rules:{
				RecipientName:"required",
				RecipientPhone:"required",
				ShippingAddress:"required",
				<c:forEach items="${orderDetails.orderDetails}" var="book" varStatus="status">
    		      quantity${status.index+1}:{required:true,
    			  number:true,
    			  min : 1},
    		    </c:forEach>
				
				
			},
			messages:{
				RecipientName:"Please enter recipient name",
				RecipientPhone:"Please enter recipient phone",
				ShippingAddress:"Please enter recipient address",
				<c:forEach items="${orderDetails.orderDetails}" var="book" varStatus="status">
  		          quantity${status.index+1}:{required:"Please enter quantity",
	        			number:"quantity must be number",
	        			min:"quantity must be greater than 0"},
  		        </c:forEach>
				
	        		
	        	
				
			}
		});
		
	});

</script>
</html>