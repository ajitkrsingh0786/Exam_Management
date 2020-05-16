<%@page import="dao.QuestionOperation"%>
<%@page import="bean.Answer"%>
<%@page import="java.util.ListIterator"%>
<%@page import="bean.Student"%>
<%@page import="dao.AnswerOperation"%>
<%@page import="bean.AddQuestions"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="bean.Subject"%>
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
	text-align:center;
}
div {
	background-color: lightblue;
}
 </style>
</head>
<body bgcolor="cyan">
      <%if(session.getAttribute("id")!=null)
      {
    	long st_id=Long.parseLong(session.getAttribute("id").toString());  
    	  int sub_id=Integer.parseInt(request.getParameter("sub_id"));
    	  StudentOperation sto=new StudentOperation();
    	  SubjectOperation subo=new SubjectOperation();
    	  AnswerOperation ao=new  AnswerOperation();
    	  QuestionOperation qo1=new QuestionOperation();
    	  int i=0;
    	  long qpre_id=0;
    	  Student st=sto.selectStudent(st_id);
    	  Subject sub= subo.selectSubject(sub_id);
    	  List li= ao.selectAnswer();
    	   int k=li.size();
    	  ListIterator lit=li.listIterator();
    	  
    	   %><div> 
    	   <p><%=k %>
    	   <table width="100%"><%
    			   while(lit.hasNext())
    	    	   {
    	    		    
    	    		   
    	    		    Answer ans1=(Answer)lit.next();
    	    		    
    	    		    if(ans1.getSt1().getS_id()==st_id && ans1.getSub1().getSub_id()==sub_id)
    	    		    {
    	    		    	i++;
    	    		     AddQuestions q=(AddQuestions)ans1.getQuestion();
    	    		     
    	    		    
    	    		   
    	    		   %>
    	    		    
    	    		   <tr> 
    	    		      <td width="25%">Question.No(<%=i %>)</td>
    	    		      <td width="50%"><%=q.getQuestion_text() %></td>
    	    		      <td width="25%"><span style="color:orange;">(for <%=q.getQ_marks() %> marks)</span></td>
    	    		   </tr>
    	    		   <tr> 
    	    		      <td width="25%">Your answer</td>
    	    		      <td width="50%"><%=ans1.getSubmit_answer() %></td>
    	    		      <td width="25%"><%=ans1.getWriteORwrong() %></span></td>
    	    		   </tr>
    	    		    <tr> 
    	    		      <td width="25%" style="background-color:cyan;"></td>
    	    		      <td width="50%" style="background-color:cyan;"></td>
    	    		      <td width="25%" style="background-color:cyan;"></td>
    	    		   </tr>
    	    		   <%
    	    		    } }
    	  
    	  
      } 
    	  
    	  %>
     </table>
  </div>

</body>
</html>