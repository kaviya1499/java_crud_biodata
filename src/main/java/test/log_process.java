package test;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class log_process extends HttpServlet {
	 public user_login() {
	        super();
	          }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	                 String username = request.getParameter("userName");
	                 String password = request.getParameter("password");
	                 if(username.isEmpty() || password.isEmpty() )
	                 {
	                           RequestDispatcher requ = request.getRequestDispatcher("retry.jsp");
	                           requ.include(request, response);
	                 }
	                 else
	                 {
	                           RequestDispatcher requ =       request.getRequestDispatcher("success.jsp");
	                           requ.forward(request, response);
	                 }
	        }

}
