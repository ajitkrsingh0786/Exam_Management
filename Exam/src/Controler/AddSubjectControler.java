package Controler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import dao.SubjectOperation;


@WebServlet("/AddSubjectControler")
public class AddSubjectControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String sub_name;
		int sub_max_marks,sub_passing_marks, sub_total_questions, sub_duration, sub_fees, sub_offer;
       
		sub_name=request.getParameter("name");
		sub_max_marks=Integer.parseInt(request.getParameter("marks"));
		sub_passing_marks=Integer.parseInt(request.getParameter("pass marks"));
		sub_total_questions=Integer.parseInt(request.getParameter("questions"));
		sub_duration=Integer.parseInt(request.getParameter("course duration"));
		sub_fees=Integer.parseInt(request.getParameter("course fees"));
		sub_offer=Integer.parseInt(request.getParameter("offer"));
		
		Subject sb=new Subject(sub_name,sub_max_marks,sub_passing_marks,sub_total_questions,
				sub_duration,sub_fees,sub_offer);
		SubjectOperation sp=new SubjectOperation();
		long id=sp.insertSubject(sb);
		PrintWriter out=response.getWriter();
		if(id>0)
		{
			 response.sendRedirect("AddSubject.jsp?message=Subject added successfully");
		}else {out.println("not successful");}
		
	}

}
