package Controler;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AddQuestions;
import bean.Answer;
import bean.Student;
import bean.Subject;
import dao.AnswerOperation;
import dao.QuestionOperation;
import dao.StudentOperation;
import dao.SubjectOperation;

 
@WebServlet("/AnswerControler")
public class AnswerControler extends HttpServlet {
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	String submit_answer= request.getParameter("answer");
	 
	long st_id=Long.parseLong(request.getParameter("st_id"));
	long q_id=Long.parseLong(request.getParameter("q_id"));
	int sub_id=Integer.parseInt(request.getParameter("sub_id"));
	
	StudentOperation sto=new StudentOperation();
	SubjectOperation subo1=new SubjectOperation();
	 QuestionOperation qo=new QuestionOperation();
	 
	 Student st=sto.selectStudent(st_id);
	 Subject sub2=subo1.selectSubject(sub_id);
	  AddQuestions q=qo.selectQuestion(q_id);
	
	String date=new Date().toString();
	 
	Answer ans=new Answer(sub2,st,q,submit_answer,"wrong",date);
	AnswerOperation anso=new AnswerOperation();
	long ans_id=anso.insertAnswer(ans);
	if(ans_id>0)
	{
	   response.sendRedirect("QuestionAnswerPage.jsp?Sub_id="+sub_id);
		//response.getWriter().println("submited");
	}else {
		response.getWriter().println("some problem in answer subbmition");
	}
		
	
	}
}
