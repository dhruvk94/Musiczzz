/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package minor22;

import com.echonest.api.v4.Artist;
import com.echonest.api.v4.EchoNestAPI;
import com.echonest.api.v4.EchoNestException;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.util.JSON;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author user
 */
public class Artist_recommend {
   
  public static List recommend(/*String location,*/String[] artists) throws UnknownHostException, EchoNestException
  {
//      DB db=Connection.getMongoConnection2();
//      DBCollection collection=db.getCollection("data");
//      DBObject dbo1=(DBObject)JSON.parse("{'artist_location';'"+location+"'}");
//      DBCursor cursor1=collection.find(dbo1);
//      while(cursor1.hasNext())
//          List.add(cursor1.next().get("artist_name"));         EchoNestAPI echoNest = new EchoNestAPI(API_KEY);
      List<String> l=new ArrayList<String>();   
      String API_KEY="JUOWXQDOIOXAEDIZS";
      EchoNestAPI echoNestAPI=new EchoNestAPI(API_KEY);
      for(String artist:artists)
{
      List<Artist> artist_names = echoNestAPI.searchArtists(artist);

                if (artist_names.size() > 0) {
                        Artist ar = artist_names.get(0);
                        for (Artist simArtist : ar.getSimilar(5)) {
                            l.add(simArtist.getName());
                            
                        }
                   
                }
                     if(l.size()>=10)
                            break;
}
  return l;
  }
  
  public static List recommend2(String[] artists) throws UnknownHostException 
  {
      List<String> l=new ArrayList<String>();   
      DB db=minor22.Connection.getMongoConnection2();
      DBCollection collection=db.getCollection("data");
      DBCollection collection2=db.getCollection("similiar");
      for(int p=0;p<artists.length;p++)
      {
      DBObject dbo=(DBObject)JSON.parse("{'artist_name.0':'"+artists[p]+"'}");
      DBCursor cursor=collection.find(dbo);
      while(cursor.hasNext())
      {
         String track_id=(String)((DBObject)cursor.next().get("track_id")).get("0");
         DBObject dbo1=(DBObject)JSON.parse("{'track_id':'"+track_id+"'}");
         DBCursor cursor2= collection2.find(dbo1);
         List similiar=(List)((DBObject)cursor2.next().get("similiar_songs"));
         DBObject dbo2=(DBObject)JSON.parse("{'track_id.0':'"+(String)similiar.get(0)+"'}");
            DBCursor curs =collection.find(dbo2);
                l.add((String)((DBObject)curs.next().get("artist_name")).get("0"));
           System.out.println("hahahaha"); 
         
      }
      
      }
      return l;
   }
  
}
