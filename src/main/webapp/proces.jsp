<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%! 
  
%>
<%@ page import="insert.UserDao" %>
<jsp:useBean id="formHandler" class="test.FormBean" scope="request">
<jsp:setProperty name="formHandler" property="*"/>
</jsp:useBean>
<% 

if (formHandler.validate()) {
	
	int i = UserDao.save(formHandler);
	//System.out.println(i);
	if (i > 0) {
		

       response.sendRedirect("index.jsp");

		
}
}else {
	
%>
<jsp:forward page="signup.jsp"/>
<%
}
%>