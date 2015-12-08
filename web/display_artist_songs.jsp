<%-- 
    Document   : display_artist_songs
    Created on : 12-May-2015, 17:30:38
    Author     : user
--%>

<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.util.JSON"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="minor22.Connection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.echonest.api.v4.Params"%>
<%@page import="com.echonest.api.v4.ArtistParams"%>
<%@page import="com.echonest.api.v4.EchoNestAPI"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
   
 
    
     <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-widthal-imum-scale=1.0, user-scalable=no"/> 
    
    
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-widthal-imum-scale=1.0, user-scalable=no"/> 
               <script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
	<script src="JS/jquery.autocomplete.js"></script>	
	
    </head>
    <body>
           <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      
         <div class="header">
        
             
                <div class="logo" align="left">
                    <img src="./index_files/logo.png" title="musicz">
                    <span>  Hello <b><%=session.getAttribute("uname")%></b></span>
                </div>
                  <div class="top-nav" align="right">
                    <span class="menu"> </span>
                    <ul>
                        <li class="active" type="button"><a href="index.jsp">Logout<span> </span></a></li>
                    </ul> 
                    
                
                </div>
            
                </div>
                <br> <br><br><hr>
      
<%
    String artist=request.getParameter("artist");
    
    DB db=minor22.Connection.getMongoConnection2();
    DBCollection coll=db.getCollection("data");
    DBObject dbo=(DBObject)JSON.parse("{'artist_name.0':'"+artist+"'}");
    DBCursor cur= coll.find(dbo);
    
    out.println("<br><br><br><br><div class=\"container\" style=\"margin-left=300px\" ><h4>Songs by selected artist</h4></div>\n");   
    while(cur.hasNext()){
        
        String s=(String)((DBObject)cur.next().get("title")).get("0");
        out.println("<div class=\"container\">");
        out.println("   <div align=\"left\">" );
                     out.println("   <ul class=\"collection\">\n" +

"        <li class=\"collection-item\">"+"<a href=\"play_song.jsp?name="+s+"\">"+s+"</a></li>\n" +

"      </ul>");
     out.println("</div>");
     out.println("</div>");
      //  out.println("<a href=\"play_song.jsp?name="+s+"\">"+s+"</a><br>");
    }

%>
    </body>
</html>
