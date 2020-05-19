<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%
  response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

  response.setHeader("Pragma","no-cache");
  
  response.setHeader("Expires","0");

%>
	<div align="center">
       <a href="${pageContext.request.contextPath }/kjabs/home">
       <img src="../images/Bookstorelogo.png" />
       </a>
    </div>
    <div align="center">
		<form action="search" method="get">   
    	<input type="text" name="keyword" size="50" placeholder="Search by title"/>
    	<input type="submit" value="Search"/>
    	&nbsp;    &nbsp;	    &nbsp;	    &nbsp;	
    	
    	<c:if test="${LoggedCustomer==null }">
    	  <a href="${pageContext.request.contextPath }/kjabs/CustomerLogin_Form">sign In</a>|
    	  <a href="${pageContext.request.contextPath }/kjabs/register">Register</a>|
    	</c:if>	
    	
    	<c:if test="${LoggedCustomer!=null }">
    	
    		<a href="${pageContext.request.contextPath }/kjabs/profile">Welcome,${LoggedCustomer.fullname}</a> |
    		<a href="${pageContext.request.contextPath }/kjabs/Orders">My Orders</a>|
    		<a href="${pageContext.request.contextPath }/kjabs/logout">Logout</a>|
    	
    	</c:if>
    		
    	
    	
    	<a href="${pageContext.request.contextPath }/kjabs/cart">Cart</a>
		</form> 
    </div>
    
    <div>
		&nbsp;    
    </div>
    
    
    <div align="center">
    	
    	<c:forEach var="category" items="${categories}" varStatus="status">
    	 <a href="view_category?id=${category.id}">
    	   <font size="+1" ><b><c:out value="${category.name}"/></b> </font>
    	 </a>
    	 <c:if test="${not status.last }">
    	   &nbsp; | &nbsp;
    	 </c:if>
    	</c:forEach>
    
    </div>
    
    
    
</body>
</html>