package Controler;

import java.io.IOException;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import dao.StudentOperation;

 
@WebServlet("/LoginControler")
public class LoginControler extends HttpServlet {
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		if(username.equals("admin")) {
			if(password.equals("admin"))
			{
				response.sendRedirect("AdminHomePage.jsp");
			}else {
				response.sendRedirect("LoginPage.jsp?message=Wrong admin password");
			}
		}
		else {
		StudentOperation sto=new StudentOperation();
		 Student st=sto.searchByUsername(username);
		  
		if(st!=null)
		{   
			if(st.getPassword().equals(password))
			{
				long id=st.getS_id();
				 response.sendRedirect("StudentHomePage.jsp?id="+id);
			}
			else {
				  
				response.sendRedirect("LoginPage.jsp?message=Wrong Password");
			}
		}
		else {
 
			response.sendRedirect("LoginPage.jsp?message=User is not registered");
		}
		
		}
		
	}

}
