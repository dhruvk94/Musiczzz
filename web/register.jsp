<%-- 
    Document   : register
    Created on : 21-Apr-2015, 16:58:49
    Author     : user
--%>

<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.util.JSON"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.Mongo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
 
    <link href="./index_files/bootstrap.css" rel="stylesheet" type="text/css">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="./index_files/jquery.min.js"></script>
     <!-- Custom Theme files -->
    <link href="./index_files/style.css" rel="stylesheet" type="text/css">
       <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>


        <div class="header top-header">
        <div class="container">
            
                <div class="logo">
                    <img src="images/logo.png" title="musicz" />
                </div>
               
               
            <!-- header -->
        </div>
    </div>
<div class="content">
                <!-- 404 -->
                <div class="container">
                    <div class="span3 well">
      <legend> Sign up!</legend>
    <form accept-charset="UTF-8" action="ActionServlet" method="post">
        <input class="form-control input-lg" name="name" placeholder=" Name" type="text"> <br>
        <input class="form-control input-lg" name="uname" placeholder="Username" type="text"><br>
        <input class="form-control input-lg" name="pwd" placeholder="Password" type="password"> <br>
        <input class="form-control input-lg" name="phn" placeholder="Contact" type="tel"/><br>
    
     
     Choose your favourite artists<br>
<% 
    
DBCollection collection=null; 
 Mongo mongo=null;    
  DB db=null;

    mongo = new Mongo("localhost", 27017);
            db = mongo.getDB("test");

collection = db.getCollection("test_metadata");
String s1="{'artist_name':{'$exists':'true'}}";
String s2="{'artist_name':1}";
 DBObject dbObject1 = (DBObject) JSON.parse(s1);
 DBObject dbObject2 = (DBObject) JSON.parse(s2);
        DBCursor cursor=collection.find(dbObject1,dbObject2);
        int q=0;
        while(cursor.hasNext())
        {
            DBObject z=(DBObject) cursor.next().get("artist_name");
            //System.out.println(z);
            String artist_name=(String)z.get("0");
          //  out.println(artist_name);
  %>   
  
 
  <script>
      
  </script>
   
 <div class="row" style="float:left">
  <div class ="col-md-9">
    <div class="thumbnail" style="height:150px ;width:150px">
      <img src="images/slide3.jpg" alt="images/slide1.jpg">
      <div class="caption" align="center">
          <b><%=artist_name%></b>
        <div align="center">
            <input type="checkbox"  multiple   name="artists" value="<%=artist_name%>"></div>
      </div>
    </div>
  </div>
 </div>
 
    

   
<%
            q++;
            if(q==7)
                break;
        }
%>

<div align="center">
        <input type="hidden" name="action" value="REGISTER"/>
        <input class="btn btn-primary" type="submit" value="Register"/>
        <!-- Squared TWO -->
</div>

    </form>
                    </div>
</div>
</div>
</body>
</html>
