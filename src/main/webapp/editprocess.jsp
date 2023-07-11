<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%! 
  
%>
<%@ page import="insert.UserDao" %>
<jsp:useBean id="formHandler" class="test.EditBean" scope="request">
<jsp:setProperty name="formHandler" property="*"/>
</jsp:useBean>
<% 
int i = UserDao.update(formHandler);
//System.out.println("before1");
if (formHandler.validate()) {
	
	//System.out.println("After1");
	
	//System.out.println("saved1");
	if (i > 0) {
		//System.out.println("after saved1");
%>
<jsp:forward page="list.jsp"/>
<%
}
}else {
	//System.out.println("retry1");
%>
<jsp:forward page="edit.jsp"/>
<%
}
%>