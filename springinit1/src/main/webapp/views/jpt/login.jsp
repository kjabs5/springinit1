
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <jsp:directive.include file="header.jsp"/>
    
     <div align="center">
        <form >
<%--         <form:form  action="saveEmployee" modelAttribute="employees" method="POST"> --%>
<%--    <form:hidden path="id"/> --%>
   <br/>  <br/>
      <table>
        <tbody>
       
        
      
        
         <tr>
          <td><label>Email</label></td>
          <td><input type="text" size="10"></td>        
        </tr>
        
           <tr>
          <td><label>Password</label></td>
          <td><input type="password" size="10"></td>        
        </tr>
        
        
        <tr> <td><input type="submit" value="Login"/></td>
        </tr>
        </tbody>
      
      </table>
   </form>
    
    </div>
     <br/> <br/>
    <jsp:directive.include file="footer.jsp"/>
    
    
</body>
</html>