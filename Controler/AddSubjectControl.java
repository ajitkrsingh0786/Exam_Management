package Controler;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import bean.Subject;
import dao.StudentOperation;
import dao.SubjectOperation;

 
@WebServlet("/AddSubjectControl")
public class AddSubjectControl extends HttpServlet {
	@Override 
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SubjectOperation so=new SubjectOperation();
		StudentOperation sto=new StudentOperation();
		Student st=null;
		Subject sub;
		long l=Long.parseLong(request.getParameter("id"));
		if(request.getParameter("addsub")!=null)
		{
			Enumeration paramname= request.getParameterNames();
			while(paramname.hasMoreElements())
			{
				String spname=paramname.nextElement().toString();
				String g=spname;
				
				if(!spname.equals("addsub"))
				{
					String c=request.getParameter(spname);
					if(!spname.equals("id"))
					{
						String a=request.getParameter(spname);
						int sub_id=Integer.parseInt(request.getParameter(spname));
					    st=sto.selectStudent(l);
					    sub=so.selectSubject(sub_id);
					    st.getSubject().add(sub);
					
					}
				}
			}
			
			if(st!=null) {
			long returnid=sto.upDate(l, st);
		
			if(returnid>0)
			{
				response.sendRedirect("Update.jsp?id="+l);
			}
			else {
				response.getWriter().println(l+" :retunrid: "+returnid);
			}
			}else {response.sendRedirect("Update.jsp?id="+l);}
			
			
		}
		
		
		
	}

}
