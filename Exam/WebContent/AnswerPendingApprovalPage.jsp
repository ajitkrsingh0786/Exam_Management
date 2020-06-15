<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="bean.Answer"%>
<%@page import="dao.AnswerOperation"%>
<%@page import="bean.AddQuestions"%>
<%@page import="bean.QuestionOptions"%>
<%@page import="bean.Subject"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="bean.Student"%>
<%@page import="dao.QuestionOperation"%>
<%@page import="dao.SubjectOperation"%>
<%@page import="dao.StudentOperation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
table{
   width:90%;
   margin-left:5%;
   margin-right:5%;
    
}
 
td {
	height: 50px;
}
div.table1 {
	background-color: cyan;
	width:80%;
	margin-left:10%;
	margin-right: 10%;
	margin-top:5%; 
}

</style>
</head>
<body bgcolor="lightcyan">
<div style="background-color: cyan;">
  
 <%
 if(request.getParameter("id")!=null)
 {    
	 %><form action="AdminAnswerAprrovalControler" ><%
	 
	 
	   long st_id=Long.parseLong(request.getParameter("id"));
	   int sub_id=Integer.parseInt(request.getParameter("sub_id"));
	   long q_id=Long.parseLong(request.getParameter("q_id"));
	   long ans_id=Long.parseLong(request.getParameter("ans_id"));
	   StudentOperation sto=new StudentOperation();
	   SubjectOperation subo=new SubjectOperation();
	   QuestionOperation qo=new QuestionOperation();
	   AnswerOperation anso=new AnswerOperation();
	   Student st=sto.selectStudent(st_id);
	   Set s=st.getSubject();
	   Iterator it=s.iterator();
	   while(it.hasNext())
	   {
		 Subject sub=(Subject)it.next();
		   if(sub.getSub_id()==sub_id)
		   {
			  Set s1= sub.getQuestion();
			  Iterator it1=s1.iterator();
			  while(it1.hasNext())
			  {
				 AddQuestions q=(AddQuestions)it1.next();
				 if(q.getQ_id()==q_id)
				 {
					 Answer ans=anso.selectAnswerById(ans_id);
					 %>
					 <table>
					      <tr>
					      <td>Q_id:<%=q.getQ_id() %></td>
					      <td> <%=q.getQuestion_text() %></td>
					      <td>(For <%=q.getQ_marks() %>  marks) </td>
					       					      
					      </tr>
					      <tr>					      
					       
					      <td>Correct Answer</td>
					      <td> <%=q.getAnswer_text() %></td>
					      <td></td>	          
					      </tr>
					     
					     <tr>					      
					       
					      <td>Student's Answer</td>
					      <td><%=ans.getSubmit_answer() %>  </td>
					      <td></td>	          
					      </tr>
					     
					 
					 </table>
					 <div style="text-align: center;">
					  
					 <h4 style="text-align:left;">Comments:-</h4>
					 <textarea name="answer" rows="4" cols="100" placeholder="Write your comments here"></textarea>
					 <input type="hidden" value=<%=ans_id%> name="ans_id" >
					 <button type="submit" name="approve" value="right">Approve Correct</button>
					 <button type="submit" name="approve" value="wrong"> Approve Wrong</button>
					  
					 
					 </div>
					 
					 <%
					  
				 }
				 
			  }
		   }
		 
	   }
	   %></form><%
 }else
 {
	 response.sendRedirect("LoginPage.jsp");
 }
 
 %>
 </div>
</body>
</html>