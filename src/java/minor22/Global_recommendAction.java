/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package minor22;

import com.echonest.api.v4.Artist;
import com.echonest.api.v4.EchoNestAPI;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.util.JSON;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class Global_recommendAction extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
      PrintWriter out=response.getWriter();
       response.setContentType("text/html");
       String song=request.getParameter("song");
       DB db=Connection.getMongoConnection2();
       DBCollection collection1=db.getCollection("data");
       System.out.println("22 ::: ");
       DBObject dbo3=(DBObject)JSON.parse("{'title.0':\""+song+"\"}");
       DBObject dbo4=(DBObject)JSON.parse("{'artist_name.0':\""+song+"\"}");
    
       System.out.println("11 ::: "+dbo3);
        DBCursor cursor1=collection1.find(dbo3);
        DBObject dbob;
        if(cursor1.hasNext())
         dbob=cursor1.next();
        else
        {
            cursor1=collection1.find(dbo4);
            dbob=cursor1.next();
        }
            
        DBObject a= (DBObject) dbob.get("track_id");
       String choice=(String) a.get("0");
       System.out.println("choice: "+choice);
       String song_title=(String)(((DBObject)(dbob.get("title"))).get("0"));
       String a_name=(String)(((DBObject)(dbob.get("artist_name"))).get("0"));
             if(song_title.equals(song))
       {
        
           DBCollection collection2=db.getCollection("trending_songs");
           DBObject dbo_trend_check=(DBObject)JSON.parse("{'song': '"+song_title+"'}");
           DBCursor cur=collection2.find(dbo_trend_check);
                    if(cur.hasNext())
                    {
                        Long count=(Long)(cur.next().get("count"));
                        count++;
                        DBObject x=(DBObject)JSON.parse("{'song':'"+song_title+"'}");
                        DBObject y=(DBObject)JSON.parse("{ '$set':{'count':" +count+"}}");
                        collection2.update(x,y);
                    }
                    else
                    {
                        DBObject z=(DBObject)JSON.parse("{'song':'"+song_title+"','count':1}");
                        collection2.insert(z);
                    }
             out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("    <link type=\"text/css\" rel=\"stylesheet\" href=\"css/materialize.min.css\"  media=\"screen,projection\"/>\n" +
"\n" +
"      <!--Let browser know website is optimized for mobile-->\n" +
"      <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"/>");
           
            out.println("</head>");
            out.println("<body>");
            out.println("<script type=\"text/javascript\" src=\"https://code.jquery.com/jquery-2.1.1.min.js\"></script>\n" +
  "      <script type=\"text/javascript\" src=\"js/materialize.min.js\"></script>");
            out.println("<div class=\"header\">\n" +
"        \n" +
"            \n" +
"                <div class=\"logo\" >\n" +
"                    <img src=\"./index_files/logo.png\" title=\"musicz\"></a>\n" +
"                </div>\n" +
"\n" +
"            \n" +
"                </div><br><br><hr><br><br>");
            
              out.println("<h5 style=\"background-color:#D8D8D8;\">You have entered <b>song</b></h5> ");
                   out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">");
                   out.println("<div class=\"row\">");
                   
     out.println("   <div class=\"card small\" style=\"width:400px; height:300px; margin-left:450px;\">\n" );            
     out.println("<div class=\"card-image waves-effect waves-block waves-light\">\n" +
"          <img class=\"activator\" src=\"images/slide2.jpg\">\n" +
"        </div>\n" +
"        <div class=\"card-content\">\n" +
"          <span class=\"card-title activator grey-text text-darken-4\">"+song+" <i class=\"mdi-navigation-more-vert right\"></i></span>\n" +

"        </div>\n"+
"      </div>");
         
           out.println("<h5 style=\"background-color:#D8D8D8;\" ><br>Your recommendation are:: <br></h5>");
           DBCollection collection=db.getCollection("similiar");
           DBObject dbo1=(DBObject)JSON.parse("{\"track_id\":\""+choice+"\"}");
 //          DBObject dbo2=(DBObject)JSON.parse("{'similiar':1,'_id':0}");
           System.out.println(dbo1);
           DBCursor cursor=collection.find(dbo1,(DBObject)JSON.parse("{'similar_songs':0,'track_id':0,'_id':0}"));
  //         if(cursor.hasNext()==true)
//          out.println("recommendations::123::   "+cursor.next().get("similiar_songs"));
   
           List similiar= (List) cursor.next().get("similiar_songs");
           //String songs[]=similiar.split("[a-z]\",");
     for(int i=0;i<similiar.size();i++)
     {
         
             DBObject dbo2=(DBObject)JSON.parse("{\"track_id.0\":\""+similiar.get(i)+"\"}");
             DBCursor cursor3=collection1.find(dbo2);
             DBObject c=cursor3.next();
             DBObject name=(DBObject) c.get("title");
             String rec_name=(String) name.get("0");
             DBObject duration=(DBObject) c.get("duration");
             Double rec_duration=(Double)duration.get("0");
             DBObject artist_name=(DBObject) c.get("artist_name");
             String rec_artist_name=(String)artist_name.get("0");
            // response.setHeader("song", rec_name);
            
              out.println("   <div class=\"card\"style=\"width:200px; float:left; height:300px; margin:30px\">\n" +
"           <div class=\"card-image waves-effect waves-block waves-light\">\n" +
"           <img class=\"activator\" src=\"images/slide"+(i+1)+".jpg\">\n" +
"           </div>\n" +
"           <div class=\"card-content\">\n" +
"          <span class=\"card-title activator grey-text text-darken-4\">"+rec_name+" </i></span>\n" +
"          <p>&nbsp;<b>Duration  :</b>"+rec_duration+"<br>&nbsp;<b>Artist :&nbsp;</b>"+rec_artist_name+ "<br></p>" +
"           </div>\n" +
         
"           </div>\n");
        
           //  out.println("<a href=\"youtube.jsp?name="+rec_name+"\">"+rec_name+"</a>&nbsp;duration:"+rec_duration+"&nbsp;Artist:&nbsp;"+rec_artist_name+ "<br>");
             }
  
     
   out.println("</div>"); 
        
            out.println("</body>");
            out.println("</html>");
       }
             else if(a_name.equals(song)){
   try{
        out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("    <link type=\"text/css\" rel=\"stylesheet\" href=\"css/materialize.min.css\"  media=\"screen,projection\"/>\n" +
"\n" +
"      <!--Let browser know website is optimized for mobile-->\n" +
"      <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"/>");
           
            out.println("</head>");
            out.println("<body >");
            out.println("<script type=\"text/javascript\" src=\"https://code.jquery.com/jquery-2.1.1.min.js\"></script>\n" +
  "      <script type=\"text/javascript\" src=\"js/materialize.min.js\"></script>");
            out.println("<div class=\"header\">\n" +
"        \n" +
"            \n" +
"                <div class=\"logo\" >\n" +
"                    <img src=\"./index_files/logo.png\" title=\"musicz\"></a>\n" +
"                </div>\n" +
"\n" +
"            \n" +
"                </div><br><br><hr><br>");
              out.println("<h5 style=\"background-color:#D8D8D8;\">You have entered Artist</h5> ");
                   out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">");
                   out.println("<div class=\"row\">");
                   
     out.println("   <div class=\"card small\" style=\"width:400px; height:300px; margin-left:450px;\">\n" );            
     out.println("<div class=\"card-image waves-effect waves-block waves-light\">\n" +
"          <img class=\"activator\" src=\"images/slide2.jpg\">\n" +
"        </div>\n" +
"        <div class=\"card-content\">\n" +
"          <span class=\"card-title activator grey-text text-darken-4\">"+a_name+" <i class=\"mdi-navigation-more-vert right\"></i></span>\n" +

"        </div>\n"+
"      </div>\n"+"</div>");
       
           //out.println("   <div class=\"card small\" style=\"width:400px; height:300px; margin-left:400px;\">\n" );            
   //  out.println(a_name);
 
       out.println("<h5 style=\"background-color:#D8D8D8 ;\" ><br>I recommend: <br></h5>");
                 String API_KEY="JUOWXQDOIOXAEDIZS";
      EchoNestAPI echoNestAPI=new EchoNestAPI(API_KEY);
      List<Artist> artist_names = echoNestAPI.searchArtists(a_name);

                if (artist_names.size() > 0) {
                        Artist ar = artist_names.get(0);
                        int c=0;
                        for (Artist simArtist : ar.getSimilar(5)) {
                            
                            
            out.println("   <div class=\"card\"style=\"width:200px; float:left; height:250px; margin:30px\">\n" +
"           <div class=\"card-image waves-effect waves-block waves-light\">\n" +
"           <img class=\"activator\" src=\"images/slide"+(c+1)+".jpg\">\n" +
"           </div>\n" +
"           <div class=\"card-content\">\n" +
"          <span class=\"card-title activator grey-text text-darken-4\">"+simArtist.getName()+" <i class=\"mdi-navigation-more-vert right\"></i></span>\n" +

"           </div>\n" +
         
"           </div>\n");
                           // out.println(simArtist.getName()+"<br>");
            c++;
                        }
                   
                        out.println("</body>");
            out.println("</html>");
                }
     
   }catch(Exception e)
   {
       e.printStackTrace();
   }
             }
             
     
   
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
