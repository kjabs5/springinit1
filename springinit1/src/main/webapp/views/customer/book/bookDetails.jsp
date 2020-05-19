<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${book.title }-Online Book Store</title>
<link rel="shortcut icon" href="">
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
</head>
<body>

		 <jsp:directive.include file="/views/customer/header.jsp"/>
		 
		 
		<div align="center">
		
 		  <table width="80%" style="border:0px;"> 
<!-- 		  <table class="book">  -->
		   
		       <tr>
		       
		           <td colspan="3" align="left" >
		           		
		           		<h2>${book.title }</h2> by ${book.author}
		           
		           </td>
		           
		       </tr>
		       
		       <tr>
		       		<td rowspan="2">
		       	    <img src="/uploads/${book.file_name }" width="240" height="300" alt="ImagePreview"/> 
		       
		       		</td>
		       		
		       		<td valign="top" align="left">
		       			  <jsp:directive.include file="/views/customer/bookRating.jsp"/>
		       			  <a href="#reviews">${fn:length(book.reviews)} Reviews</a>		       		
		       		</td>
		       		
		       		<td valign="top" rowspan="2" width="20%">
		       			
		       		<h2>	${book.price}</h2>
		       			<br/> <br/>
		       			<button id="buttonAddToCart">Add to Cart</button>
		       		
		       		</td>
		       
		      		
		       
		       </tr>
		       
		       <tr>
		       
		         <td  valign="top" style="text-align:justify;">
		       
		       		${book.description}
		       		
		       	</td>
		       
		       </tr>
		       
		       <tr> <td> &nbsp;</td></tr>
		       
		       <tr>
		       
		       		<td>
		       			<h2><a id="reviews"> Customer Reviews </a>  </h2>
		       		</td>
		       		
		       		<td colspan="2" align="center">
		       			<button id="buttonWriteReview">Write a Customer Review</button>
		       		</td>
		       
		       </tr>
		       
		       <tr>
		       
		          <td colspan="3" align="left">
		          
		             <table class="normal">
		             
		               <c:forEach items="${book.reviews}" var="review" >
		               
		                  <tr>
		                    <td>
		                       <div> <c:forTokens items="${review.starsForCustomerReview}" delims="," var="star"> 
          
						          <c:if test="${ star eq 'on'}">
						          
						          <img src="../images/on.png"/>
						          
						          </c:if>
						          
						          <c:if test="${ star eq 'off'}">
						          
						          <img src="../images/off.png"/>
						          
						          </c:if>
						          
						        
						         </c:forTokens>
						        - <b> ${review.headline} </b>
						     
						        
						        </div>
		                    </td>
		                  </tr>
		                  <tr>
		                    <td>
		                      by ${review.customer.fullname} on ${review.reviewTime}
		                    </td>
		                  </tr>
		                  
		                  <tr>
		                    <td>
		                     <i>${review.comment}</i>
		                    </td>
		                  </tr>
		                  
		                   <tr>
		                    <td>
		                     &nbsp;
		                    </td>
		                  </tr>
		               
		               </c:forEach>
		             
		             </table>
		          
		             
		          
		          </td>
		       
		       
		       
		       
		       </tr>
		      
		      
		      
		  </table>
		
			
		
		</div>
		
		 <jsp:directive.include file="/views/customer/footer.jsp"/>
</body>
<script type="text/javascript">
   $(document).ready(function(){
	   
	   $("#buttonWriteReview").click(function() {
		   
		   window.location="Review_Form?book_id="+${book.bookId};
		   
	   });
	   
      $("#buttonAddToCart").click(function() {
		   
		   window.location="addToCart?book_id="+${book.bookId};
		   
	   });
	   
   });

</script>
</html>