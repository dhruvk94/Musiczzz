package minor22;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author user
 */
public class Traverse {

   public List<String> songs=new ArrayList<String>() ;
  
   public  List<String> traverse()
   {
       songs.clear();
     final  File folder=new File("D:\\songs_minor");
   listFilesForFolder(folder);
   return songs;
   }
    
    public void listFilesForFolder(final File folder) {
        for (final File fileEntry : folder.listFiles()) {
        if (fileEntry.isDirectory()) {
            listFilesForFolder(fileEntry);
        } else {
         if(fileEntry.getName().contains(".mp3"))
          {   System.out.println("abc");
              System.out.println(fileEntry.getName());
         
            songs.add(fileEntry.getName());
         
          }
        }
        
    }
        
        /*      public void getInfo()
         * {
         * 
         * }
         */ 
}
    
}
