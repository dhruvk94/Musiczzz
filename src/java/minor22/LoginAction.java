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
import java.io.File;
import java.net.UnknownHostException;

/**
 *
 * @author user
 */
public class LoginAction {
    public static void main(String args[])
    {
    
   final File folder = new File("C:\\Users\\user\\Desktop");
listFilesForFolder(folder);
  
}
    
public static void listFilesForFolder(final File folder) {
        for (final File fileEntry : folder.listFiles()) {
        if (fileEntry.isDirectory()) {
            listFilesForFolder(fileEntry);
        } else {
            if(fileEntry.getName().contains("mp3"))
            {
                System.out.println(fileEntry.getName());
            }
        }
        
    }
   
}

public static boolean verify(String uname,String pwd) throws UnknownHostException
{
    DB db=Connection.getMongoConnection();
    DBCollection collection=db.getCollection("users");
    
    DBObject dbObject1 = (DBObject) JSON.parse("{'uname':'"+uname+"','pwd':'"+pwd+"'}");
    DBObject dbObject2 = (DBObject) JSON.parse("{'uname':1,'pwd':1}");
		
    DBCursor cursorDoc   = collection.find(dbObject1,dbObject2);
System.out.println("Verify func called");
    if(cursorDoc.hasNext())
                {
                    System.out.println(cursorDoc.next());
                    System.out.println("\ntrue true");
                    return true;
                
                }else
                {        System.out.println("\nfalse false");
                
                    return false;
                }
}
}
