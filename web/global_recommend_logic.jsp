<%-- 
    Document   : global_recommend_logic
    Created on : 24-Apr-2015, 01:57:27
    Author     : user
--%>


<%@page import="com.mongodb.DB"%>

<%@page import="com.mongodb.Collection"%>
<%@page import="minor22.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            DB db=Connection.getMongoConnection();
            Collection
            request.getParameter("song");
            
        %>
    </body>
</html>
