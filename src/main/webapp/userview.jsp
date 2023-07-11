<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="formHandler" class="test.EditBean" scope="request"/>
    <%!
    public static String value(String u){
    	if(u == null)
    	{return " " ;}
    	else{
    	return u;
    		}
    	
    	}
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Details</title>


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

<style type="text/css">
td{
width:173px;
}


 .buttons {
    margin: 10%;
    text-align: center;
}

.btn-hover {
    width: 328px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    margin: 20px;
    height: 49px;
    text-align:center;
    border: none;
    background-size: 300% 100%;
margin-right: 53px;
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


</head>
<body>

<%@page import="insert.UserDao,test.FormBean,test.EditBean"%>

<%  
String id=request.getParameter("id");

EditBean u=UserDao.getRecordById(Integer.parseInt(id));  
%>

<div class="container" style="margin-top:-33px">
<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-6">
<div class="main" style="height:773px">
<h3 style="color:#a62fb6;text-align:center;font-face:Comic sans MS;font-size:50px">User Details</h3>
<div class="container">
<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-8">
<center>
<table class="table">
<tr >
<td style="text-align:right">First Name : </td>
<td><%= u.getFirstName()%></td>
</tr>

<tr >
<td style="text-align:right">Last Name : </td>
<td><%= u.getLastName()%></td>
</tr>

<tr >
<td style="text-align:right">Email - Id : </td>
<td><%= u.getEmail()%></td>
</tr>

<tr >
<td style="text-align:right">Date of Birth : </td>
<td><%= u.getdob()%></td>
</tr>

<tr >
<td style="text-align:right">Age : </td>
<td><%= u.getage()%></td>
</tr>

<tr >
<td style="text-align:right">Address Line 1 : </td>
<td><%= value(u.getaddress1()) %></td>
</tr>

<tr >
<td style="text-align:right">Address Line 2 : </td>
<td><%=value(u.getaddress2())%></td>
</tr>

<tr >
<td style="text-align:right">City : </td>
<td><%= value(u.getcity())%></td>
</tr>

<tr >
<td style="text-align:right">State : </td>
<td><%= value(u.getstate())%></td>
</tr>

<tr >
<td style="text-align:right">Zip : </td>
<td><%= value(u.getZip())%></td>
</tr>

<tr >
<td style="text-align:right">Blood group : </td>
<td><%= value(u.getBloodgroup())%></td>
</tr>

<tr >
<td style="text-align:right">Phone Number : </td>
<td><%= value(u.getnumber())%></td>
</tr>

<tr >
<td style="text-align:right">Salary : </td>
<td><%= value(u.getsalary())%></td>
</tr>

<tr >
<td style="text-align:right">Gender : </td>
<td><%= value(u.getgender())%></td>
</tr>

<tr >
<td style="text-align:right">Skills : </td>
<td>
<%
  String[] faveTech = u.getFaveTech();
  if (!faveTech[0].equals("1")) {
    out.println("<ul>");
    for (int i=0; i<faveTech.length; i++)  
      out.println("<li>"+faveTech[i]);
    out.println("</ul>");
  } else out.println("Nothing was selected");
%>
</td>
</tr>







</table>
<a href="list.jsp"><button  class="btn-hover color-7" align="center" >Back</button></a>
</center>
</div>
<div class="col-sm-2"></div>
</div>
</div>
</div>
</div>
<div class="col-sm-3"></div>
</div>
</div>

</body>
</html>