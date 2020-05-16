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


@WebServlet("/SubjectFinalUpdate")
public class SubjectFinalUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("id")!=null) {
		String sub_name;
		int id,sub_max_marks,sub_passing_marks, sub_total_questions, sub_duration, sub_fees, sub_offer;
       id=Integer.parseInt(request.getParameter("id"));
		sub_name=request.getParameter("name");
		sub_max_marks=Integer.parseInt(request.getParameter("marks"));
		sub_passing_marks=Integer.parseInt(request.getParameter("pass marks"));
		sub_total_questions=Integer.parseInt(request.getParameter("questions"));
		sub_duration=Integer.parseInt(request.getParameter("course duration"));
		sub_fees=Integer.parseInt(request.getParameter("course fees"));
		sub_offer=Integer.parseInt(request.getParameter("offer"));
		
		Subject subject=new Subject(sub_name,sub_max_marks,sub_passing_marks,sub_total_questions,
				sub_duration,sub_fees,sub_offer);
		SubjectOperation sb=new SubjectOperation();
		int l=sb.upDate(id,subject);
		//PrintWriter out=new getWriter();
		if(l>0)
		{
			response.sendRedirect("ShowAllSubject.jsp" );
		}
		else
		{
			response.getWriter().println("update not success");
		}
		
		
	}
	}
}
