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
 * Servlet implementation class FinalUpdate
 */
@WebServlet("/FinalUpdate")
public class FinalUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       if(request.getParameter("id")!=null){
		String name, address, contact, course, username, password;
		int id=Integer.parseInt(request.getParameter("id"));
		name = request.getParameter("name");
		address = request.getParameter("address");
		contact = request.getParameter("cantact");
		course = request.getParameter("course");
		username = request.getParameter("username");
		password = request.getParameter("password");

		Student st = new Student(name, address, contact, course, username, password);
		StudentDeclaration sd = new StudentOperation();
		long id1=sd.upDate(id, st);
		PrintWriter out = response.getWriter();
		if (id1 > 0) {
			response.sendRedirect("ShowAllStudent.jsp");
		} else {
			out.println("not successful");
		}
	}

}
}
