<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%! 
  
%>

<jsp:useBean id="formHandler" class="insert.log" scope="request">
<jsp:setProperty name="formHandler" property="*"/>
</jsp:useBean>
<% 

String UserName = request.getParameter("userName");
session.setAttribute("user",UserName);  

//System.out.println("before");
if (formHandler.validate()) {
	//System.out.println("After");
	//int i = UserDao.username_check(formHandler);
	//System.out.println("saved");
	//if (i > 0) {
	//	System.out.println("after saved");
%>
<jsp:forward page="list.jsp"/>
<%
//}
}else {
	//System.out.println("retry");
%>
<jsp:forward page="index.jsp"/>
<%
}
%>