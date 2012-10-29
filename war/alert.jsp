<%@include file="header.jsp" %>
    <script>
    /**
	 * Insert "Restricted Textbox" if the scope is "Restricted"
     */
    
    function checkScope(){
    	
    	if($("#scope").val() == "Restricted"){
    		$("#restricted").append("<td id='restrictionText'>Restriction Text</td><td id='restrictionInput'><input type='text' name='restrictedText'/></td>"); 
    	} 
    	else {
    		$("#restrictionText").remove();
    		$("#restrictionInput").remove();
    	}
    }
    </script>

<ol id="noStep" class="selected-step-1">
    <li id="step" class="step-1">Alert Message</li>
    <li id="step" class="step-2">Information </li>
    <li id="step" class="step-3">Resource</li>
    <li id="step" class="step-4">Finish</li>
</ol>
              
              <form name="alertForm" action="/sign" method="post">
              <div id="map"></div>
              <table>
              <tr><td>Status &nbsp</td><td><select name="messageStatus"><option>Actual</option><option>Exercise</option><option>System</option><option>Test</option><option>Draft</option></select></td></tr>
              <tr><td>Message Type &nbsp</td><td><select name="messageType"><option>Alert</option><option>Update</option><option>Cancel</option><option>Ack</option><option>Error</option></select></td></tr>
              <tr><td>Source</td><td><input class="input-large" type="text" name="source"/></td></tr>
              <tr id="scoper"><td>Scope</td><td><select name="scope" id="scope" onchange="checkScope()"><option>Public</option><option>Restricted</option><option>Private</option></select></td></tr>
              <tr id="restricted"></tr>
              <tr><td>Addresses</td><td><input class="input-large" type="text" name="address"/></td></tr>
              <tr><td>Code</td><td><input class="input-large" type="text" name="code"/></td></tr>
              <tr><td>Note</td><td><textarea rows="3" name="note" placeholder="The text describing the purpose or significance of the alert message!"/></textarea></td></tr>
              <tr><td>References</td><td><textarea rows="3" name="reference" placeholder="The group listing identifying earlier messages referenceed by the alert message"/></textarea></td></tr>
              <tr><td>Incidents</td><td><textarea rows="3" name="incident" placeholder="The group listing identifying naming the referent incidents of the alert message"/></textarea></td></tr>
              <tr><td></td><td align="right"><button type="submit" name="nextAlert1">Next</button></td></tr>
              </table>
              </form>
<%@include file="footer.jsp" %>