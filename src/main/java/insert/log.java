package insert;

import java.util.Hashtable;
import insert.UserDao;

public class log {
	 private String userName;
	 private String password;
	 private Hashtable errors;
	 
	 public boolean validate() {
		    boolean bool=true;
		    
		    if (userName.equals("") || (userName.indexOf('@') == -1)) {
		        errors.put("userName","Please enter a valid User Name");
		        //email="";
		        bool=false;
		      }
		    if (password.equals("") ) {
		        errors.put("password","Please enter a valid password");
		       // password="";
		        bool=false;
		      }
		    
		    if(UserDao.username_check(userName)) {
		    	//System.out.println("duplicate check");
		    	errors.put("userName","Username Not Found");
		         //firstName="";
		         bool=false;
		    }
		    if(UserDao.password_check(userName,password)) {
		    	errors.put("password","Password Mismatch");
		         //firstName="";
		         bool=false;
		    	
		    }
		    
		    
		    
		    return bool;
	 }
	 public String getErrorMsg(String s) {
		    String errorMsg =(String)errors.get(s.trim());
		    return (errorMsg == null) ? "":errorMsg;
		  }
	 public log() {
		 userName ="";
		 password="";
		 
		 errors = new Hashtable();
		 
	 }
	 
	 public String getUserName() {
		 return userName;
	 }
	 
	 public String getPassword() {
		 return password;
	 }
	 
	 
	 
	 public void  setUserName(String u) {
		 userName = u;
	  }
	 public void  setPassword(String p1) {
		  password = p1;
	  }
	 
	 public void setErrors(String key, String msg) {
		    errors.put(key,msg);
		  }
	 

}
