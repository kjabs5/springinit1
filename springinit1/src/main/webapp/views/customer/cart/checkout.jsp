<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout - Evergreen Online Book Store</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/jquery-ui.min.css">

<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>
  	<jsp:directive.include file="/views/customer/header.jsp"/>
	<div align="center">
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
		   <h2>Review your Order Details <a href="${pageContext.request.contextPath }/kjabs/cart">Edit</a></h2>
		       
		     <div>
		       <table border="1">
		       
		       <tr>
		         <th>No</th>
		         <th colspan="2">Book</th>
		         <th>Author</th>
		         <th>Price</th>
		         <th>Quantity</th>
		         <th>SubTotal</th>
		       </tr>
		       <c:forEach items="${cart.items}" var="item" varStatus="status">
		         
		         <tr>
		          <td>${status.index+1}</td>
		          
		          <td><img src="/uploads/${item.key.file_name }" width="84" height="110" alt="ImagePreview"/></td>
		         <td><span id="book-title">${item.key.title}</span></td>
		         <td> ${item.key.author}</td>
		          <td> <fmt:formatNumber value="${item.key.price}" type="currency" /></td>
		          <td>
		         <input type="text" name="quantity" value="${item.value}" size="5" readonly="readonly">
		          </td>
		          <td><fmt:formatNumber value="${item.value*item.key.price}" type="currency" /></td>
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
		       <h2>Your Shipping Information</h2>
		       <form:form action="placeOrder"  id="OrderForm1" modelAttribute="bookOrder" method="post">
		       <table class="form">
		         <tr>
		         <td><label><b>Recipient Name</b></label></td>
		         <td><form:input path="recipientName" name="recipientName" value="${LoggedCustomer.fullname}"/></td>
		         </tr>
		          <tr>
		         <td><label><b>Recipient Phone</b></label></td>
		         <td><form:input path="recipientPhone" name="recipientPhone" value="${LoggedCustomer.phone}"/></td>
		         </tr>
		          <tr>
		         <td><label><b>Street Address</b></label></td>
		         <td><form:input path="" name="StreetAddress" value="${LoggedCustomer.address}"/></td>
		         </tr>
		          <tr>
		         <td><label><b>City</b></label></td>
		         <td><form:input path="" name="city" value="${LoggedCustomer.city}"/></td>
		         </tr>
		          <tr>
		         <td><label><b>Zipcode</b></label></td>
		         <td><form:input path="" name="zipcode"  value="${LoggedCustomer.zipcode}"/></td>
		         </tr>
		          <tr>
		         <td><label><b>Country</b></label></td>
		         <td><form:input path="" name="country" value="${LoggedCustomer.country}"/></td>
		         </tr>
		       
		       
		       </table>
		       <div><h2>Payment</h2>
		       Choose your payment method:
		       &nbsp;&nbsp;&nbsp;&nbsp;
<!-- 		       <select name="paymentMethod"> -->
<!-- 		       <option value="CashOnDelivery"> Cash on Delivery</option> -->
<!-- 		       </select > -->
                <form:select name="paymentMethod" path="paymentMethod" >
                    <form:option value="" label="---Select----" />
				  <form:options items="${paymentOption}"/>
				</form:select>
		       </div>
		       <br>
		       <div>
		       <table class="normal">
		       
		        <tr>
		         
		          <td><button type="submit">Place Order</button></td>
 		        
		          <td><a href="${pageContext.request.contextPath }/kjabs/home">Continue Shopping</a></td>
		     
		        </tr>
		       
		       </table>
		       
		       
		       </div>
		       
		       
		       </form:form>
		       
		       
		    
	  
		</c:if>	
	
			</div>
			
	
		
		
	
	<jsp:directive.include file="/views/customer/footer.jsp"/>
	
</body>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("#OrderForm1").validate({
			
			rules:{
				recipientName:"required",
				recipientPhone:"required",
				StreetAddress:"required",
				city:"required",
				ZipCode:"required",
				Country:"required",
				paymentMethod:"required"
				
			},
			messages:{
				
				recipientName:"Please enter Recipient Name",
				recipientPhone:"Please enter Recipient Phone",
				StreetAddress:"Please enter Street Address",
				city:"Please enter city",
				ZipCode:"Please enter ZipCode",
				Country:"Please enter the name of country",
				paymentMethod:"please select the paymentmethod"
				
			}
			
			
			
		});

		
	});

</script>
</html>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	