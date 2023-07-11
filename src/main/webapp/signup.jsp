<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="formHandler" class="test.FormBean" scope="request"/>
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
<title>Registration Page</title>
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
<script type="text/javascript">
    function myFun() {
    	  var x = document.getElementById("password1");
    	  if (x.type === "password") {
    	    x.type = "text";
    	  } else {
    	    x.type = "password";
    	  }
    	  var x = document.getElementById("password2");
    	  if (x.type === "password") {
    	    x.type = "text";
    	  } else {
    	    x.type = "password";
    	  }
    	}
    </script>


</head>
<body>
<div class="container">

<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-8">
<div class="main" style="height:864px">
<h3 style="color:#a62fb6;text-align:center;font-face:Comic sans MS;font-size:50px">Registration Page</h3>
<form action="proces.jsp" method="post">

<div class="container" style="margin-top:51px">
<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-6">
<p>First Name : </p>

<input name="firstName" id="firstName" value="<%=formHandler.getFirstName()%>" class="form-control js-name" type="text"  >
<font size=2 
color=red><%=formHandler.getErrorMsg("firstName")%></font>


<p>Last Name : </p>
<input name="lastName" id="lastName" class="form-control js-name" type="text"  value="<%=formHandler.getLastName()%>">
<font size=2 
color=red><%=formHandler.getErrorMsg("lastName")%></font>

<p>Email - Id : </p>
<input name="email" id="email" class="form-control" type="email"  >
<font size=2 
color=red><%=formHandler.getErrorMsg("email")%></font>

<p>Date of Birth: </p>
<input name="dob" id="dob" class="form-control datepicker" type="date" onchange="ageCount()" >
<font size=2 
color=red><%=formHandler.getErrorMsg("dob")%></font>

<!--  <p>Age </p>-->
<input name="age" id="ageId" class="form-control" type="hidden"  >


<p>Gender </p>
<input type="radio" name="gender" value="Male"> Male 
<input type="radio" name="gender" value="Female"> Female 
<input type="radio" name="gender" value="Others"> Others
<font size=2 
color=red><%=formHandler.getErrorMsg("gender")%></font>

<p>Password : </p>
<input name="password1" id="password1" class="form-control" type="password"  pattern="(?=.*\d)(?=.*[\W_]).{7,}" title="Minimum of 7 characters. Should have at least one special character and one number.">
<font size=2 
color=red><%=formHandler.getErrorMsg("password1")%></font>

<p>Confirm Password : </p>
<input name="password2" id="password2" class="form-control" type="password"  >
<font size=2 
color=red><%=formHandler.getErrorMsg("password2")%></font>

<input  type="checkbox"  onclick="myFun()">  Show Password</label>

<div class="buttons">
 <input type="submit" class="btn-hover color-7" value="Submit">
 </div>
</div>
<div class="col-sm-3"></div>
</div>
</div>

</form>
</div>
</div>
<div class="col-sm-2"></div>

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