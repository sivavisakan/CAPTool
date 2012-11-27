package cmu.edu.captool;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
public class UserDAO {
	static DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	public static UserBean login(UserBean bean) {
      String username = bean.getUsername();    
      String password = bean.getPassword();   
      Key userKey = KeyFactory.createKey("Alerter", username);
      Entity userEntity = null ;
      try{
    	  userEntity = datastore.get(userKey);
    	  if(userEntity.getProperty("password").equals(password)){
    		  UserBean userBean = new UserBean();
        	  userBean.setFirstName((String)userEntity.getProperty("firstName"));
        	  userBean.setLastName((String)userEntity.getProperty("lastName"));
        	  userBean.setPhone((String)userEntity.getProperty("phone"));
        	  return userBean;  
    	  }
      } catch(EntityNotFoundException e){ 
    	  	//If the user is not found then set the userInvalid Flag
    	  	return null;
      } catch(Exception e){ 
  	  	//If the user is not found then set the userInvalid Flag
    	e.printStackTrace();
  	  	return null;
    }
      return null;
	}
	public static void createUser(UserBean bean){
		Entity alerter = new Entity("Alerter", bean.getUsername());
		alerter.setProperty("firstName", bean.getFirstName());
		alerter.setProperty("lastName", bean.getLastName());
		alerter.setProperty("phone", bean.getPhone());
		alerter.setProperty("password", bean.getPassword());
		datastore.put(alerter);
	}
}