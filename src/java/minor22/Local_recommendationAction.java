/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package minor22;

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
public class Local_recommendationAction extends HttpServlet {

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
       DBObject dbo3=(DBObject)JSON.parse("{'title.0':\""+song+"\"}");
     
        DBCursor cursor1=collection1.find(dbo3);
        DBObject dbob;
        dbob=cursor1.next();
            
        DBObject a= (DBObject) dbob.get("track_id");
       String choice=(String) a.get("0");
       System.out.println("choice: "+choice);
       String song_title=(String)(((DBObject)(dbob.get("title"))).get("0"));
       String a_name=(String)(((DBObject)(dbob.get("artist_name"))).get("0"));
//TRENDING SONGS START  
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
 //TRENDING SONGS END
           out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">");
           out.println("You have entered <b>song</b> "+song);
           out.println("<br>Your recommendation are:: <br>");
           DBCollection collection=db.getCollection("similiar");
           DBObject dbo1=(DBObject)JSON.parse("{\"track_id\":\""+choice+"\"}");
           DBCursor cursor=collection.find(dbo1,(DBObject)JSON.parse("{'similar_songs':0,'track_id':0,'_id':0}"));
   
           List similiar= (List) cursor.next().get("similiar_songs");
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
}
}