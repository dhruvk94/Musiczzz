<%-- 
    Document   : logout
    Created on : 12-May-2015, 17:25:13
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.invalidate();
        %>    
        <h1>You have successfully logged off</h1>
        <a href="index.jsp">Return to home</a>
       
    </body>
</html>
