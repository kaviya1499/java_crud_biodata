package insert;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;  
import java.util.Date; 
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import test.FormBean;
import test.EditBean;
 
public class UserDao {
public static Connection getConnection(){
	Connection con=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test_db?characterEncoding=latin1","root","password");
	}catch(Exception e){System.out.println(e);}
	return con;
}



public static int save(FormBean u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps;
		
//		
//		PreparedStatement ps1 = con.prepareStatement("select count(*) from employee_t where emp_name = 'kaviya' ");
//		final ResultSet resultSet = ps1.executeQuery();
//		if(resultSet.next()) {
//		    final int count = resultSet.getInt(1);
//		    System.out.println(count);
//		}
		//System.out.println(count);
		
		
		 ps=con.prepareStatement("insert into mini_table(firstName,lastName,emailId,dob,age,password1,password2,gender) values(?,?,?,?,?,?,?,?)");
		ps.setString(1,u.getFirstName());
		if(u.getLastName().equals("")) {
			ps.setString(2,"");
		}else {
			ps.setString(2,u.getLastName());
		} 
		
		ps.setString(3,u.getEmail());
		
		Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(u.getdob()); 
		ps.setDate(4,new java.sql.Date(date1.getTime()));
		int a=Integer.parseInt(u.getage());
		ps.setInt(5,a);
		ps.setString(6,u.getPassword1());
		ps.setString(7,u.getPassword2());
		ps.setString(8,u.getgender());
		
		
		
//		ps.setString(7,u.getaddress1());
//		if(u.getaddress2().equals("")) {
//			ps.setString(8,"");
//		}else {
//		ps.setString(8,u.getaddress2());
//		}
//		ps.setString(9,u.getcity());
//		ps.setString(10,u.getstate());
//		ps.setString(11,u.getUserName());
//		ps.setString(12,u.getgender());
//		ps.setString(13,u.getBloodgroup());
//		ps.setString(14,u.getnumber());
//		if(u.getsalary().equals("")) {
//			ps.setBigDecimal(15,BigDecimal.ZERO);
//		
//		} else {
//			ps.setBigDecimal(15,new BigDecimal(u.getsalary()));
//		}
		
		
//		String tech=Arrays.toString(u.getFaveTech());
//		ps.setString(18,tech);
//		ps.setString(19,u.getNotify());
		status=ps.executeUpdate();
		System.out.println(status);
	}catch(Exception e){System.out.println(e);}
	return status;
}




public static Boolean duplicate_check(String u) {
	Boolean status = false;
	final int count;
	try {
		Connection con=getConnection();
		PreparedStatement ps = con.prepareStatement("select count(*) from mini_table where lower(firstName) = lower(?) ");
		ps.setString(1, u);
		final ResultSet resultSet = ps.executeQuery();
		if(resultSet.next()) {
			count  = resultSet.getInt(1);
			System.out.println(count);
			if(count >= 1) {
				status = true;
			}
		}
		
		//System.out.println(resultSet);
	}
	catch(Exception e){System.out.println(e);}
	
	return status;
}

public static Boolean duplicate_check2(String u) {
	Boolean status = false;
	final int count;
	try {
		Connection con=getConnection();
		PreparedStatement ps = con.prepareStatement("select count(*) from mini_table where lower(firstName) = lower(?) ");
		ps.setString(1, u);
		final ResultSet resultSet = ps.executeQuery();
		if(resultSet.next()) {
			count  = resultSet.getInt(1);
			System.out.println(count);
			if(count > 1) {
				status = true;
			}
		}
		
		//System.out.println(resultSet);
	}
	catch(Exception e){System.out.println(e);}
	
	return status;
}


public static Boolean username_check(String userName) {
	Boolean status = false;
	System.out.println(status);
	System.out.println(userName);
	final int count;
	try {
		Connection con=getConnection();
		PreparedStatement ps = con.prepareStatement("select count(*) from mini_table where emailId = ? ");
		ps.setString(1, userName);
		
		final ResultSet resultSet = ps.executeQuery();
		if(resultSet.next()) {
			count  = resultSet.getInt(1);    
			
			
			
			
			System.out.println(count);
			if(count != 1) {
				status = true;
			}
		}
		
		//System.out.println(resultSet);
	}
	catch(Exception e){System.out.println(e);}
	System.out.println(status);
	return status;
}


public static Boolean password_check(String userName,String password) {
	Boolean status = false;
	//System.out.println(status);
	//System.out.println(userName);
	final int count;
	try {
		Connection con=getConnection();
		PreparedStatement ps = con.prepareStatement("select password1 from mini_table where emailId = ? ");
		ps.setString(1, userName);
		
		final ResultSet resultSet = ps.executeQuery();
		if(resultSet.next()) {
			String data  = resultSet.getString("password1");
			if(!data.equals(password)) {
				status = true;
			}
			//System.out.println(count);
//			if(count != 1) {
//				status = true;
//			}
		}
		
		//System.out.println(resultSet);
	}
	catch(Exception e){System.out.println(e);}
	System.out.println(status);
	return status;
}


public static int update(EditBean u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update mini_table set firstName=?,lastName=?,emailId=?,dob=?,age=?,password1=?,password2=?,address1=?,address2=?,city=?,state=?,zip=?,bloodgroup=?,number=?,salary=?,gender=?,skill=? where id=?");
		ps.setString(1,u.getFirstName());
		
		if(u.getLastName().equals("")) {
			ps.setString(2,"");
		}else {
			ps.setString(2,u.getLastName());
		}
		
		ps.setString(3,u.getEmail());
		
		Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(u.getdob()); 
		ps.setDate(4,new java.sql.Date(date1.getTime()));
		
		int a=Integer.parseInt(u.getage());
		ps.setInt(5,a);
		
		ps.setString(6,u.getPassword1());
		ps.setString(7,u.getPassword2());
		ps.setString(8,u.getaddress1());
		if(u.getaddress2().equals("")) {
			ps.setString(9,"");
		}else {
		ps.setString(9,u.getaddress2());
		}
		ps.setString(10,u.getcity());
		ps.setString(11,u.getstate());
		ps.setString(12,u.getZip());
		ps.setString(13,u.getBloodgroup());
		ps.setString(14,u.getnumber());
		if(u.getsalary().equals("")) {
			ps.setBigDecimal(15,BigDecimal.ZERO);
		
		} else {
			ps.setBigDecimal(15,new BigDecimal(u.getsalary()));
		}
		ps.setString(16,u.getgender());
		
		String tech=Arrays.toString(u.getFaveTech());
		
		ps.setString(17,tech);
		
		ps.setInt(18, u.getId());
		
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println(e);}
	return status;
}


public static int delete(FormBean u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("delete from mini_table where id=?");
		ps.setInt(1,u.getId());
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println(e);}

	return status;
}



public static List<FormBean> getAllRecords(){
	List<FormBean> list=new ArrayList<FormBean>();
	
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from mini_table");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			FormBean u=new FormBean();
			u.setId(rs.getInt("id"));
			u.setFirstName(rs.getString("firstName"));
			u.setLastName(rs.getString("lastName"));
			u.setEmail(rs.getString("emailId"));
			u.setDob(rs.getString("dob"));
			u.setAge(rs.getString("age"));
			list.add(u);
		}
	}catch(Exception e){System.out.println(e);}
	return list;
}
public static EditBean getRecordById(int id){
	EditBean u=null;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from mini_table where id=?");
		ps.setInt(1,id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			u=new EditBean();
			u.setId(rs.getInt("id"));
			u.setFirstName(rs.getString("firstName"));
			u.setLastName(rs.getString("lastName"));
			u.setEmail(rs.getString("emailId"));
			u.setDob(rs.getString("dob"));
			u.setAge(rs.getString("age"));
			u.setPassword1(rs.getString("password1"));
			u.setPassword2(rs.getString("password2"));
			u.setAddress1(rs.getString("address1"));
			u.setAddress2(rs.getString("address2"));
			u.setCity(rs.getString("city"));
			u.setState(rs.getString("state"));
			u.setZip(rs.getString("zip"));
			u.setBloodgroup(rs.getString("bloodgroup"));
			u.setNumber(rs.getString("number"));
			u.setSalary(rs.getString("salary"));
			u.setGender(rs.getString("gender"));
			
			String[] strArray=rs.getString("skill").split(",");
			u.setFaveTech(strArray);
			
		}
	}catch(Exception e){System.out.println(e);}
	return u;
}



public static FormBean getRecordByName(String name){
	FormBean u=null;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from mini_table where emailId=?");
		ps.setString(1,name);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			u=new FormBean();
			u.setId(rs.getInt("id"));
			u.setFirstName(rs.getString("firstName"));
			u.setLastName(rs.getString("lastName"));
			u.setEmail(rs.getString("emailId"));
			u.setDob(rs.getString("dob"));
			u.setAge(rs.getString("age"));
			u.setPassword1(rs.getString("password1"));
			u.setPassword2(rs.getString("password2"));
//			u.setAddress1(rs.getString("address1"));
//			u.setAddress2(rs.getString("address2"));
//			u.setCity(rs.getString("city"));
//			u.setState(rs.getString("state"));
//			u.setZip(rs.getString("zip"));
//			u.setBloodgroup(rs.getString("bloodgroup"));
//			u.setNumber(rs.getString("number"));
//			u.setSalary(rs.getString("salary"));
//			u.setGender(rs.getString("gender"));
			//u.setFaveTech(rs.getString("address2"));
			
		}
	}catch(Exception e){System.out.println(e);}
	return u;
}

}
