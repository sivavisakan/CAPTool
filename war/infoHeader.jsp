<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
  <head>
  <link type="text/css" rel="stylesheet" href="./css/bootstrap/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="./css/datepicker.css" />
    <link type="text/css" rel="stylesheet" href="./css/timepicker.css" />
    <link type="text/css" rel="stylesheet" href="./css/custom.css" />
    <script src="./js/jquery.js"></script>
    <script src="./js/bootstrap-timepicker.js"></script>
    <script src="./js/bootstrap-datepicker.js"></script>
    <script src="./js/manipulation.js"></script>
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
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
<div class="container" id="mainContainer">
              <div id="t2">
              <h4 class="expanderHead" id="eh" data-index=0 style="cursor:pointer;">Information
			 <span class="expanderSign"><i class="icon-plus-sign"></i></span>
			  </h4>
			  <div class="expanderContent" id="ec" data-index=0 style="display:none">
              <table>
              <tr><td>Language &nbsp</td><td><select name="language" class="language"><option>en-US</option></td></tr>
              <tr><td>Category</td><td><select name="category" class="category"><option>Geo</option><option>Met</option><option>Safety</option><option>Security</option><option>Rescue</option><option>Fire</option><option>Health</option><option>Env</option><option>Transport</option><option>Infra</option><option>CBRNE</option><option>Other</option></td></tr>
              <tr><td>Event</td><td><input class="input-large event" type="text" name="event" /></td></tr>
              <tr><td>Response Type</td><td><select name="responseType" class="responseType" ><option>Shelter</option><option>Evacuate</option><option>Prepare</option><option>Execute</option><option>Avoid</option><option>Monitor</option><option>Assess</option><option>AllClear</option><option>None</option></td></tr>
              <tr><td>Urgency</td><td><select name="urgency" class="urgency"><option>Immediate</option><option>Expected</option><option>Future</option><option>Past</option><option>Unknown</option></td></tr>
              <tr><td>Severity</td><td><select name="severity" class="severity"><option>Extreme</option><option>Sever</option><option>Moderate</option><option>Minor</option><option>Unknown</option></td></tr>
              <tr><td>Certainty</td><td><select name="certainty" class="certainty"><option>Observed</option><option>Likely(p > ~50%)</option><option>Possible(p <= ~50%)</option><option>Unlikely</option><option>Unknown</option></td></tr>
              <tr><td>Event Code</td><td><input class="input-large eventCode" type="text" name="eventCode"/></td></tr>
		      
              <tr><td>Sender Name</td><td><input class="input-large senderName" type="text" name="senderName"/></td></tr>
              <tr><td>Headline</td><td><input class="input-large headline" type="text" name="headline"/></td></tr>
              <tr><td>Description</td><td><input class="input-large description" type="text" name="description"/></td></tr>
              <tr><td>Instruction</td><td><input class="input-large instruction" type="text" name="instruction"/></td></tr>
              <tr><td>Web</td><td><input class="input-large web" type="text" name="web"/></td></tr>
              <tr><td>Contact</td><td><input class="input-large contact" type="text" name="contact"/></td></tr>
              </table>
               <div id="resourceList">
               <input class="input-large" type="hidden" name="count" id="count" value="1"/>
		<div id="resource" class="resourceEntry">
			<h4 class="resourceExpanderHead" id="reh" data-index=0 style="cursor:pointer;">
			Resource <span class="expanderSign"><i class="icon-plus-sign"></i></span>
			</h4>
			<div class="resourceExpanderContent" id="rec" data-index=0 style="display:none">
				<table>
					<tr><td>Resource Description &nbsp</td><td><input class="input-large" type="text" name="resource"/></td></tr>
					<tr><td>URI &nbsp</td><td><input class="input-large" type="text" name="uri"/></td></tr>
				</table>
			</div>
		</div>
	   </div>
	   <button data-index=0 class="btn btn-info btn-small arb" type="button">Add another Resource block</button>
              
              
              </div>
              </div>
              <br/>