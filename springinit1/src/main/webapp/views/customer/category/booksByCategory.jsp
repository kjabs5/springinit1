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
    <br/>  <br/>
       <h2>${category.name}</h2>
     <br/>  <br/>
     </div>
     <div align="center" style="width:70%; margin: 0 auto;"> 
     
        <c:forEach items="${booksList}" var="book">
        
        <div style="display:inline-block; margin: 20px; float: left;">
       
        
        <div>
            <a href="view_book?id=${book.bookId}">
            <img src="../uploads/${book.file_name }" width="128" height="164" alt="bookImage" />
            </a>
        </div>
        
        <div> 
           <a href="view_book?id=${book.bookId}">
<%--             <b>${book.title}</b> --%>
                <b>${fn:substring(book.title,0,20)}..</b>
           </a>
        </div>
       
       <jsp:directive.include file="/views/customer/bookRating.jsp"/>
     
       
<%--         <div><i>by ${book.author}</i></div> --%>
        <div> <p><b>${fn:substring(book.author,0,20)}..</b></p></div>
         <div><b>$${book.price}</b></div>
        
        
     </div>
        
        </c:forEach>
         	
         </div> 	   
         	
     
     
      
    
     <jsp:directive.include file="/views/customer/footer.jsp"/>
</body>
</html>