<%-- 
    Document   : rate
    Created on : 17-May-2015, 09:48:27
    Author     : user
--%>

<%@page import="com.mongodb.util.JSON"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="minor22.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <link rel="stylesheet" type="text/css" href="css/style.css" />
   
 
    
     <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-widthal-imum-scale=1.0, user-scalable=no"/> 
    
    
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-widthal-imum-scale=1.0, user-scalable=no"/> 
               <script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
	<script src="JS/jquery.autocomplete.js"></script>	
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            int rating =Integer.parseInt(request.getParameter("rating"));
            String song=request.getParameter("song");
            
            out.println("<b>"+song+"</b>");
            String uname=(String)session.getAttribute("uname");
            String mob=(String)session.getAttribute("mob");
            DB db=Connection.getMongoConnection2();
            //DBCollection collection= db.getCollection("rating");
            //DBObject dbo=(DBObject)JSON.parse("{'song':{'"+song+"':'"+rating+"'},'uID':'"+mob+"'}");
            //collection.insert(dbo);
            DBCollection collection1=db.getCollection("user_history");
            DBObject dbo1=(DBObject)JSON.parse("{'uname':'"+uname+"','song':'"+song+"','rating':'"+rating+"'}");
            collection1.insert(dbo1);
        
        %>
        <h3>   Thank you for rating !!!</h3>
        <br>
        <h6>Redirecting to homepage!</h6>
         <div class="progress">
      <div class="indeterminate"></div>
  </div>
        
        
        
           <script>
  setTimeout(function() {
      document.location = "home.jsp";
  }, 2000); // <-- this is the delay in milliseconds
</script>
        </body>
</html>
