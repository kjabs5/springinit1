<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Review</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/jquery-ui.min.css">

<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
</head>
<body>
  	<jsp:directive.include file="/views/customer/header.jsp"/>
	<div align="center">
	   <form:form id="form_review" action="saveReview" modelAttribute="review" method="post">
	      <table class="normal" width="50%">
	      
	        <tr>
	          <td><h2>Your Review</h2>
	          </td>
	          <td>&nbsp;</td>
	           
	          <td> <h2>${LoggedCustomer.fullname}</h2> </td>
	        </tr>
	        <tr>
	          <td colspan="3"><hr/></td>
	        </tr>
	        <tr> <td colspan="3"><div id="book-title"> ${book.title}</div></td><br/></tr>
	        <tr>
	            
	         
	         <td> <img src="/uploads/${book.file_name }" width="240" height="300" alt="ImagePreview"/>                 </td>
	          
	          <td>
	          <div id="rateYo"></div>
	          <form:hidden path="rating"/>
	          <form:hidden path="" name="bookId" value="${book.bookId}"/>
	          <br/>
	          <form:input path="headline" id="headline" size="40" placeholder="Headline or summary of your reviews (required)"/>
	          <br/>
	          <br/>
	          <form:textarea path="comment" cols="70" id="comment" rows="10" placeholder="write review details..."/>
	          </td>
	          
	        </tr>
	        <tr>
	        <td colspan="3" align="center">
	        
	           <button type="submit">  Submit </button> 
	           &nbsp;   &nbsp;
	           <button id="buttonCancel">Cancel</button>
	          
	        </td>
	        </tr>
	      
	      </table>
	   </form:form>	
	</div>
	<jsp:directive.include file="/views/customer/footer.jsp"/>
	
</body>

<script type="text/javascript">

	$(document).ready(function(){
		
		
		$("#buttonCancel").click(function(){
			history.go(-1);
		});
		
		$("#form_review").validate({
			rules:{
				headline:"required",
					 
				comment:"required"
				
				
			},
			messages:{
				headline:"Please enter headline",
				
				comment:"Plese enter comment"
				
			}
		});
		

		$(function () {
		 
		  $("#rateYo").rateYo({
		    starWidth: "40px",
		    fullStar:true,
		    onSet:function(rating,rateYoInstance)
		    {
		    	$("#rating").val(rating);
		    }
		  });
		 
		});
		
		
		
	});

</script>
</html>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	