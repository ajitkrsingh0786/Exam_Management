package Controler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import dao.StudentDeclaration;
import dao.StudentOperation;

/**
 * Servlet implementation class RegistrationControler
 */
@WebServlet("/RegistrationControler")
public class RegistrationControler extends HttpServlet {
	
    
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name,address,contact,course,username,password;
		name=request.getParameter("name");
		address=request.getParameter("address");
		contact=request.getParameter("cantact");
		course=request.getParameter("course");
		username=request.getParameter("username");
		password=request.getParameter("password");
		
		Student st=new Student(name,address,contact,course,username,password);
		StudentDeclaration sd =new StudentOperation(); 
		long id=sd.insertStudent(st);
		PrintWriter out=response.getWriter();
		if(id>0)
		{
			 response.sendRedirect("StudentRegistration.jsp?message=Successfully Registered");
		}else {out.println("not successful");}
	}

}
