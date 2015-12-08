<%-- 
    Document   : index
    Created on : 05-Apr-2015, 14:22:10
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="./index_files/bootstrap.css" rel="stylesheet" type="text/css">
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="./index_files/jquery.min.js"></script>
         <!-- Custom Theme files -->
        <link href="./index_files/style.css" rel="stylesheet" type="text/css">
         <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        
      
        <link href="./index_files/css" rel="stylesheet" type="text/css">
       
        </head>
      
        <title>JSP Page</title>
     </head>
    <body>

<div class="header">
        
            
                <div class="logo" >
                    <img src="./index_files/logo.png" title="musicz"></a>
                </div>

            
                </div>
    
 
    <div class="container">
        
    <%
    //String s=request.getQueryString().;
    
    %>
    <%@include  file="global_recommend.jsp"%> 

       <form action="ActionServlet" method="post" class="navbar-form navbar-right">
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    <input type="text" name="uname" placeholder="Username" class="form-control input-sm"/>
 </div>
  <div class="input-group">
     <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
    <input type="password" name="pwd" placeholder="Password" class="form-control input-sm"/><%--if(!(s.isEmpty())){--%><%--}--%><br>
 </div>
    <a href="register.jsp" ><input type="button" value="Register" class="btn btn-primary" /></a>
    <input type="hidden" name="action" value="LOGIN"/>
    <input type="submit" value="Login" class="btn btn-primary"/>
    </form>


     
    </div>
    <div class="progress">
      <div class="indeterminate"></div>
  </div>

<div class="banner">
    
            <!-- slider -->
                <!--- img-slider --->
                <div class="img-slider">
                        <!----start-slider-script---->
                    <script src="./index_files/responsiveslides.min.js"></script>
                     <script>
                        // You can also use "$(window).load(function() {"
                        $(function () {
                          // Slideshow 4
                          $("#slider4").responsiveSlides({
                            auto: true,
                            pager: true,
                            nav: true,
                            speed: 500,
                            namespace: "callbacks",
                            before: function () {
                              $('.events').append("<li>before event fired.</li>");
                            },
                            after: function () {
                              $('.events').append("<li>after event fired.</li>");
                            }
                          });
                    
                        });
                      </script>
                    <!----//End-slider-script---->
                    <!-- Slideshow 4 -->
                        <div id="top" class="callbacks_container">

                          <ul class="rslides callbacks callbacks1" id="slider4">
                            <li id="callbacks1_s0" class="callbacks1_on" style="display: block; transition: opacity 500ms ease-in-out; -webkit-transition: opacity 500ms ease-in-out; float: left; position: relative; opacity: 1; z-index: 2;">
                              <img class="img-responsive" src="./index_files/slide1.jpg" alt="">
                              <div class="slider-caption">
                                <div class="slider-caption-inner">
                                     <h1>music<span>Z</span></h1>
                                     <p>Music Recommendation  Engine </p>
                                     
                                 </div>
                              </div>
                            </li>
                            <li id="callbacks1_s1" class="" style="display: list-item; transition: opacity 500ms ease-in-out; -webkit-transition: opacity 500ms ease-in-out; float: none; position: absolute; opacity: 0; z-index: 1;">
                              <img src="./index_files/slide3.jpg" alt="">
                               <div class="slider-caption">
                                 <div class="slider-caption-inner">
                                     <h1>music<span>Z</span></h1>
                                     <p> Music Recommendation  Engine</p>
                                     
                                 </div>
                              </div>
                            </li>
                            <li id="callbacks1_s2" class="" style="display: list-item; transition: opacity 500ms ease-in-out; -webkit-transition: opacity 500ms ease-in-out; float: none; position: absolute; opacity: 0; z-index: 1;">
                              <img src="./index_files/slide1.jpg" alt="">
                               <div class="slider-caption">
                               <div class="slider-caption-inner">
                                     <h1>music<span>Z</span></h1>
                                     <p>Music Recommendation  Engine </p>
                                    
                                 </div>
                              </div>
                            </li>
                          </ul><a href="./index_files/index.html" class="callbacks_nav callbacks1_nav prev">Previous</a><a href="./index_files/index.html" class="callbacks_nav callbacks1_nav next">Next</a><ul class="callbacks_tabs callbacks1_tabs"><li class="callbacks1_s1 callbacks_here"><a href="./index_files/index.html" class="callbacks1_s1">1</a></li><li class="callbacks1_s2"><a href="./index_files/index.html" class="callbacks1_s2">2</a></li><li class="callbacks1_s3"><a href="./index_files/index.html" class="callbacks1_s3">3</a></li></ul><a href="./index_files/index.html" class="callbacks_nav callbacks1_nav prev">Previous</a><a href="./index_files/index.html" class="callbacks_nav callbacks1_nav next">Next</a><ul class="callbacks_tabs callbacks1_tabs"><li class="callbacks1_s1 callbacks_here"><a href="./index_files/index.html" class="callbacks1_s1">1</a></li><li class="callbacks1_s2"><a href="./index_files/index.html" class="callbacks1_s2">2</a></li><li class="callbacks1_s3"><a href="./index_files/index.html" class="callbacks1_s3">3</a></li></ul>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                        <!-- slider -->
        </div>


        <!-- banner -->
        <!-- categories -->
        
        <!-- categories -->
        <!-- content -->
        
        <!-- content -->
        <!-- footer -->
         <div class="progress">
      <div class="indeterminate"></div>
  </div>
        <div id="footer">
    <div class="container">
        <div class="row">
            <h3 class="footertext">About Us:</h3>
            <br>
              <div class="col-md-4">
                <center>
                  <img src="./images/dk.jpg" class="img-circle" alt="the-brains">
                  <br>
                  <h4 class="footertext">Programmer</h4>
                  <p class="footertext">You can thank all the crazy programming here to this guy.<br>
                </center>
              </div>
              <div class="col-md-4">
                <center>
                  <img src="./images/amit.jpg" class="img-circle" alt="...">
                  <br>
                  <h4 class="footertext">Android App developer</h4>
                  <p class="footertext">This Coder Ninja an android app for this Music Recommendation Engine<br>
                </center>
              </div>
              <div class="col-md-4">
                <center>
                  <img src="./images/shubhanshu.jpg" class="img-circle" alt="...">
                  <br>
                  <h4 class="footertext">Designer</h4>
                  <p class="footertext">This pretty site and programming it holds are all thanks to this guy.<br>
                </center>
              </div>
            </div>
            <div class="row">
            <p><center><a href="#">Contact Stuff Here</a> <p class="footertext">Copyright 2015</p></center></p>
        </div>
    </div>
</div>
    </body>
</html>
