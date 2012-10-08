<html>
  <head>
    <link type="text/css" rel="stylesheet" href="./stylesheets/bootstrap/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="./stylesheets/custom.css" />
    <script src="./scripts/jquery.js"></script>
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
              <br/><br/>
<ol id="noStep" class="selected-step-1">
    <li id="step" class="step-1">Step 1</li>
    <li id="step" class="step-2">Step 2</li>
    <li id="step" class="step-3">Step 3</li>
    <li id="step" class="step-4">Step 4</li>
    <li id="step" class="step-5">Step 5</li>
</ol>
              
              <form name="alertForm" action="/sign" method="post">
              <div id="map"></div>
              <table>
              <tr><td>Message Type &nbsp</td><td><select name="messageType"><option>Alert</option><option>Update</option><option>Cancel</option><option>Ack</option><option>Error</option></select></td></tr>
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
              
    </div>         
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
  </body>
</html>