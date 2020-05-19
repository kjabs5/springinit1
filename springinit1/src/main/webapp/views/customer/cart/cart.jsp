<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/jquery-ui.min.css">

<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>
  	<jsp:directive.include file="/views/customer/header.jsp"/>
	<div align="center">
	
		<h1>  Your Shopping Cart Details </h1>
		<c:if test="${message!=null}">
			
			<div align="center">
			
			 <h4>${message}</h4>
			 </div>
		</c:if>
		
		<c:set var="cart" value="${sessionScope['cart'] }"/>
		
			
		<c:if test="${cart.totalItems==0}">
		     <h2>No items in cart</h2>
		</c:if>	
		
		<c:if test="${cart.totalItems>0}">
		    
		    
 		     <form action="updateCart" method="post" id="cartForm"> 
		       
		     <div>
		       <table border="1">
		       
		       <tr>
		         <th>No</th>
		         <th colspan="2">Book</th>
		         <th>Price</th>
		         <th>Quantity</th>
		         <th>SubTotal</th>
		         <th>
		           <a href=""><b>Clear Cart</b></a>
		         </th>
		       </tr>
		       <c:forEach items="${cart.items}" var="item" varStatus="status">
		         
		         <tr>
		          <td>${status.index+1}</td>
		          
		          <td><img src="/uploads/${item.key.file_name }" width="84" height="110" alt="ImagePreview"/></td>
		         <td><span id="book-title">${item.key.title}</span></td>
		          <td> <fmt:formatNumber value="${item.key.price}" type="currency" /></td>
		          <td>
		          <input type="hidden" name="bookId" value="${item.key.bookId}"/>
		         <input type="text" name="quantity" value="${item.value}" size="5">
		          </td>
		          <td><fmt:formatNumber value="${item.value*item.key.price}" type="currency" /></td>
		          <td><a href="${pageContext.request.contextPath }/kjabs/removeFromCart?book_id=${item.key.bookId}"><b>Remove</b></a></td>
		         </tr>
		       
		       </c:forEach>
		       
		       <tr>
		         <td></td>
		         <td></td>
		         <td></td>
		         <td> <b>${cart.totalQuantity}  book(s)</b></td>
		         <td> Total:</td>
		         <td colspan="2"><b> <fmt:formatNumber value="${cart.totalAmount}" type="currency" /></b></td>
		       </tr>
		       
		       
		       </table>
		       </div>
		       <div>
		       <table class="normal">
		       <tr><td>&nbsp;</td></tr>
		        <tr>
		          <td></td>
		          <td><button type="submit">Update</button></td>
 		         <td><input type="button" id="ClearCart" value="Clear Cart"/></td> 
		          <td><a href="${pageContext.request.contextPath }/kjabs/home">Continue Shopping</a></td>
		          <td><a href="${pageContext.request.contextPath }/kjabs/checkout">Checkout</a></td>
		        </tr>
		       
		       </table>
		       
		       </div>
		     </form>
		  
		    
		    
		</c:if>	
		
		
		
		
		
		
		
		
		
		
			</div>
			
	
		
		
	
	<jsp:directive.include file="/views/customer/footer.jsp"/>
	
</body>

<script type="text/javascript">

	$(document).ready(function(){
		
		
        $("#cartForm").validate({
        	rules:{
        		<c:forEach items="${cart.items}" var="item" varStatus="status">
        		quantity:{required:true
        			,number:true,
        			min : 1},
        		</c:forEach>
        	},
        	messages:{
        		<c:forEach items="${cart.items}" var="item" varStatus="status">
        		quantity:{required:"Please enter quantity",
        			number:"quantity must be number",
        			min:"quantity must be greater than 0"},
        		</c:forEach>
        	}
        	
        });
        $("#ClearCart").click(function(){
			window.location="ClearCart";
			
		});
		
	});

</script>
</html>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	