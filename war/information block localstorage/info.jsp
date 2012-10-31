<%@include file="infoHeader.jsp" %>
<ol id="noStep" class="selected-step-2">
	<li id="step" class="step-1">Alert Message</li>
	<li id="step" class="step-2">Information </li>
	<li id="step" class="step-3">Resource</li>
	<li id="step" class="step-4">Finish</li>
</ol>
<form name="infoForm" id="infoForm" action="/sign" method="post">
<div id="listInfo">
 <div id="t1">
	<h4 class="expanderHead" id="eh0" data-index=0 style="cursor:pointer;">
	Information <script></script> <span class="expanderSign">+</span>
	</h4>
 	<div class="expanderContent" id="ec0" data-index=0 style="display:none">
	   <table>
	   <tr><td>Language &nbsp</td><td><select name="language"  class="language"><option>en-US</option></td></tr>
	   <tr><td>Category</td><td><select name="category" class="category"><option>Geo</option><option>Met</option><option>Safety</option><option>Security</option><option>Rescue</option><option>Fire</option><option>Health</option><option>Env</option><option>Transport</option><option>Infra</option><option>CBRNE</option><option>Other</option></td></tr>
	   <tr><td>Event</td><td><input class="input-large event" type="text" name="event" /></td></tr>
	   <tr><td>Response Type</td><td><select name="responseType" class="responseType"><option>Shelter</option><option>Evacuate</option><option>Prepare</option><option>Execute</option><option>Avoid</option><option>Monitor</option><option>Assess</option><option>AllClear</option><option>None</option></td></tr> 
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
  	</div>
 </div>
</div>
<button onclick="addBlock();return false;" class="btn btn-info btn-small" type="button">+ Information</button> <br/>
<table><tr><td align="left"><button type="submit" class="btn btn-primary btn-small" name="backAlert2">Back</button></td><td align="right"><button type="submit" class="btn btn-primary btn-small" name="nextAlert2">Next</button></td></tr></table>
</form>
</div> <!-- Main Containers Div End -->
<%@include file="footer.jsp" %>