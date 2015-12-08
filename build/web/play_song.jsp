<%-- 
    Document   : play_song
    Created on : 10-May-2015, 14:42:44
    Author     : user
--%>
<%@page import="java.util.List"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.util.JSON"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <title>Star rating demo</title>
        <link rel="stylesheet" href="css/jquery.rating.css">
        <script src="JS/jquery.js"></script>
        <script src="JS/jquery.rating.js"></script>
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
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
                   
                    
                
                </div>
        
            
                </div>
                <div class="banner">
      <hr>
                <h5>Rate this Song</h5>
       
<%	
    response.setContentType("text/html");
 String USER_AGENT = "Chrome";
	String name=request.getParameter("name");

        String name2=name.replace(" ","+");
        
        String url = "http://safe-waters-7951.herokuapp.com/crawl/"+name2;
 
    URL obj = new URL(url);
    HttpURLConnection con = (HttpURLConnection) obj.openConnection();
 
    // optional default is GET
    con.setRequestMethod("GET");
 
    //add request header
    con.setRequestProperty("User-Agent", USER_AGENT);
 
    int responseCode = con.getResponseCode();
    System.out.println("\nSending 'GET' request to URL : " + url);
    System.out.println("Response Code : " + responseCode);
 
    BufferedReader in = new BufferedReader(
            new InputStreamReader(con.getInputStream()));
    String inputLine;
    StringBuffer response1 = new StringBuffer();
 
    while ((inputLine = in.readLine()) != null) {
      response1.append(inputLine);
    }
    in.close();
 
    //print result
    System.out.println(response1.toString());
                String str[]=response1.toString().split("=");
                System.out.println(str[1]);
             
                 out.println("<div align=\"center\"><p><h5>"+name+"</h5><br><h7>by</h7></p></div>");
                
                out.println("<br><br><div style=\"float:left; margin-left:250px;margin-right:30px;\"><iframe width=\"420\" height=\"315\" src=\"http://www.youtube.com/embed/"+str[1]+"?autoplay=1\"></iframe></div>");
      

        
       
        //String name1=name.replace(" ","+");
       
       // Document doc = Jsoup.connect("https://www.youtube.com/results?search_query="+name).timeout(0).get();
       // out.println(doc.select("a"));
     //   out.println(doc.select("a"));
//        Elements elem=doc.select("a.yt-uix-tile-link yt-ui-ellipsis yt-ui-ellipsis-2 yt-uix-sessionlink spf-link");
//        
//        for(int i=0;i<elem.size();i++)
//        {
//            out.println("b");
//            out.println(elem.get(i));
//        }
//       Elements newsHeadlines = doc.select("a.yt-uix-tile-link yt-ui-ellipsis yt-ui-ellipsis-2 yt-uix-sessionlink spf-link");
//       out.println(newsHeadlines.first());
//        String html = "<a class=\"sushi-restaurant\" href=\"/greatSushi\">Best Sushi in town</a>";
//    Document doc = Jsoup.parse(html, "http://example.com/");
//    // find all <a class="sushi-restaurant">...
//    Elements links = doc.select("a.sushi-restaurant");
//    Element link = links.first();
//    // 'abs:' makes "/greatsushi" = "http://example.com/greatsushi":
//    String url = link.attr("abs:href");
//    System.out.println("url = " + url);
//       //out.println(newsHeadlines.first());
       //String a=newsHeadlines.first().toString();
       //out.println(Jsoup.parse(a));
//        String url = "https://www.youtube.com/results?search_query="+name;
//    System.out.perintln("name: "+name);
//		URL obj = new URL(url);
//		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
// 
//		// optional default is GET
//		con.setRequestMethod("GET");
// 
//		//add request header
//		con.setRequestProperty("User-Agent", USER_AGENT);
// 
//		int responseCode = con.getResponseCode();
//		System.out.println("\nSending 'GET' request to URL : " + url);
//		System.out.println("Response Code : " + responseCode);
// 
//		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
//		String inputLine;
//		StringBuffer response1 = new StringBuffer();
// 
//		while ((inputLine = in.readLine()) != null) {
//			response1.append(inputLine);
//		}
//		in.close();
// 
//		//print result
//		out.println(response1.toString());
  %> 
 

            
          
          

    <!DOCTYPE html>

        <%
               DB db=minor22.Connection.getMongoConnection2();
                DBCollection collection1=db.getCollection("data");
            DBObject dbo1=(DBObject)JSON.parse("{'title.0':'"+name+"'}");
            DBCursor curs=collection1.find(dbo1);
            String artist=(String)((DBObject)(curs.next().get("artist_name"))).get("0");
          
            out.println("<div class=\"align-center\" style=\"margin-left:400px;margin-right:400px;\">");
           out.println("   <div class=\"card small\">" +
"           <div class=\"card-image waves-effect waves-block waves-light\">\n" +
"           <img class=\"activator\" src=\"images/slide1.jpg\">\n" +
"           </div>\n" +
"           <div class=\"card-content\">\n" +
"          <span class=\"card-title activator grey-text text-darken-4\">"+artist+"</span>\n" +
"           </div>\n" );

         out.println( "</div>\n"+"</div>");

           // out.println(artist);
        %>
        <div style="margin-left: 600px">
        <form action="rate.jsp" >
          <input  type="radio"  name="rating" value="1" class="star">
            <input type="radio" name="rating" value="2" class="star">
            <input type="radio" name="rating" value="3" class="star">
            <input type="radio" name="rating" value="4" class="star">
            <input type="radio" name="rating" value="5" class="star">
            
            <input type="hidden" name="song" value="<%=name%>" >
         
             <button class="btn waves-effect waves-light" type="submit" name="action">Rate
    <i class="mdi-content-send right"></i>
  </button>
        </form>
        </div>
            <h5>You may also like</h5>
        <%
            DBCollection collection2=db.getCollection("similiar");
            String track_id=(String)((DBObject)(collection1.find(dbo1).next().get("track_id"))).get("0");
       
                 
            DBObject dbo5=(DBObject)JSON.parse("{\"track_id\":\""+track_id+"\"}");
           DBCursor cursor2=collection2.find(dbo5,(DBObject)JSON.parse("{'similar_songs':0,'track_id':0,'_id':0}"));
 
           List similiar= (List) cursor2.next().get("similiar_songs");
           //String songs[]=similiar.split("[a-z]\",");
     for(int i=0;i<similiar.size();i++)
     {
         
             DBObject dbo6=(DBObject)JSON.parse("{\"track_id.0\":\""+similiar.get(i)+"\"}");
             DBCursor cursor3=collection1.find(dbo6);
             DBObject cn=cursor3.next();
             DBObject name1=(DBObject) cn.get("title");
             String rec_name=(String) name1.get("0");
             DBObject duration=(DBObject) cn.get("duration");
             Double rec_duration=(Double)duration.get("0");
             DBObject artist_name=(DBObject) cn.get("artist_name");
             String rec_artist_name=(String)artist_name.get("0");
            // response.setHeader("song", rec_name);
 
                                                   out.println(
        "          <div class=\"card #90caf9 blue lighten-3\"style=\"width:400px; height:250px;float:left; margin:20px;\">\n" +
"            <div class=\"card-content white-text\">\n" +
"              <span class=\"card-title\"><a href=\"play_song.jsp?name="+rec_name+"\">"+rec_name+"</a><br>"+"</span>\n </div>" +"<div class=\"card-content white-text\"><p>"+"&nbsp;<i class=\"small mdi-av-play-circle-outline\"></i>duration:   "+"   "+rec_duration+"<br>&nbsp;Artist    :&nbsp;<i class=\"small mdi-av-my-library-music\"></i>"+rec_artist_name+ "<br></p>" +"<br>"+"</p>" +

"            </div>\n" +
           
"          </div>\n" );
           //  out.println("<a href=\"play_song.jsp?name="+rec_name+"\">"+rec_name+"</a>&nbsp;duration:"+rec_duration+"&nbsp;Artist:&nbsp;"+rec_artist_name+ "<br>");
             }    
        %>
                
               
    </div>

    </body>
</html>
