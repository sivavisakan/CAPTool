<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap/css/bootstrap.css" />
    <script src="/scripts/jquery.js"></script>
  </head>

  <body>
   <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">CAP Tool</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Contact</a></li>
              <li><a href="map.jsp">Map</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    <div class="container" id="mainContainer">
    <form method="post" action="/sign">
              <br/><br/><br/>
              <table id="signGroup">
              <div >
              <tr><td>Email</td> <td><input name="email" id="email" class="span2" type="text" placeholder="Email"></td></tr>
              <tr><td>Password</td> <td> <input name="password" id="password"  class="span2" type="password" placeholder="Password"></td></tr>
              <tr id="signinRow"><td><button type="submit" id="signin" class="btn" name="signin">Sign in</button></td><td>&emsp;<a href="/signup.jsp">Sign up!</a><br/></td></tr>
              </div>
              </table>
    </form>
	 <div id="error">
	 <%	 String error = (String) request.getAttribute("error");
	 	 if(error != null) { %>
	 <%= error %>
	 <%  } %>
	 </div>              
	 </div>
  </body>
</html>
