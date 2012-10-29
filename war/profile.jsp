<%@include file="header.jsp" %>
              Welcome, <%= request.getAttribute("firstname") %>! <br>
              We are building templates that will assist you in reporting the Alert easily! Stay tuned !
              
             <a href="/alert.jsp"><button>Send an Alert</button></a>
<%@include file="footer.jsp" %>