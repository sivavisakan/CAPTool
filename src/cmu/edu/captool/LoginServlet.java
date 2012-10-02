package cmu.edu.captool;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
public class LoginServlet extends HttpServlet {
	/**
	 * Handles the Login and Sign up of a User
	 */
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			//Get the intance of the datastore
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			Key UsersKey = KeyFactory.createKey("CAP", "Users"); //Create a UsersKey -> Similar to Users Table
			//Checks if the form is for signup
			if(req.getParameter("signup")!= null){
				//Retrieving the form data
				String email = req.getParameter("email");
				String phone = req.getParameter("phone");
				String password = req.getParameter("password");
				String firstname = req.getParameter("firstname");
				String lastname = req.getParameter("lastname");

				// Create a user Entiry with email as the identity
				Entity user = new Entity(email, UsersKey); //Create a User entity -> SImilar to a Row
				//Set the properties of the user
				user.setProperty("password", password);
				user.setProperty("phone", phone);
				user.setProperty("firstname", firstname);
				user.setProperty("lastname", lastname);

				datastore.put(user); //Store the details of a User
				req.setAttribute("error","<div class=\"alert alert-success\"> You have successfully signed up! Please login with your credentials! </div>");
				req.getRequestDispatcher("/index.jsp").forward(req, resp);
			}

			//Checks if the form is for sign-in
			if(req.getParameter("signin") != null){
				String mail = req.getParameter("email");
				String password = req.getParameter("password");
				Query query = new Query(mail, UsersKey);
				List<Entity> greetings = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(5));
				if(greetings.size() != 0){
					Entity matchingEntity = greetings.get(0);
					if( matchingEntity != null ){
						String cPassword = (String) matchingEntity.getProperty("password");  
						String cName = (String) matchingEntity.getProperty("firstname");
						//Get the password from the data base and check	  
						if(cPassword.equals(password)){
							req.setAttribute("firstname",cName);
							req.getRequestDispatcher("/profile.jsp").forward(req, resp);
						}
					}
				}	
				//When there is something wrong with the user entered credentials, send an error message!
				req.setAttribute("error","<div class=\"alert alert-error\"> Either your email or Password is wrong; Please try again </div>");
				req.getRequestDispatcher("/index.jsp").forward(req, resp);
			}
		}
		catch(ServletException e){
			e.printStackTrace();
		}
	}
}