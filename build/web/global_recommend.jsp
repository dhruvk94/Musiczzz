<%-- 
    Document   : global_recommend
    Created on : 24-Apr-2015, 01:47:07
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>musicz Website Template | Home :: w3layouts</title>
        <link href="./index_files/bootstrap.css" rel="stylesheet" type="text/css">
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="./index_files/jquery.min.js"></script>
         <!-- Custom Theme files -->
        <link href="./index_files/style.css" rel="stylesheet" type="text/css">
         <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
 
        <script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
	<script src="JS/jquery.autocomplete.js"></script>	
	
	<script >
	jQuery(function(){
		$("#artist").autocomplete("auto_list.jsp");
	});
   </script>
   
    </head>
    <body>
        
     
        <form action="ActionServlet" class ="navbar-form navbar-left" method="post" role="form" >
            <input type="text" id="artist" name="song" class="form-control input-sm" placeholder="Enter song or artist" />
                <input type="hidden" name="action" value="RECOMMEND"/>
            <input type="submit" value="Recommend" class="btn btn-primary" />
        </form>
        

    </body>
</html>
