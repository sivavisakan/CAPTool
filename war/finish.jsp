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

<ol id="noStep" class="selected-step-4">
    <li id="step" class="step-1">Alert Message</li>
    <li id="step" class="step-2">Information </li>
    <li id="step" class="step-3">Resource</li>
    <li id="step" class="step-4">Finish</li>
</ol>
              
              <form name="alertForm" id="alertForm" action="/sign" method="post">
              <div class="hero-unit">
              <h4><input type="checkbox" name="vehicle" value="Bike"> All the information provided are correct to the best of my knowledge</h4>
              <br/><button class="btn-primary btn-large"> < Review </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn-primary btn-large">Send ></button>
              </div>
              </form>
<%@include file="footer.jsp" %>