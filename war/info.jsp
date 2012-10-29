<%@include file="header.jsp" %>
<ol id="noStep" class="selected-step-2">
  <li id="step" class="step-1">Alert Message</li>
    <li id="step" class="step-2">Information </li>
    <li id="step" class="step-3">Resource</li>
    <li id="step" class="step-4">Finish</li>
</ol>
              
              <form name="alertForm" action="/sign" method="post">
              <div id="listInfo">
              <div id="t1">
              <h4 class="expanderHead" id="eh0" data-index=0 style="cursor:pointer;">
			Info Block Number <script></script> <span class="expanderSign">+</span>
			</h4>
			  <div class="expanderContent" id="ec0" data-index=0 style="display:none">
              <table>
              <tr><td>Language &nbsp</td><td><select name="language"><option>en-US</option></td></tr>
              <tr><td>Category</td><td><select name="category"><option>Geo</option><option>Met</option><option>Safety</option><option>Security</option><option>Rescue</option><option>Fire</option><option>Health</option><option>Env</option><option>Transport</option><option>Infra</option><option>CBRNE</option><option>Other</option></td></tr>
              <tr><td>Event</td><td><input class="input-large" type="text" name="event"/></td></tr>
              <tr><td>Response Type</td><td><select name="responseType"><option>Shelter</option><option>Evacuate</option><option>Prepare</option><option>Execute</option><option>Avoid</option><option>Monitor</option><option>Assess</option><option>AllClear</option><option>None</option></td></tr>
              <tr><td>Urgency</td><td><select name="urgency"><option>Immediate</option><option>Expected</option><option>Future</option><option>Past</option><option>Unknown</option></td></tr>
              <tr><td>Severity</td><td><select name="severity"><option>Extreme</option><option>Sever</option><option>Moderate</option><option>Minor</option><option>Unknown</option></td></tr>
              <tr><td>Certainty</td><td><select name="urgency"><option>Observed</option><option>Likely(p > ~50%)</option><option>Possible(p <= ~50%)</option><option>Unlikely</option><option>Unknown</option></td></tr>
              <tr><td>Audience</td><td><input class="input-large" type="text" name="audience"/></td></tr>
              <tr><td>Event Code</td><td><input class="input-large" type="text" name="eventCode"/></td></tr>
              <tr><td>Effective</td><td><div class="input-append bootstrap-timepicker-component">
   							 				<input name="effectiveTime" type="text" class="timepicker-default input-small">
   							 				<span class="add-on">
      						  					<i class="icon-time"></i>
    										</span>
										</div>
									</td>
									<td>
										<div class="input-append date" id="dp3" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
				<input class="span2" size="16" type="text" value="12-02-2012" readonly="">
				<span class="add-on"><i class="icon-calendar"></i></span>
			  </div>
										</td>
									</tr>
			 <tr><td>Onset</td><td><div class="input-append bootstrap-timepicker-component">
   							 				<input name="effectiveTime" type="text" class="timepicker-default input-small">
   							 				<span class="add-on">
      						  					<i class="icon-time"></i>
    										</span>
										</div>
									</td>
									<td>
										<div class="input-append date" id="dp3" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
				<input class="span2" size="16" type="text" value="12-02-2012" readonly="">
				<span class="add-on"><i class="icon-calendar"></i></span>
			  </div>
										</td>
									</tr>									
			 <tr><td>Expires</td><td><div class="input-append bootstrap-timepicker-component">
   							 				<input name="effectiveTime" type="text" class="timepicker-default input-small">
   							 				<span class="add-on">
      						  					<i class="icon-time"></i>
    										</span>
										</div>
									</td>
									<td>
										<div class="input-append date" id="dp3" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
				<input class="span2" size="16" type="text" value="12-02-2012" readonly="">
				<span class="add-on"><i class="icon-calendar"></i></span>
			  </div>
										</td>
									</tr>									
									
              
              <tr><td>Sender Name</td><td><input class="input-large" type="text" name="senderName"/></td></tr>
              <tr><td>Headline</td><td><input class="input-large" type="text" name="headline"/></td></tr>
              <tr><td>Description</td><td><input class="input-large" type="text" name="description"/></td></tr>
              <tr><td>Instruction</td><td><input class="input-large" type="text" name="instruction"/></td></tr>
              <tr><td>Web</td><td><input class="input-large" type="text" name="web"/></td></tr>
              <tr><td>Contact</td><td><input class="input-large" type="text" name="contact"/></td></tr>
              <tr><td>Parameter</td><td><input class="input-large" type="text" name="parameter"/></td></tr>
              </table>
              </div>
              </div>
              </div>

              <button onclick="addTable();return false;" class="btn btn-primary" type="button">Add another Info block</button>
			  <table>
			  <tr><td align="left"><button type="submit" name="backAlert2">Back</button></a></td><td align="right"><button type="submit" name="nextAlert2">Next</button></td></tr>
			  </table>              
              </form>
<%@include file="footer.jsp" %>