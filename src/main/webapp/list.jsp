<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>User List</title>
<style type="text/css">
.main2{
 
        width: 1465px;
        height: 750px;
        margin: 7em auto;
        border-radius: 1.5em;
       
}


table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
 
  width: 100%;
}

th{
 text-align: left;
 background-color: black;
 
 color:white;
height: 50px;
 
}

td {
 
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {

  background-color: white;
   border-radius: 1.5em;
}




  
}

</style>
</head>
<body>

   
<%@page import="insert.UserDao,test.FormBean,java.util.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  



<div class="container-fluid" >
<div class="row">

<% 
String Username=(String)session.getAttribute("user"); 
FormBean k = UserDao.getRecordByName(Username);
int i=k.getId();

List<FormBean> list=UserDao.getAllRecords();
request.setAttribute("list",list);  
%>  

<div class="main2">
<h3 style="text-align:center;color:#8C55AA;font-size:40px">User List </h3>

<center>
<div style="overflow-x: auto;">

<c:set var="name" scope="page" value="<%=i %>"/>

<table>
<tr>
<th>First Name</th>
<th>Last Name</th>
<th>Email Id</th>
<th>Date of Birth</th>
<th>Age</th>
<th>Action</th>

</tr>


<c:forEach items="${list}" var="u">   
<tr>
<td>${u.getFirstName()}</td>
<td>${u.getLastName()}</td>
<td>${u.getEmail()}</td>
<td>${u.getdob()}</td>
<td>${u.getage()}</td>
<td>
<a href="userview.jsp?id=${u.getId()}"><button type="button" class="btn btn-success" style="margin-left: 3px;">View</button></a>

<c:if test="${name == u.getId() || name == 1}"> 
<a href="edit.jsp?id=${u.getId()}"><button type="button" class="btn btn-info" style="width: 67px;">Edit</button></a> 
</c:if> 



<c:if test="${name == u.getId()|| name == 1}">
 <c:if test="${u.getId() != 1}">
       <a href="delete.jsp?id=${u.getId()}"><button type="button" class="btn btn-danger">Delete</button></a>  
      
</c:if>
</c:if>



 
</td>
</tr>
</c:forEach> 


</table>
</div>






</center>


<a href="signup.jsp"><button class="btn btn-warning" style="width: 100px;margin-top:10px">Add User</button></a>
<a href="index.jsp"><button class="btn btn-primary" style="width: 100px;margin-top:10px">Log Out</button></a>


</div>

</div>
</div>

</body>
</html>