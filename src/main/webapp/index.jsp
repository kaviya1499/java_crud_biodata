<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
    
<html>

<head>
  <link rel="stylesheet" href="style.css">
  <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
   <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  
  <title>Mini Project</title>
  
  
  <style>
   .buttons {
    margin: 10%;
    text-align: center;
}

.btn-hover {
    width: 132px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    margin: 20px;
    height: 49px;
    text-align:center;
    border: none;
    background-size: 300% 100%;
margin-right: -67px;
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


 input::-ms-reveal,
      input::-ms-clear {
        display: none;
      }
  </style>

<script type="text/javascript">
  function myfunction(){
	  alert("hi");
	  var name=document.getElementById('userName').value;
	  alert(name);
	  let x = UserDao.username_check(name);
	  alert(x);
	  if(false){
		  alert("true");
		  window.location = '/retry.jsp';
	  }
	  else{
		  alert("false");
		  window.location = '/success.jsp';
	  }
	  
  }
 </script>
 <script type="text/javascript">
    function myFun() {
    	  var x = document.getElementById("password");
    	  if (x.type === "password") {
    	    x.type = "text";
    	  } else {
    	    x.type = "password";
    	  }
    	 
    	}
    </script>
 
</head>

<body>
<jsp:useBean id="formHandler" class="insert.log" scope="request"/> 
<%@ page import="java.util.*" %>
<center>
<div class="container">
<div class="row">
  <div class="col-sm-3"></div>
  <div class="col-sm-6">
   <div class="main" >
  <br>
  <img src="large.png"  width="128" height="128" class="img img-responsive img-circle center-block"    />

    <p class="sign" align="center">Log in</p>
    
   
    <form class="form1" action="log_process.jsp" method="post">
      <input class="un " type="text" align="center" name="userName" id="userName" placeholder="Email - Id" value="<%= formHandler.getUserName() %>" >
      <br>
      <font size=2 color=red><%=formHandler.getErrorMsg("userName")%></font>
      <input class="pass" type="password" align="center" name="password" id="password" placeholder="Password" value="<%=formHandler.getPassword() %>">
       <br>
        <input  type="checkbox"  onclick="myFun()">  Show Password</label>
       
       <font size=2 color=red><%=formHandler.getErrorMsg("password")%></font>
      <br>
      <br>
      <table>
      <tr >
    <td style="width:500px;padding-left: 59px;position:relative;right:-46px"><div class="buttons"> <button type="submit" class="btn-hover color-7" align="center" >Sign in</button></div></td>
     <td style="width:500px;padding-right: 112px;position: relative;left: -35px;"><div class="buttons">  <button class="btn-hover color-7"  align="center"><a href="signup.jsp">Sign up</a></button></div></td>
      </tr>
      </table>
      <br>
   <!--   <p  class="forgot" align="center"><a href="#">Forgot Password?</p> --> 
     </form>       
                
    </div></div>
  
  <div class="col-sm-3"></div>
</div>
 </div>
 
  
     
</body>

</html>