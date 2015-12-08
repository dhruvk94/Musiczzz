
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.util.JSON;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.UnknownHostException;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author user
 */
public class tester {
public static DBCollection collection=null; 
public static Mongo mongo=null;    
public static DB db=null;
public static String s1=null;
public static StringBuffer sb=null;
/**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws UnknownHostException, FileNotFoundException, IOException {
        // TODO code application logic here
   final File folder = new File("D:\\HDFtoJSON");
  mongo = new Mongo("localhost", 27017);
db = mongo.getDB("minordata");
collection = db.getCollection("test_metadata");

            BufferedReader br1=new BufferedReader(new FileReader("D:/HDFtoJSON/TRAAAAW128F429D538/analysis"));
            BufferedReader br2=new BufferedReader(new FileReader("D:/HDFtoJSON/TRAAAAW128F429D538/metadata"));
      s1=br1.readLine();
   //   System.out.println(s1);   
                 
                 DBObject dbObject = (DBObject) JSON.parse(s1);
 
                s1=null;
                
                 s1=br2.readLine();
                 DBObject dbObject2 = (DBObject) JSON.parse(s1);
 
                 dbObject.putAll(dbObject2);
                 System.out.println("final:"+dbObject);
    }
}
