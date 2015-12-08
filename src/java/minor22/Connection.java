/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package minor22;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;
import java.net.UnknownHostException;

/**
 *
 * @author user
 */
public class Connection {
        
    public static DB getMongoConnection() throws UnknownHostException
            {
                 Mongo mongo = new Mongo("localhost", 27017);
		DB db = mongo.getDB("minor2");
		return db;	
                }
    
    public static DB getMongoConnection2() throws UnknownHostException
            {
                 Mongo mongo = new Mongo("localhost", 27017);
		DB db = mongo.getDB("minordata");
		return db;	
                }
    
    
}
