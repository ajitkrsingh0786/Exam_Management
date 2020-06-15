package Controler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Answer;
import dao.AnswerDeclaration;
import dao.AnswerOperation;
 
@WebServlet("/AdminAnswerAprrovalControler")
public class AdminAnswerAprrovalControler extends HttpServlet {
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		String approve=request.getParameter("approve");
		long ans_id=Long.parseLong(request.getParameter("ans_id"));
		 
		AnswerOperation anso=new AnswerOperation();
		Answer ans=anso.selectAnswerById(ans_id);
		
		ans.setWriteORwrong(approve);
		
		AnswerDeclaration ansd=new AnswerOperation();
		long id1=ansd.upDate(ans_id, ans);
		PrintWriter out = response.getWriter();
		if (id1 > 0) {
			out.println("successfull");
			//response.sendRedirect("");
		} else {
			out.println("not successful");
		}
		
	}

}
