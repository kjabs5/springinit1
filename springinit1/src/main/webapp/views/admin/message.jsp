<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <div align="center">
   
     <h2>
     
 			The book <i>${book.title}</i> has been added to the order Id :<b> ${OrderDetails.orderId}</b>
		     
     </h2>
     <input type="button" value="Close" onclick="javascript: self.close();" />
   
   </div>
  
</body>
 <script>
   	window.onunload=function()
   	{
   		window.opener.location.reload();
   	}
   </script>
</html>