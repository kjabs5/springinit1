<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reviews List - Evergreen Bookstore Administration</title>
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>


		   <jsp:directive.include file="/views/admin/header1.jsp"/>
		   
		 
		  <c:set var="mainlink"  value="${pageContext.request.contextPath }" />   
		   
		   
		   
        <div align="center">
           
           <h1 class="heading">Reviewss Management</h1>

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
               		Book
               		</th>
               		
               		<th>
               		Rating
               		</th>
               		
               		
               		<th>
               		Headline
               		</th>
               		
               		<th>
               		Customer
               		</th>
               	
               		<th>
               		Review On
               		</th>
               		
               		<th>
               		Actions
               		</th>
               		
               
               </tr>
               <c:forEach var="review" items="${reviews}" varStatus="status">
               
               
               <c:url var="update" value="showFormForCustomerUpdate">
   
               <c:param name="reviewId"  value="${review.reviewId}" />
   
               </c:url>
               
               
               <c:url var="delete" value="deleteReview">
   
   		        <c:param name="reviewId"  value="${review.reviewId}" />
   
   			   </c:url>
               
               		<tr>
               		    <td> ${status.index+1 }</td>
              		    <td> ${review.reviewId} </td> 
  						<td> ${review.book.title} </td>
               		    <td> ${review.rating} </td>
               		    <td> ${review.headline} </td>
               		    <td> ${review.customer.fullname} </td>
               		    <td> ${review.reviewTime} </td>
               		    
               		    <td> 
<%-- 							<a href="${update }">Edit</a>              		                    		    --%>
               		    	<a href="javascript:void(0)" class="deleteReview" id="${review.reviewId}">Delete</a>
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
		$(".deleteReview").each(function(){
			$(this).on("click",function(){
				reviewId=$(this).attr("id");
				if(confirm('Are you sure you want to delete the review with Id '+reviewId))
				window.location='deleteReview?reviewId='+reviewId;
			});
			
		
		});
	});




</script>
</html>