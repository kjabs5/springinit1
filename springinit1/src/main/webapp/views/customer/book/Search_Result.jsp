<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
		<jsp:directive.include file="/views/customer/header.jsp"/>
		
		<div align="center">
		
		<c:if test="${fn:length(books)==0 }">
				<h2>No Results for ${keyword}</h2>
		</c:if>	
		
		<c:if test="${fn:length(books)>0 }">
		
			    <div align="left" style="width:70%; margin: 0 auto;"> 
			    
			    <center><h2> Results for ${keyword} </h2></center>
		     
		        <c:forEach items="${books}" var="book">
		        
		        <div>
		        
		        <div style="display:inline-block; margin: 20px; width:10%" align="left">
		       
		           <div>
		        
		            <a href="view_book?id=${book.bookId}">
		            <img src="../uploads/Core Java.jpg" width="128" height="164" alt="bookImage" />
		            </a>
		            
		            </div>
		        
		        </div>
		        
		       
		        <div style="display:inline-block; margin: 20px; vertical-align:top;width:60%" align="left">
		        <div > 
		       <h2> <a href="view_book?id=${book.bookId}">
		        <b>${book.title}</b>
		        </a>
		        </h2>
		        </div>
		        <div>    <jsp:directive.include file="/views/customer/bookRating.jsp"/></div>
		        <div><i>by ${book.author}</i></div>
		         <div><p>${fn:substring(book.description,0,100)}...</p></div>
		        
		        
		        </div>
		        
		        <div style="display:inline-block; margin: 20px; vertical-align:top;">
		        	
		        	<h3>$${book.price}</h3>
		        	<h3><a href="${pageContext.request.contextPath }/kjabs/addToCart?book_id=${book.bookId}">Add To Cart</a></h3>
		        </div>
		        
		        
		        </div>
		        
		        </c:forEach>
		         	
		         </div> 
			
		</c:if>	
		
		
		
		</div>
		
		<jsp:directive.include file="/views/customer/footer.jsp"/>
		
</body>
</html>