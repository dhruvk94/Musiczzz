<%-- 
    Document   : auto_list
    Created on : 24-Apr-2015, 01:00:15
    Author     : user
--%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.util.JSON"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.Mongo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

 <% 
	try{      
		 int i=0;
	/*	  Class.forName("com.mysql.jdbc.Driver");
                         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/auto_list","root","123456");
            
  Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("select * from country");
	*/
                
                Mongo mongo = new Mongo("localhost", 27017);
               DB db = mongo.getDB("minordata");

               DBCollection collection = db.getCollection("test_metadata");
                String s1="{'title':{'$exists':'true'}}";
                String s2="{'title':1}";
        DBObject dbObject1 = (DBObject) JSON.parse(s1);
         DBObject dbObject2 = (DBObject) JSON.parse(s2);
        DBCursor cursor=collection.find();
              System.out.println("aadd");
      
        DBCursor cursor1=collection.find();
        List li = new ArrayList();
	List li1= new ArrayList();
        while(cursor.hasNext())
        {        System.out.println("ssaadd");
      
            DBObject z=(DBObject) cursor.next().get("title");
            li.add((String)z.get("0"));
 	}
System.out.println("test1");
        while(cursor1.hasNext())
        {
            
System.out.println("test2");
            DBObject z=(DBObject) cursor1.next().get("artist_name");
            li1.add((String)z.get("0"));
 	}

        
        
            
			
			String[] str = new String[li.size()];			
			Iterator it = li.iterator();
			
			 i = 0;
			while(it.hasNext())
			{
				String p = (String)it.next();	
				str[i] = p;
				i++;
			}
//		
//		
                        String[] str1=new String[li1.size()];
                        Iterator it1=li1.iterator();
                        
                        int f=0;
                        while(it1.hasNext())
                        {
                                String v=(String)it1.next();
                                str1[f]=v;
                                f++;
                        }
//              System.out.println("ssaaddff");
        System.out.println(str);        
                
                
                
                
                
	  /*  	List li = new ArrayList();
	    
			while(rs.next()) 
 			{ 			    
 			    li.add(rs.getString(1));
 			}  
			
			String[] str = new String[li.size()];			
			Iterator it = li.iterator();
			
			int i = 0;
			while(it.hasNext())
			{
				String p = (String)it.next();	
				str[i] = p;
				i++;
			}
	*/	
			//jQuery related start		
                
				String query = (String)request.getParameter("q");
                                                                    

                                out.print(" <input type=\"text\" placeholder=\"SONGS\" />"+"\n");
                                int cnt=1;
				for(int j=0;j<str.length;j++)
				{
					if(str[j].toUpperCase().startsWith(query.toUpperCase()))
					{
						out.print(str[j]+"\n");
						if(cnt>=3)
							break;
						cnt++;
					}
                                        
				}
                                
                                out.print("<input type=\"text\" placeholder=\"ARTISTS\" />"+"\n");
                                 cnt=1;
				for(int j=0;j<str.length;j++)
				{
					if(str1[j].toUpperCase().startsWith(query.toUpperCase()))
					{
						out.print(str1[j]+"\n");
						if(cnt>=3)
							break;
						cnt++;
					}
                                        
				}
//			//jQuery related end	
		
			
 		/*rs.close(); 
 		st.close(); 
		con.close();

*/		    } 
		catch(Exception e){ 
 			e.printStackTrace(); 
 		}

//www.java4s.com
 %>