package cmu.edu.captool;
import java.io.IOException;
import javax.servlet.http.*;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
public class LoginServlet extends HttpServlet {
    /**
	 * Handles the Login and Sign up of a User
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
              throws IOException {
    	//Checks if the form is for signup
    	if(req.getParameter("signup")!= null){
    		System.out.println();
    		
	        String email = req.getParameter("email");
	        String phone = req.getParameter("phone");
	        String password = req.getParameter("password");
	        String confirmPassword = req.getParameter("confirmPassword");
	        if(confirmPassword.equals(password) != true){
	        	//Ask the user to reenter the password
	        }
	        
	        Key UsersKey = KeyFactory.createKey("CAP", "Users"); //Create a UsersKey -> Similar to Users Table 
	        
	        Entity user = new Entity("User", UsersKey); //Create a User ntity -> SImilar to a Row
	        //Set the properties of the user
	        user.setProperty("email", email);
	        user.setProperty("password", password);
	        user.setProperty("phone", phone);
	        //Get the intance of the datastore
	        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	        datastore.put(user); //Store the details of a User
		}
    }
}