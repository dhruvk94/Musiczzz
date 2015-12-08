<%-- 
    Document   : List
    Created on : 21-Apr-2015, 19:14:19
    Author     : user
--%>

<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.util.JSON"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
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
               Mongo mongo = new Mongo("localhost", 27017);
               DB db = mongo.getDB("minordata");
               DBCollection collection=db.getCollection("song_analysis");
               //  DBObject dbo1=(DBObject)JSON.parse("{ $exists: true}");
               //DBObject dbo1=(DBObject)JSON.parse("{ $exists: true}");
               BasicDBObject dbo1 = new BasicDBObject();
               BasicDBObject dbo2 = new BasicDBObject();
                
               BasicDBObject dbo3 = new BasicDBObject("energy",new BasicDBObject("$exists", true));
               BasicDBObject dbo4 = new BasicDBObject("energy.1",1);
               dbo4.put("_id", 0);
               DBCursor result =collection.find(dbo3,dbo4);
               out.println("size: "+result.size());
 while(result.hasNext())
 {
     out.println(result.next());
 }
 /*  
  * dbo1.put("$exists",true);
	dbo2.put("artist_name",dbo1);
	out.println(dbo2);
        out.println("test1");
        DBCursor z=collection.find();       ;
        // Basic
                DBCursor c= collection.find(dbo2);
                while(c.hasNext())
                {
                 out.print("a1aq");
                 out.println(c.next());
                }
     DBObject query = new BasicDBObject("otherInfo.text", new BasicDBObject("$exists", true));
    DBCursor result = collection.find(query);
    System.out.println(result.size());
*/
                %>
    </body>
</html>
