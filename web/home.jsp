<%-- 
    Document   : loginaction
    Created on : 05-Apr-2015, 14:37:12
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.util.JSON"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="java.net.ConnectException"%>
<%@page import="com.echonest.api.v4.EchoNestAPI"%>
<%@page import="com.echonest.api.v4.Artist"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="minor22.Traverse"%>
<%@page import="com.echonest.api.v4.ArtistCatalog" %>
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
    <body  >
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
      <div class="container" >
          
          <br><br><br><b><hr></b>  <%@include  file="local_recommend.jsp"%> </div><hr>
        
    
 
  
    
        
          <div class="banner">    
           <div style="margin-left: 500px"><h1>Recommended Artists</h1></div><br>
        
        <%
            if(session==null)
                session=request.getSession();
            String selected_artists[]=(String[])session.getAttribute("favt_artists");
           System.out.println(selected_artists[0]+" "+selected_artists[1]);
            List rec_artists=minor22.Artist_recommend.recommend2(selected_artists);
            for(int i=0;i<rec_artists.size();i++)
            {
                //System.out.println((String)rec_artists.get(i));
                
                   /*   out.println( " <div class=\"card small\"style=\"width:150px;float:left; height:150px; margin:20px;\">\n>\n" +
"           <div class=\"card-image waves-effect waves-block waves-light\">\n" +
"           <img class=\"activator\" src=\"images/slide1.jpg\">\n" +
"           </div>\n" +
"           <div class=\"card-content\">\n" +
"          <span class=\"card-title activator grey-text text-darken-4\">"+(String)rec_artists.get(i)+" <i class=\"mdi-navigation-more-vert right\"></i></span>\n" +
"          <p><a href=\"display_artist_songs.jsp?artist="+(String)rec_artists.get(i)+"\">"+ (String)rec_artists.get(i)+"</a><br>" +
"           </div>\n" +"           </div>\n");*/
  out.println(
        "          <div class=\"card #b2ebf2 cyan lighten-4\"style=\"width:400px; height:150px;float:left; margin:20px;\">\n" +
"            <div class=\"card-content white-text\">\n" +
"              <span class=\"card-title\"><a href=\"display_artist_songs.jsp?artist="+(String)rec_artists.get(i)+"\"><i class=\"small mdi-av-my-library-music\"></i>"+(String)rec_artists.get(i)+"</a><br>"+"</span>\n" +
             

"            </div>\n" +
           
"          </div>\n" );
               
            }
            
            %>
           
            <div style="float:left;margin-right:600px;margin-left: 500px;"><h1>Trending songs</h1></div>
        <%
            DB db=minor22.Connection.getMongoConnection2();
            DBCollection collection_trend=db.getCollection("trending_songs");
            DBObject dbo_trend=(DBObject)JSON.parse("{'count':-1}");
            DBCursor c=collection_trend.find().sort(dbo_trend);
           int q=0;
            if(c.hasNext())
            {
                while(c.hasNext())
                {
                    DBObject c1=c.next();
                     
                    out.println(
        "          <div class=\"card #c5cae9 indigo lighten-4\"style=\"width:400px; height:150px;float:left; margin:20px;\">" +
"            <div class=\"card-content white-text\">\n" +
"              <span class=\"card-title\"><a href=\"play_song.jsp?name="+c1.get("song")+"\">"+"<i class=\"small mdi-av-video-collection\"></i>#"+c1.get("song")+"<br>"+"</a></span>\n" +

"            </div>\n" +
           
"          </div>\n" );
                   // out.println("<a href=\"play_song.jsp?name="+c1.get("song")+"\">"+c1.get("song")+"</a><br>");
                    q++;
                    if(q==5)
                        break;
                }
            }
         %>
           <div style="float:left; margin-left:500px;margin-right: 200px;" ><h1 >Song based on history</h1></div>
         <%
           String uname=(String)session.getAttribute("uname");
           DBCollection collection1=db.getCollection("user_history");
           DBCollection collection2=db.getCollection("similiar");
           DBCollection collection3=db.getCollection("data");
           
           DBObject dbo=(DBObject)JSON.parse("{'uname':'"+uname+"'}");
           DBCursor curs=collection1.find(dbo);
           if(curs.hasNext())
           {
               
           DBObject dbo1=(DBObject)JSON.parse("{'uname':'"+uname+"'}");
           DBCursor cursor=collection1.find(dbo1);
//           List li=new ArrayList();
//           while(cursor.hasNext())
//           {
//               String song=(String)cursor.next().get("song");
//               li.add(song);
//           }
           DBObject dbo2=null;
           while(cursor.hasNext())
           dbo2=cursor.next();
           String song=(String)dbo2.get("song");
           DBObject dbo3=(DBObject)JSON.parse("{'title.0':'"+song+"'}");
           DBCursor cursor1=collection3.find();
           DBObject dbo4=cursor1.next();
           String track_id=(String)(((DBObject)dbo4.get("track_id")).get("0"));
         
            DBObject dbo5=(DBObject)JSON.parse("{\"track_id\":\""+track_id+"\"}");
           DBCursor cursor2=collection2.find(dbo5,(DBObject)JSON.parse("{'similar_songs':0,'track_id':0,'_id':0}"));
 
           List similiar= (List) cursor2.next().get("similiar_songs");
           //String songs[]=similiar.split("[a-z]\",");
     for(int i=0;i<similiar.size();i++)
     {
         
             DBObject dbo6=(DBObject)JSON.parse("{\"track_id.0\":\""+similiar.get(i)+"\"}");
             DBCursor cursor3=collection3.find(dbo6);
             DBObject cn=cursor3.next();
             DBObject name=(DBObject) cn.get("title");
             String rec_name=(String) name.get("0");
             DBObject duration=(DBObject) cn.get("duration");
             Double rec_duration=(Double)duration.get("0");
             DBObject artist_name=(DBObject) cn.get("artist_name");
             String rec_artist_name=(String)artist_name.get("0");
            // response.setHeader("song", rec_name);
           /*   out.println("   <div class=\"card small\"style=\"width:200px; height:300px;float:left; margin:20px;\">\n>\n" +
"           <div class=\"card-image waves-effect waves-block waves-light\">\n" +
"           <img class=\"activator\" src=\"images/slide1.jpg\">\n" +
"           </div>\n" +
"           <div class=\"card-content\">\n" +
"          <span class=\"card-title activator grey-text text-darken-4\">"+rec_name+" <i class=\"mdi-navigation-more-vert right\"></i></span>\n" +
"          <p><a href=\"play_song.jsp?name="+rec_name+"\">"+rec_name+"</a>&nbsp;duration:"+rec_duration+"&nbsp;Artist:&nbsp;"+rec_artist_name+ "<br></p>" +
"           </div>\n" +

"           </div>");*/
                                    out.println(
        "          <div class=\"card #90caf9 blue lighten-3\"style=\"width:400px; height:250px;float:left; margin:20px;\">\n" +
"            <div class=\"card-content white-text\">\n" +
"              <span class=\"card-title\"><a href=\"play_song.jsp?name="+rec_name+"\">"+rec_name+"</a><br>"+"</span>\n </div>" +"<div class=\"card-content white-text\"><p>"+"&nbsp;<i class=\"small mdi-av-play-circle-outline\"></i><b>Duration:</b>"+rec_duration+"<br>&nbsp;<i class=\"small mdi-av-my-library-music\"></i><b>Artist</b>:&nbsp;<a href=\"display_artist_songs.jsp?artist="+rec_artist_name+"\">"+rec_artist_name+ "</a><br></p>" +"<br>"+"</p>" +

"            </div>\n" +
           
"          </div>\n" );
                
            // out.println("<a href=\"play_song.jsp?name="+rec_name+"\">"+rec_name+"</a>&nbsp;duration:"+rec_duration+"&nbsp;Artist:&nbsp;"+rec_artist_name+ "<br>");
             }
      
           
           }
         %>
         <hr>
    </div>
         <hr>
         <br>
     <div id="footer">
    <div class="container">
        <div class="row">
            
            <br>
              <div class="col-md-4">
                <center>
                  <img src="./images/dk.jpg" class="img-circle" alt="the-brains">
                  <br>
                  <h4 class="footertext">Programmer</h4>
                  <p class="footertext">You can thank all the crazy programming here to this guy.<br>
                </center>
              </div>
              <div class="col-md-4">
                <center>
                  <img src="./images/amit.jpg" class="img-circle" alt="...">
                  <br>
                  <h4 class="footertext">Android App developer</h4>
                  <p class="footertext">This Coder Ninja an android app for this Music Recommendation Engine<br>
                </center>
              </div>
              <div class="col-md-4">
                <center>
                  <img src="./images/shubhanshu.jpg" class="img-circle" alt="...">
                  <br>
                  <h4 class="footertext">Designer</h4>
                  <p class="footertext">This pretty site and programming it holds are all thanks to this guy.<br>
                </center>
              </div>
            </div>
            <div class="row">
            <p><center><a href="#">Contact Stuff Here</a> <p class="footertext">Copyright 2015</p></center></p>
        </div>
    </div>
</div>
          
    </body>
</html>
