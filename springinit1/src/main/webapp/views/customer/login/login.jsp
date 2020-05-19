<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Login</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/jquery-ui.min.css">

<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>
  	<jsp:directive.include file="/views/customer/header.jsp"/>
	<div align="center">
	
		<h1>  Customer Login </h1>
		<c:if test="${message!=null}">
			
			<div align="center">
			
			 <h4>${message}</h4>
			 </div>
		</c:if>
			 
 			 <form:form action="CustomerLogin"  modelAttribute="customer" id="LoginForm" method="POST"> 
			 
			 <form:hidden path="customerId"/>
			   <table class="form">
			   <tbody>
			   
				<tr>
					<td><label>Email:</label></td>
					<td><form:input path="email" size="45" id="email" value="${customer.email}"/></td>
				</tr>
				
				<tr>
					<td><label>Password:</label></td>
					<td><form:input type="password" path="password" size="45" value="${customer.password}" id="password"/></td>
				</tr>
				
				<tr>
				
				    <td>
				    <div colspan="2" align="right">
				        <button type="submit">Login</button>
				    </div>
				    </td>
				</tr>
				
				</tbody>
							   
			   </table>
			 
			 
			 
			 </form:form>
			
			
			</div>
			
	
		
		
	
	<jsp:directive.include file="/views/customer/footer.jsp"/>
	
</body>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("#LoginForm").validate({
			rules:{
				email:{required:true,
					   email:true},
				password:"required",
				
				
			},
			messages:{
				email:{
					required:"Please enter email",
					email:"Please enter a valid email address"
				},
				
				password:"Plese enter password"
				
			}
		});
		
	});

</script>
</html>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	