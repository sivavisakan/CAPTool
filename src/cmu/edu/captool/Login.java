package cmu.edu.captool;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.Entity;

/**
 * Servlet implementation class LoginServlet
 */
public class Login extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
	try{ 
     UserBean user = new UserBean();
     user.setUserName(request.getParameter("un"));
     user.setPassword(request.getParameter("pw"));
     user = UserDAO.login(user);
     if (user != null) {
          HttpSession session = request.getSession(true);	    
          session.setAttribute("currentSessionUser",user.getFirstName()); 
          response.sendRedirect("profile.jsp"); //logged-in page      		
     }
     else 
          response.sendRedirect("invalidLogin.jsp"); //error page
	} catch (Throwable theException){
     System.out.println(theException); 
	}
}

public void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, java.io.IOException {
	try{ 
		if(req.getParameter("signup")!= null){
			//Retrieving the form data
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			String firstname = req.getParameter("firstname");
			String lastname = req.getParameter("lastname");
			
			UserBean newUser = new UserBean(); //Creating a new User 
			newUser.setUserName(email);
			newUser.setFirstName(firstname);
			newUser.setLastName(lastname);
			newUser.setPassword(password);
			newUser.setPhone(phone);
			
			UserDAO.createUser(newUser); //Storing the User in the Datastore
			
			response.sendRedirect("/index.jsp");
		}
	} catch (Exception e){
     e.printStackTrace();
	}
}
}