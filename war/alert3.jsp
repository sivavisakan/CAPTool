<%@include file="header.jsp" %>
<ol id="noStep" class="selected-step-3">
  <li id="step" class="step-1">Alert Message</li>
    <li id="step" class="step-2">Information </li>
    <li id="step" class="step-3">Resource</li>
    <li id="step" class="step-4">Finish</li>
</ol>
              
              <form name="alertForm" action="/sign" method="post">
              <div id="map"></div>
              <table>
              <tr><td>Resource Description &nbsp</td><td><input class="input-large" type="text" name="resource"/></td></tr>
              <tr><td>MIME Type &nbsp</td><td><input class="input-large" type="text" name="mime"/></td></tr>
              <tr><td>Size &nbsp</td><td><input class="input-large" type="text" name="size"/></td></tr>
              <tr><td>URI &nbsp</td><td><input class="input-large" type="text" name="uri"/></td></tr>
              <tr><td>derefURI &nbsp</td><td><input class="input-large" type="text" name="derefuri"/></td></tr>
              <tr><td align="left"><button type="submit" name="backAlert2">Back</button></a></td><td align="right"><button  name="nextAlert3" type="submit">Next</button></td></tr>
              </table>
              </form>
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
<%@include file="footer.jsp" %>