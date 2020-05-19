<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <br/>
        
        <h2>New Books: </h2>
        <div align="center" style="width: 80%; margin: 0 auto;">
            <c:forEach items="${booksList}" var="book">
        
        <div style="display:inline-block; margin: 30px;">
       
        
        <div>
            <a href="view_book?id=${book.bookId}">
            <img src="../uploads/${book.file_name}" width="128" height="164" alt="bookImage" />
            </a>
        </div>
        
        <div> 
           <a href="view_book?id=${book.bookId}">
<%--             <b>${book.title}</b> --%>
            <b>${fn:substring(book.title,0,20)}..</b>
           </a>
        </div>
        <div> <c:forTokens items="${book.ratingStars}" delims="," var="star"> 
          
          <c:if test="${ star eq 'on'}">
          
          <img src="../images/on.png"/>
          
          </c:if>
          
          <c:if test="${ star eq 'off'}">
          
          <img src="../images/off.png"/>
          
          </c:if>
          
          <c:if test="${ star eq 'half'}">
          
          <img src="../images/half.png"/>
          
          </c:if>
        
         </c:forTokens>
        
     
        
        </div>
<%--         <div><i>by ${book.author}</i></div> --%>
         <p><b>${fn:substring(book.author,0,20)}..</b></p>
         <div><b>$${book.price}</b></div>
        
        
     </div>
        
        </c:forEach>
           
        </div>
        
        <div align="center" style="clear:both;">
           
            <h2>Best-Selling Books</h2>
            <div align="center" style="width: 80%; margin: 0 auto;">
            <c:forEach items="${bestSelling}" var="book">
        
        <div style="display:inline-block; margin: 30px;">
       
        
        <div>
            <a href="view_book?id=${book.bookId}">
            <img src="../uploads/${book.file_name}" width="128" height="164" alt="bookImage" />
            </a>
        </div>
        
        <div> 
           <a href="view_book?id=${book.bookId}">
<%--             <b>${book.title}</b> --%>
            <b>${fn:substring(book.title,0,20)}..</b>
           </a>
        </div>
        <div> <c:forTokens items="${book.ratingStars}" delims="," var="star"> 
          
          <c:if test="${ star eq 'on'}">
          
          <img src="../images/on.png"/>
          
          </c:if>
          
          <c:if test="${ star eq 'off'}">
          
          <img src="../images/off.png"/>
          
          </c:if>
          
          <c:if test="${ star eq 'half'}">
          
          <img src="../images/half.png"/>
          
          </c:if>
        
         </c:forTokens>
        
     
        
        </div>

         <p><b>${fn:substring(book.author,0,20)}..</b></p>
         <div><b>$${book.price}</b></div>
        
        
     </div>
        
        </c:forEach>
           
        </div>
        
        </div>
       
       <div align="center" style="clear:both;">
       
           <h2>Most-Favoured Books</h2>
       
       </div>
        
     <br/>  <br/>
    </div>
    
     <jsp:directive.include file="/views/customer/footer.jsp"/>
    
    
</body>
</html>