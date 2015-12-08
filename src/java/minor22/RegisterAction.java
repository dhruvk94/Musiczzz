/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package minor22;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.util.JSON;
import java.io.Serializable;
import java.net.UnknownHostException;
import org.json.*;
/**
 *
 * @author user
 */
class RegisterAction implements Serializable{
    private static Object p;
  

    static void register(String name, String uname, String pwd, String phn, String[] artists) throws UnknownHostException, JSONException {
     
    DB db=Connection.getMongoConnection();
        DBCollection collection=db.getCollection("users");
 //           JSONObject jsonObj = new JSONObject("{\"phonetype\":"+uname+",\"cat\":\"WP\"}");
/*p=JSON.parse(uname);
        DBObject dbo=(DBObject)JSON.parse("{\"uname\":"+(String)p+"}");
  */     
        
//JSONArray myJSONArray = new JSONArray(artists);
//System.out.println(myJSONArray);        
String ar=artists.toString();
	BasicDBObject documentDetail = new BasicDBObject();
	documentDetail.put("name", name);
	documentDetail.put("uname", uname);
	documentDetail.put("pwd", pwd);
	documentDetail.put("uID", phn);
	documentDetail.put("favt_artists",artists );
	
	//document.put("detail", documentDetail); 
        // JSON.parse("{'uname':"+uname+"}");
        //"pwd":pwd,"name":name,"location":location,"artists":artists});
        collection.insert(documentDetail);
    }
}
