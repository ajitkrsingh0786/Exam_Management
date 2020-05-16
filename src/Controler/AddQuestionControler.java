package Controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AddQuestions;
import bean.QuestionOptions;
import bean.Subject;
import dao.QuestionOperation;
import dao.QuestionOptionOperation;
import dao.SubjectOperation;

 
@WebServlet("/AddQuestionControler")
public class AddQuestionControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		int sub_id=Integer.parseInt(request.getParameter("subject_name1"));
		int q_marks=Integer.parseInt(request.getParameter("question_marks"));
		 String question_type1=request.getParameter("question_type");
		 String question_text=request.getParameter("question_text");
		 String answer_text=request.getParameter("answer");
		 long op_id = 0;
		 QuestionOptions qo1 = null;
		  
		 
		 if(question_type1.equals("optional")) {
			 String option_1=request.getParameter("option1");
			 String option_2=request.getParameter("option2");
			 String option_3=request.getParameter("option3");
			 String option_4=request.getParameter("option4");
			 
			   qo1= new QuestionOptions(option_1,option_2,option_3,option_4);
			 QuestionOptionOperation qoo=new QuestionOptionOperation();
			 
			   op_id= qoo.insertQuestionOptions(qo1);
			  
			   }
		 
		 Subject sb=new Subject();
		 SubjectOperation so=new SubjectOperation();
		 
		    sb= so.selectSubject(sub_id);
		 
		 AddQuestions qs=new AddQuestions(question_type1,question_text,answer_text,q_marks);
		    qs.setSub(sb);
		     
		    if(op_id>0 && qo1!=null)
			  {
				  qs.setOpt(qo1);
				  
			  }else {
				  response.getWriter().println("some thing wrong in Question_options ");
			  }
			 
		      
		 QuestionOperation qo=new QuestionOperation();
		 long id=qo.insertQuestion(qs);
		 if(id>0)
		 {
			 response.sendRedirect("AddQuestionForm.jsp?result=added successfully");
		 }
		 else {
			 response.getWriter().println("Some thing wrong");
		 }
		 
		 
	}

}
