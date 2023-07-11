<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="insert.UserDao"%>  
<jsp:useBean id="u" class="test.FormBean"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
UserDao.delete(u); 
String Username=(String)session.getAttribute("user"); 
if(Username.equals("admin@gmail.com")){
	response.sendRedirect("list.jsp");
}
else{
response.sendRedirect("index.jsp");  
}
%> 