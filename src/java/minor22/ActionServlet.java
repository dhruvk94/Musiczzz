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
import java.net.UnknownHostException;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author user
 */
public class ActionServlet extends HttpServlet {
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnknownHostException {
        String action=request.getParameter("action");
        PrintWriter out=response.getWriter();
        out.println("action:"+action);
        RequestDispatcher rd1=request.getRequestDispatcher("home.jsp");
        RequestDispatcher rd2=request.getRequestDispatcher("Global_recommendAction");
        RequestDispatcher rd3=request.getRequestDispatcher("Local_recommendationAction");
        
        if(action.equals("LOGIN"))
        {
            System.out.println("LOGIN");
            
        String uname=request.getParameter("uname");
        String pwd=request.getParameter("pwd");
        out.println("test1");
         if(LoginAction.verify(uname,pwd)==true)
         {
             DB db=Connection.getMongoConnection();
             DBCollection collection=db.getCollection("users");
             DBObject dbo=(DBObject)JSON.parse("{'uname':'"+uname+"'}");
             DBCursor cursor=collection.find(dbo);
             DBObject c=cursor.next();
             String phn=(String)c.get("uID");
        List favt_artists1=(List)c.get("favt_artists");
        out.println(favt_artists1);
        String q=(String) favt_artists1.get(0);
        out.println(q);
        String [] favt_artists=new String[10];
        for(int i=0;i<favt_artists1.size();i++)
            favt_artists[i]=(String) favt_artists1.get(i);
        out.println("if");
             System.out.println("test2");
            HttpSession session=request.getSession();
            session.setAttribute("uname", uname);
            session.setAttribute("mob",phn );
            session.setAttribute("favt_artists", favt_artists);
            rd1.forward(request, response);
         
         }
         else
         {   out.println("else");
          //   response.sendError(101,"Invalid username or password.Try again!");
            response.sendRedirect("index.jsp?\"msg\"=\"Invalid username or pwd\"");
         } 
        } 
        else if(action.equals("REGISTER"))
                {
            try {
                           
                   String name=request.getParameter("name");
                   String uname=request.getParameter("uname");
                   String pwd=request.getParameter("pwd");
                   String location=request.getParameter("phn");
                   String[] artists=request.getParameterValues("artists");
                   System.out.println(artists);
                   RegisterAction.register(name,uname,pwd,location,artists);
                   response.sendRedirect("register_complete.jsp");
            } catch (Exception ex) {
                Logger.getLogger(ActionServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
                    }
        else if(action.equals("RECOMMEND"))
        {
             rd2.forward(request, response);
        }
        else if(action.equals("RECOMMEND_LOCAL"))
        {
            rd3.forward(request, response);
        }
      
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
 
}
