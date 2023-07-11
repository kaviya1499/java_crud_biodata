<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%!
    public static String value(String u,String v){
    	if(u == null)
    	{return v ;}
    	else{
    	return u;
    		}
    	
    	}
    	%>
    
<jsp:useBean id="formHandler" class="test.EditBean" scope="request"/>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="style.css">
  <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Edit Page</title>
<style type="text/css">
p{
padding-top:3px;
color:black
}


* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

.buttons {
    margin: 10%;
    text-align: center;
    margin-left: 0px;
    margin-top: 37px;
}

.btn-hover {
    width: 200px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    margin: 20px;
    height: 55px;
    text-align:center;
    border: none;
    background-size: 300% 100%;

    border-radius: 50px;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-hover:hover {
    background-position: 100% 0;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-hover:focus {
    outline: none;
}

.btn-hover.color-7 {
    background-image: linear-gradient(to right, #6253e1, #852D91, #A3A1FF, #F24645);
    box-shadow: 0 4px 15px 0 rgba(126, 52, 161, 0.75);
}
 

</style>


<script type="text/javascript">




function ageCount() {
    var date1 = new Date();
    var dob = document.getElementById("dob").value;
  //  alert(dob);
    var date2 = new Date(dob);
    //alert(date2);
   // var pattern = /^\d{4}\/\d{1,2}\/\d{1,2}$/;
    //Regex to validate date format (dd/mm/yyyy)       
//    if (pattern.test(dob)) {
        var y1 = date1.getFullYear();
       // alert( y1);
        //getting current year            
        var y2 = date2.getFullYear();
        //var x = date2.getMonth();
       // alert(x);
       // alert(y2);
        //getting dob year            
        var age = y1 - y2;
        if(age == 1){
        if(y1 == y2){
        	age = 0;
        }
        if(date1.getMonth() < date2.getMonth() || (date1.getMonth() == date2.getMonth() && date1.getDate() < date2.getDate()) ){
        	age = 0;
        }
}
        
        //calculating age     
       // alert(age);
        document.getElementById("ageId").value = age;
      //  doucment.getElementById("ageId").focus ();
        return true;
  //  }


}
</script>


</head>
<body>
<%@page import="insert.UserDao,test.FormBean,test.EditBean"%>

<%  
String id=request.getParameter("id");  
EditBean u=UserDao.getRecordById(Integer.parseInt(id));  
%>



<div class="container">

<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
<div class="main2">
<h3 style="color:#a62fb6;text-align:center;font-face:Comic sans MS;font-size:50px">Edit Page</h3>
<form action="editprocess.jsp" method="post">

<div class="container" style="margin-top:51px">
<div class="row">

<div class="col-sm-12">


<div class="container">
<div class="row">
<div class="col-sm-6">
<input type="hidden" name="id" value="<%=u.getId() %>" />

<p>First Name : </p>

<input name="firstName" id="firstName" class="form-control js-name" type="text"  value="<%= u.getFirstName()%>">
<font size=2 
color=red><%=formHandler.getErrorMsg("firstName")%></font>
</div>

<div class="col-sm-6">
<p>Last Name : </p>
<input name="lastName" id="lastName" class="form-control js-name" type="text" value="<%= u.getLastName()%>" >
<font size=2 
color=red><%=formHandler.getErrorMsg("lastName")%></font>
</div>






<div class="col-sm-6">

<p>Email - Id : </p>
<input name="email" id="email" class="form-control" type="email"  value="<%= u.getEmail()%>">
<font size=2 
color=red><%=formHandler.getErrorMsg("email")%></font>
</div>

<div class="col-sm-6">
<p>Date of Birth: </p>
<input name="dob" id="dob" class="form-control datepicker" type="date" onchange="ageCount()" value="<%= u.getdob()%>">
<font size=2 
color=red><%=formHandler.getErrorMsg("dob")%></font>

<!--  <p>Age </p>-->
<input name="age" id="ageId" class="form-control" type="hidden"  value="<%= u.getage()%>">

</div>






<div class="col-sm-6">
<p>Password : </p>
<input name="password1" id="password1" class="form-control" type="text" value="<%= u.getPassword1()%>" >
<font size=2 
color=red><%=formHandler.getErrorMsg("password1")%></font>
</div>
<div class="col-sm-6">
<p>Confirm Password : </p>
<input name="password2" id="password2" class="form-control" type="text"  value="<%= u.getPassword2()%>" >
<font size=2 
color=red><%=formHandler.getErrorMsg("password2")%></font>
</div>

<div class="col-sm-6">
<p>Address Line 1</p>
<input name="address1" id="address1" class="form-control" type="text" value="<%= value(u.getaddress1(),formHandler.getaddress1()) %>" >
<font size=2 
color=red><%=formHandler.getErrorMsg("address1")%></font>
</div>
<div class="col-sm-6">
<p>Address Line 2</p>
<input name="address2" id="address2" class="form-control" type="text" value="<%= value(u.getaddress2(),formHandler.getaddress2()) %>" >
<font size=2 
color=red><%=formHandler.getErrorMsg("address2")%></font>
</div>


<div class="col-sm-6">
<p>City</p>
<input name="city" id="city" class="form-control" type="text"  value="<%= value(u.getcity(),formHandler.getcity())%>">
<font size=2 
color=red><%=formHandler.getErrorMsg("city")%></font>
</div>
<div class="col-sm-6">
<p>State</p>
<input name="state" id="state" class="form-control" type="text"  value="<%= value(u.getstate(),formHandler.getstate())%>">
<font size=2 
color=red><%=formHandler.getErrorMsg("state")%></font>
</div>

<div class="col-sm-6">
<p>Postal Code</p>
<input name="zip" id="zip" class="form-control" type="number" value="<%= value(u.getZip(),formHandler.getZip())%>" >
<font size=2 
color=red><%=formHandler.getErrorMsg("zip")%></font>
</div>



<div class="col-sm-6">
<p>Blood Group</p>
<select id="Bloodgroup" name="bloodgroup" class="form-control">
<option value="<%= u.getBloodgroup()%>"><%= value(u.getBloodgroup(),formHandler.getBloodgroup())%><sup></sup></option>
   <option value="O-">O<sup>-</sup></option>
    <option value="O+">O<sup>+</sup></option>
    <option value="A-">A<sup>-</sup></option>
    <option value="A+">A<sup>+</sup></option>
    <option value="B-">B<sup>-</sup></option>
    <option value="B+">B<sup>+</sup></option>
    <option value="AB-">AB<sup>-</sup></option>
    <option value="AB+">AB<sup>+</sup></option>
                
 
</select>
<font size=2 
color=red><%=formHandler.getErrorMsg("bloodgroup")%></font>
</div>
<div class="col-sm-6">
<p>Phone Number</p>
<input name="number" id="number" class="form-control" type="number" value="<%= value(u.getnumber(),formHandler.getnumber())%>" >
<font size=2 
color=red><%=formHandler.getErrorMsg("number")%></font>
</div>
<div class="col-sm-6">
<p>Salary</p>
<input name="salary" id="salary" class="form-control" type="number"  value="<%=value( u.getsalary(),formHandler.getsalary())%>">
<font size=2 
color=red><%=formHandler.getErrorMsg("salary")%></font>
</div>

<div class="col-sm-6">
<p>Gender</p>
<input type="radio" name="gender" value="Male"<%= u.isRbSelected("Male") %>> Male 
<input type="radio" name="gender" value="Female"<%= u.isRbSelected("Female") %>> Female 
<input type="radio" name="gender" value="Others"<%= u.isRbSelected("Others") %>> Others
</div>
<font size=2 
color=red><%=formHandler.getErrorMsg("gender")%></font>
<div class="col-sm-6">
<p>Skills</p>
<input type="checkbox" name="faveTech" value="Java"<%= u.isCbSelected("Java") %>>Java 
<input type="checkbox" name="faveTech" value="JSP"<%= u.isCbSelected("JSP") %>>JSP 
<input type="checkbox" name="faveTech" value="Struts 1.1"<%= u.isCbSelected("Struts 1.1") %>>Struts 1.1<br>
<input type="checkbox" name="faveTech" value="Ajax"<%= u.isCbSelected("Ajax") %>>Ajax 
<input type="checkbox" name="faveTech" value="Struts 2.0"<%= u.isCbSelected("Struts 2.0") %>>Struts 2.0 
<input type="checkbox" name="faveTech" value="Servlets"<%= u.isCbSelected("Servlets") %>>Servlets<br>
<font size=2 
color=red><%=formHandler.getErrorMsg("faveTech")%></font>
</div>







<div class="buttons">
 <input type="submit" class="btn-hover color-7" value="Submit">
<a href="list.jsp"><input  class="btn-hover color-7"  value="cancel"></a>
 </div>
 </div>
 </div>
</div>



</div>
</div>

</form>
</div>
</div>
<div class="col-sm-1"></div>

</div>

</div>


<script type="text/javascript">
function alphaOnly() {
    let nameInput = document.querySelectorAll('.js-name');
      nameInput.forEach((input) => {
  
        input.addEventListener('keydown', (e) => {
          let charCode = e.keyCode;
  
          if ((charCode >= 65 && charCode <= 90) || charCode == 8 || charCode == 32) {
            null;
          } else {
            e.preventDefault();
          }
        });
      });
    }

alphaOnly();


var dateControler = {
	    currentDate : null
	}

	 $(document).on( "change", "#dob",function( event, ui ) {
	        var now = new Date();
	        var selectedDate = new Date($(this).val());
	        
	        if(selectedDate > now) {
	            $(this).val(dateControler.currentDate)
	        } else {
	            dateControler.currentDate = $(this).val();
	        }
	    });   
	</script>
</body>
</html>