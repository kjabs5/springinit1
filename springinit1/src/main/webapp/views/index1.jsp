<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Evergreen Bookstore Administration</title>
<link href="/css/style.css" rel="stylesheet" > 

<!-- <link rel="stylesheet" href="../src/main/resources/static/css/style.css"> -->
</head>
<body>


		   <jsp:directive.include file="header1.jsp"/>
        <div align="center">
           
           <h2 class="heading">Administration Dashboard</h2>
        
        </div>
        
        <div align="center">
        <hr width="60%"/>
        	 <h2 class="heading"> Quick Action</h2>	
        	 
        	 <a href="#">New Book</a> &nbsp;
             <a href="#">New User</a>&nbsp;
             <a href="#">New Category</a>&nbsp;
             <a href="#">New Customer</a>&nbsp;
        
        </div>
        
         <div align="center">
             <hr width="60%"/>
        	 <h2 class="heading"> Recent Sales:</h2>	
        
        </div>
        	 
          <div align="center">
        	<hr width="60%"/>
        	 <h2 class="heading"> Recent Reviews:</h2>	
        
        </div>
        
          <div align="center">
          <hr width="60%"/>
        	 <h2 class="heading"> Statistics:</h2>	
        
        </div>
		
		<hr width="60%"/>
		 <jsp:directive.include file="footer1.jsp"/>
		
</body>
</html>