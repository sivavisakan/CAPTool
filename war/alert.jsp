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
    	if($("#scope").val() == "Private"){
    		$("#address").append('<td id="addressText">Addresses</td><td id="addressInput"><input class="input-large" type="text" name="address"/></td>');
    	}
    	else {
    		$("#addressText").remove();
    		$("#addressInput").remove();
    	}
    }
    
    $.fn.serializeObject = function()
    {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name] !== undefined) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };
    $(function() {
        $('#alertForm').submit(function() {
        	debugger
        	window.localStorage.setItem("alertForm", JSON.stringify($('#alertForm').serializeObject()));
        	//return false;
        });
     });
    $(function(){
    	var alertForm = localStorage.getItem('alertForm');
    	debugger;
    	if( alertForm != null){
    		var alertJSON = $.parseJSON(alertForm);
    		$("#messageStatus").val(alertJSON.messageStatus); 
    		$("#messageType").val(alertJSON.messageType); 
    		$("#source").val(alertJSON.source); 
    		$("#scope").val(alertJSON.scope); 
    		$("#code").val(alertJSON.code); 
    		$("#addressInput").val(alertJSON.addressInput); 
    		$("#restrictionInput").val(alertJSON.restrictionInput); 
    	}
    });
    
    </script>

<ol id="noStep" class="selected-step-1">
    <li id="step" class="step-1">Alert Message</li>
    <li id="step" class="step-2">Area</li>
    <li id="step" class="step-3">Information</li>
    <li id="step" class="step-4">Finish</li>
</ol>
              
              <form name="alertForm" id="alertForm" action="/sign" method="post">
              <div id="map"></div>
              <table>
              <tr><td>Status &nbsp</td><td><select name="messageStatus" id="messageStatus"><option>Actual</option><option>Exercise</option><option>System</option><option>Test</option><option>Draft</option></select></td></tr>
              <tr><td>Message Type &nbsp</td><td><select name="messageType" id="messageType"><option>Alert</option><option>Update</option><option>Cancel</option><option>Ack</option><option>Error</option></select></td></tr>
              <tr><td>Source</td><td><input class="input-large" type="text" name="source" id="source"/></td></tr>
              <tr id="scoper"><td>Scope</td><td><select name="scope" id="scope" onchange="checkScope()"><option>Public</option><option>Restricted</option><option>Private</option></select></td></tr>
              <tr id="restricted"></tr>
              <tr id="address"></tr>
              <tr><td>Code</td><td><input class="input-large" type="text" name="code" id="code"/></td></tr>
              <tr><td></td><td align="right"><button type="submit" name="nextMap">Next</button></td></tr>
              </table>
              </form>
<%@include file="footer.jsp" %>