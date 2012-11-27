<%@include file="header.jsp" %>
              Welcome, <%= session.getAttribute("currentSessionUser") %>! <br>
              We are building templates that will assist you in reporting the Alert easily! Stay tuned !
              
             <a href="/alert.jsp"><button>Send an Alert</button></a>
<%@include file="footer.jsp" %>
