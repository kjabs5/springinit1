<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Profile - Online Book Store </title>
</head>
<body>

         <jsp:directive.include file="/views/customer/header.jsp"/>
         
         
         <div align="center">
         <br/>
         <h3>
            Welcome, ${LoggedCustomer.fullname}
         </h3>
          <br/>
           <h3>
           <c:if test="${msg!=null}">
            ${msg}
            </c:if>
         </h3>
         
         <br/>
         
           <c:url var="update" value="showFormForUpdate">
   
               <c:param name="customerId"  value="${LoggedCustomer.customerId}" />
   
           </c:url>
        
         
         <table class="form">
           <tr>
           
             <td><b>Email Address:</b></td>
             <td>${LoggedCustomer.email}</td>
           
           </tr>
           <tr>
           
             <td><b>Full Name:</b></td>
             <td>${LoggedCustomer.fullname}</td>
           
           </tr>
           <tr>
           
             <td><b>Phone Number:</b></td>
             <td>${LoggedCustomer.phone}</td>
           
           </tr>
           <tr>
           
             <td><b>Address:</b></td>
             <td>${LoggedCustomer.address}</td>
           
           </tr>
           <tr>
           
             <td><b>City:</b></td>
             <td>${LoggedCustomer.city}</td>
           
           </tr>
           
           <tr>
           
             <td><b>Zipcode:</b></td>
             <td>${LoggedCustomer.zipcode}</td>
           
           </tr>
           <tr>
           
             <td><b>Country:</b></td>
             <td>${LoggedCustomer.country}</td>
           
           </tr>
         <tr><td> &nbsp;</td> </tr>
         <tr><td colspan="2" align="center"><b><a href="${update}"> Edit My Profile </a></b> </td> </tr>
         </table>
 </div>



		 <jsp:directive.include file="/views/customer/footer.jsp"/>

</body>
</html>