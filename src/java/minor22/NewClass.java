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
 
                   out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">");
           out.println("You have entered <b>song</b> "+song);
           out.println("<br>Your recommendation are:: <br>");
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
             out.println("<a href=\"play_song.jsp?name="+rec_name+"\">"+rec_name+"</a>&nbsp;duration:"+rec_duration+"&nbsp;Artist:&nbsp;"+rec_artist_name+ "<br>");
             }
       }
             else if(a_name.equals(song)){
   try{
       out.println("You have entered artist <b> " +a_name+"</b>");
       out.println("<br>I recommend: <br>");
                 String API_KEY="JUOWXQDOIOXAEDIZS";
      EchoNestAPI echoNestAPI=new EchoNestAPI(API_KEY);
      List<Artist> artist_names = echoNestAPI.searchArtists(a_name);

                if (artist_names.size() > 0) {
                        Artist ar = artist_names.get(0);
                        for (Artist simArtist : ar.getSimilar(5)) {
                            out.println(simArtist.getName()+"<br>");
                        }
                   out.println("   <ul class=\"collection with-header\">\n" +
"        <li class=\"collection-header\"><h4>First Names</h4></li>\n" +
"        <li class=\"collection-item\">Alvin</li>\n" +
"        <li class=\"collection-item\">Alvin</li>\n" +
"        <li class=\"collection-item\">Alvin</li>\n" +
"        <li class=\"collection-item\">Alvin</li>\n" +
"      </ul>");
                }
                out.println("<div class=\"card-content white-text\">\n" +
"              <span class=\"card-title\">name</span>\n" +
"             \n" +
"            </div>");
out.println("div class=\"card blue-grey darken-1\">\n" +
"            <div class=\"card-content white-text\">\n" +
"              <span class=\"card-title\">Card Title</span>\n" +
"              <p>I am a very simple card. I am good at containing small bits of information.\n" +
"              I am convenient because I require little markup to use effectively.</p>\n" +
"            </div>\n" +
"            <div class=\"card-action\">\n" +
"              <a href=\"#\">This is a link</a>\n" +
"              <a href='#'>This is a link</a>\n" +
"            </div>\n" +
"          </div>");
   }catch(Exception e)
   {
       e.printStackTrace();
   }
             }
   out.println("  <div align=\"center\">\n" +
"        <form action=\"rate.jsp\" >\n" +
"          <input  type=\"radio\" name=\"rating\" value=\"1\" class=\"star\">\n" +
"            <input type=\"radio\" name=\"rating\" value=\"2\" class=\"star\">\n" +
"            <input type=\"radio\" name=\"rating\" value=\"3\" class=\"star\">\n" +
"            <input type=\"radio\" name=\"rating\" value=\"4\" class=\"star\">\n" +
"            <input type=\"radio\" name=\"rating\" value=\"5\" class=\"star\">\n" +
"            \n" +
"            <input type=\"hidden\" name=\"song\" value=\"<%=name%>\" >\n" +
"            <input type=\"submit\" value=\"Rate\">\n" +
"        </form>\n" +
"        </div>");
    }
    out.println("background-image: url(\"././images/image.png\")");

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
