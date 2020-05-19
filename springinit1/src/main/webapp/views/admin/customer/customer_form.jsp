<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Customer</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/jquery-ui.min.css">



<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>

</head>
<body>


		   <jsp:directive.include file="/views/admin/header1.jsp"/>
        <div align="center">
        
            <h2>
            
              <c:if test="${value==0}">
                Create New Customer
              </c:if>
            
              <c:if test="${value==1}"> 
                 Edit Customer 
              </c:if> 
            
            
            </h2>  
           
         </div>
         
         <div align="center">
         
          <c:if test="${value==1}">
                <form:form  action="updateCustomer" modelAttribute="customer" method="POST" id="CustomerForm">
   		     <form:hidden path="customerId"/>
   		 <table class="form">
        <tbody>
        
         <tr>
<!--           <td style="text-align:right;"><label>Email:</label></td> -->
          <td><label>Email:</label></td>
          <td>
          <form:input path="email" size="45" id="email" readonly="true" /></td>  
         
        </tr>
        
         <tr> 
          <td><label>Full Name</label></td>
          <td><form:input path="fullname" size="45" id="fullname"/></td>        
        </tr>
        
         <tr>
          <td><label>Password</label></td>
          <td><form:input type="password" path="password" size="45" id="password"/></td>        
        </tr>
        
       
        
         <tr>
          <td><label>Phone Number</label></td>
          <td><form:input path="phone" size="45" id="phone"/></td>        
        </tr>
        
         <tr>
          <td><label>Address</label></td>
          <td><form:input path="address" size="45" id="address"/></td>       
        </tr>
        
         <tr>
          <td><label>City</label></td>
          <td><form:input path="city" size="45" id="city"/></td>        
        </tr>
        
         <tr>
          <td><label>Zip Code</label></td>
          <td><form:input path="zipcode" size="45" id="zipcode"/></td>        
        </tr>
        
          <tr>
          <td><label>Country</label></td>
          <td><form:input path="country" size="45" id="country"/></td>        
        </tr>
        
<!--          <tr> -->
<!--           <td><label>Date</label></td> -->
<%--           <td><form:input path="register_date" size="45" id="register_date"/></td>         --%>
<!--         </tr> -->
        
          <tr>
          <td><label>Confirm </label></td>
          <td><form:input  name="confirmPassword" type="password" value="${customer.password}" path="" size="45" id="confirmPassword"/></td>        
        </tr>
        
            <tr><td></td><td> <button type="submit">Save</button> <button type="submit">Cancel</button></td>
          
        </tr>

        </tbody>
        
            
      
      </table>
    
   </form:form>
              
             
          </c:if>
          
          <c:if test="${value==0}">
          
         <form:form  action="addCustomer" modelAttribute="customer" method="POST" id="CustomerForm">
         <table class="form">
        <tbody>
        
         <tr>
<!--           <td style="text-align:right;"><label>Email:</label></td> -->
          <td><label>Email:</label></td>
          <td>
          <form:input path="email" size="45" id="email"/></td>  
                 
        </tr>
        
         <tr> 
          <td><label>Full Name</label></td>
          <td><form:input path="fullname" size="45" id="fullname"/></td>        
        </tr>
        
         <tr>
          <td><label>Password</label></td>
          <td><form:input type="password" path="password" size="45" id="password"/></td>        
        </tr>
        
       
        
         <tr>
          <td><label>Phone Number</label></td>
          <td><form:input path="phone" size="45" id="phone"/></td>        
        </tr>
        
         <tr>
          <td><label>Address</label></td>
          <td><form:input path="address" size="45" id="address"/></td>       
        </tr>
        
         <tr>
          <td><label>City</label></td>
          <td><form:input path="city" size="45" id="city"/></td>        
        </tr>
        
         <tr>
          <td><label>Zip Code</label></td>
          <td><form:input path="zipcode" size="45" id="zipcode"/></td>        
        </tr>
        
          <tr>
          <td><label>Country</label></td>
          <td><form:input path="country" size="45" id="country"/></td>        
        </tr>
        
<!--          <tr> -->
<!--           <td><label>Date</label></td> -->
<%--           <td><form:input path="register_date" size="45" id="register_date"/></td>         --%>
<!--         </tr> -->
        
       <tr>
          <td><label>Confirm Password</label></td>
          <td><form:input type="password" path="" size="45" name="confirmPassword" id="confirmPassword"/></td>        
        </tr>
        
        
            <tr><td></td><td> <button type="submit">Save</button> <button type="submit">Cancel</button></td>
          
        </tr>

        </tbody>
        
            
      
      </table>
    
   </form:form>
              
          
          </c:if>
          
          
           
   
 
         </div>
		
		<hr width="60%"/>
		 <jsp:directive.include file="/views/admin/footer1.jsp"/>
		
</body>
<script type="text/javascript">

	$(document).ready(function(){
		
	
		
		$("#CustomerForm").validate({
			rules:{
				email:{required:true,
					   email:true},
				fullname:"required",
				password:"required",
				//confirmPassword:"required",
				confirmPassword:{
					required:true,
					equalTo:'#password'
				},
				phone:"required",
				address:"required",
				city:"required",
				zipcode:"required",
				register_date:"required",
				country:"required"
			},
			
			messages:{
				email:{
					required:"Please enter email",
					email:"Please enter a valid email address"
				},
				fullname:"Full Name Required",
				password:"Password Required",
			
			confirmPassword:{
					required:"Please confirm password",
					equalTo:"Password doesnot match"
					
				},
				
				phone:"Please enter Phone number",
				address:"Please enter address",
				city:"Enter the city",
				zipcode:"Enter the zipcode",
				register_date:"Register date required",
				country:"Enter the country",
				//confirmPassword:"Confirm the password"
				
			}
		});
		
	});






</script>
</html>