package test;

import java.util.Hashtable;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import insert.UserDao;

public class EditBean {
	  private int id;
	  private String firstName;
	  private String lastName;
	  private String email;
	  private String dob;
	  private String age;
	  private String password1;
	  private String password2;
	  private String address1;
	  private String address2;
	  private String city;
	  private String state;
	  private String zip;
	  private String bloodgroup;
	  private String number;
	  private String salary;
	  private String gender;
	  private String[] faveTech;
	  private Hashtable errors;
	  
	  public boolean validate() {
	    boolean bool=true;
	    Pattern p = Pattern.compile("[0-9]");
	    Matcher m = p.matcher(firstName);
	    if(m.find()) {
	    	 errors.put("firstName","Please enter Valid first name");
	         // firstName="";
	    	 System.out.println("1");
	          bool=false;
	    }
	    
	    
	    if (firstName.equals("")) {
	      errors.put("firstName","Please enter your first name");
	      System.out.println("2");
	     // firstName="";
	      bool=false;
	    }
	    
	    
	    
	    if(UserDao.duplicate_check2(firstName)) {
	    	//System.out.println("duplicate check");
	    	errors.put("firstName","First Name is already Exists");
	    	 System.out.println("3");
	        // firstName="";
	         bool=false;
	    }
	    
	    
	    
	    
	   // Pattern p1 = Pattern.compile("[0-9]");
	    Matcher m1 = p.matcher(lastName);
//	    System.out.println(lastName);
//	    boolean b2=Pattern.compile("\\D").matcher(lastName).matches(); 
//	    System.out.println(b2);
	    if(m1.find())
	    		{
	    	errors.put("lastName","Please enter valid Last name");
	        // firstName="";
	    	 System.out.println("4");
	         bool=false;
	    }
	    
	    if (email.equals("") || (email.indexOf('@') == -1)) {
	      errors.put("email","Please enter a valid email address");
	      System.out.println("5");
	      //email="";
	      bool=false;
	    }
//	    if (userName.equals("")) {
//	      errors.put("userName","Please enter a username");
//	     // userName="";
//	      bool=false;
//	    }
	    if (password1.equals("") ) {
	      errors.put("password1","Please enter a valid password");
	      System.out.println("6");
	    //  password1="";
	      bool=false;
	    }
	    if (!password1.equals("") && (password2.equals("") || 
	        !password1.equals(password2))) {
	      errors.put("password2","Please confirm your password");
	     // password2="";
	      System.out.println("7");
	      bool=false;
	    }
	    
	    if (dob.equals("")) {
	        errors.put("dob","Please enter a Date of Birth");
	      //  dob="";
	        System.out.println("8");
	        bool=false;
	      }
	    if (age.equals("")) {
	        errors.put("age","Please enter a Age");
	      //  age="";
	        bool=false;
	      }
	    
	    if (address1.equals("")) {
	        errors.put("address1","Please enter a Address Line 1");
	      //  address1="";
	        System.out.println("9");
	        bool=false;
	      }
	    
	    
	    //Pattern p2 = Pattern.compile("[0-9]");
	    Matcher m2 = p.matcher(city);
	    if(m2.find()) {
	    	errors.put("city","Please enter a City");
	        // city="";
	    	 System.out.println("10");
	         bool=false;
	    }
	    
	    if (city.equals("")) {
	        errors.put("city","Please enter a City");
	       // city="";
	        System.out.println("11");
	        bool=false;
	      }
	    
	    
	   // Pattern p3 = Pattern.compile("[0-9]");
	    Matcher m3 = p.matcher(state);
	    if(m.find()) {
	    	errors.put("state","Please enter a State");
	        // state="";
	    	 System.out.println("12");
	         bool=false;
	    }
	    if (state.equals("")) {
	        errors.put("state","Please enter a State");
	       // state="";
	        System.out.println("13");
	        bool=false;
	      }
	    if (gender.equals("")) {
	        errors.put("gender","Please enter a Gender");
	      //  gender="";
	        System.out.println("14");
	        bool=false;
	      }
	    if (bloodgroup.equals("select")) {
	        errors.put("bloodgroup","Please enter a BloodGroup");
	      //  gender="";
	        System.out.println("15");
	        bool=false;
	      }
	    
	    if (bloodgroup.equals("null")) {
	        errors.put("bloodgroup","Please enter a BloodGroup");
	      //  gender="";
	        System.out.println("15");
	        bool=false;
	      }
	    
	    Pattern p3 = Pattern.compile("[a-zA-Z]");
	    Matcher match = p3.matcher(number);
	    if(match.find()) {
	    	 errors.put("number","Please enter a Number");
	         //  number="";
	    	 System.out.println("16");
	           bool=false;
	    }
	    
	    
	    if (number.equals("")|| number.length() !=10) {
	        errors.put("number","Please enter a Number");
	      //  number="";
	        System.out.println("17");
	        bool=false;
	      }
	    
	    
	    
	    
	   
	    
	    
	  
	    
	    if (zip.equals("") || zip.length() !=6 ) {
	      errors.put("zip","Please enter a valid zip code");
	     // zip="";
	      System.out.println("18");
	      bool=false;
	    } else {
	      try {
	        int x = Integer.parseInt(zip);
	      } catch (NumberFormatException e) {
	        errors.put("zip","Please enter a valid zip code");
	        zip="";
	        bool=false;
	      }
	    }
	    
	    
	    
	   
	    
	    
	    return bool;
	  }
	  public String getErrorMsg(String s) {
	    String errorMsg =(String)errors.get(s.trim());
	    return (errorMsg == null) ? "":errorMsg;
	  }
	  public EditBean() {
	    firstName="";
	    lastName="";
	    email="";
	    dob="";
	    age="";
	    password1="";
	    password2="";
	    address1="";
	    address2="";
	    city="";
	    state="";
	    zip="";
	  
	    bloodgroup="";
	    number="";
	    salary="";
	    gender="";
	    faveTech = new String[] { "1" };
	   
	    errors = new Hashtable();
	  }
	  public String getFirstName() {
	    return firstName;
	  }
	  public String getLastName() {
	    return lastName;
	  }
	  public String getEmail() {
	    return email;
	  }
	  public String getZip() {
		    return zip;
		  }
	  
	  public String getdob() {
		    return dob;
		  }
	  public String getage() {
		    return age;
		  }
	  public String getaddress1() {
		    return address1;
		  }
	  public String getaddress2() {
		    return address2;
		  }
	  public String getcity() {
		    return city;
		  }
	  public String getstate() {
		    return state;
		  }
	  
	  
//	  public String getUserName() {
//	    return userName;
//	  }
	  public String getgender() {
		    return gender;
		  }
	  public String getBloodgroup() {
		    return bloodgroup;
		  }
	  
	  public String getnumber() {
		    return number;
		  }
	  public String getsalary() {
		    return salary;
		  }
	  
	  public String getPassword1() {
	    return password1;
	  }
	  public String getPassword2() {
	    return password2;
	  }
	  
//	  public String getNotify() {
//	    return notify;
//	  }
	  
	  public String[] getFaveTech() {
	    return faveTech;
	  }
	  
	  
	  
	  
	  public String isCbSelected(String s) {
	    boolean found=false;
	    if (!faveTech[0].equals("1")) {
	      for (int i = 0; i < faveTech.length; i++) {
	        if (faveTech[i].equals(s)) {
	          found=true;  
	          break;
	        }
	      }
	      if (found) return "checked";
	    } 
	    return "";
	  }
	  
	  
	  
	  
	  
	  
	  public void setFirstName(String fname) {
	   firstName =fname;
	  }
	  public void setLastName(String lname) {
	   lastName =lname;
	  }
	  public void setEmail(String eml) {
		 email=eml;
	  }
	  public void setZip(String z) {
		  zip=z;
	  }
	  public void setDob(String b) {
		  dob=b;
	  }
	  public void setAge(String a) {
		  age=a;
	  }
	  public void setAddress1(String a1) {
		  address1=a1;
	  }
	  public void setAddress2(String a2) {
		  address2=a2;
	  }
	  public void setCity(String ci) {
		  city=ci;
	  }
	  public void setState(String st) {
		  state=st;
	  }
	 
	  
	  
	  
//	  public void setUserName(String u) {
//		 userName=u;
//	  }
	  
	  public void setGender(String gen) {
			 gender=gen;
		  }
	  public void setBloodgroup(String blood) {
			 bloodgroup=blood;
		  }
	  public void setNumber(String num) {
			 number=num;
		  }
	  public void setSalary(String sal) {
			 salary=sal;
		  }
	  
	  
	  
	  public void  setPassword1(String p1) {
		  password1=p1;
	  }
	  public void  setPassword2(String p2) {
		  password2=p2;
	  }
	  
	  public void setFaveTech(String[] music) {
		  
		  faveTech=music;
	  }
	  public void setErrors(String key, String msg) {
	    errors.put(key,msg);
	  }
//	  public void setNotify(String n) {
//		 notify=n;
//	  }
	public String setsalary() {
		return null;
	}
	
	
	
	
	
	
	
	 public int getId() {
			return id;
		}
		public void setId(int id_num) {
			id = id_num;
		}
		
		
		public String isRbSelected(String s) {
		    return (gender.equals(s))? "checked" : "";
		  }
		
		
		

}
