<%@page import="bean.AddQuestions"%>
<%@page import="bean.Answer"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="bean.Student"%>
<%@page import="bean.Subject"%>
<%@page import="dao.QuestionOperation"%>
<%@page import="dao.AnswerOperation"%>
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
   text-align: center;
    
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
<%
		if ( request.getParameter("id") != null) {
			long st_id =Long.parseLong(request.getParameter("id"));
			int sub_id =Integer.parseInt(request.getParameter("sub_id"));
			StudentOperation sto = new StudentOperation();
			SubjectOperation subo = new SubjectOperation();
			AnswerOperation ao = new AnswerOperation();
			QuestionOperation qo1 = new QuestionOperation();
			int i = 0;
			int obtain_marks=0;
			int total_marks=0;
			long qpre_id = 0;
			Student  st = sto.selectStudent(st_id);
			Subject sub = subo.selectSubject(sub_id);
			List li = ao.selectAnswer();
			int k = li.size();
			ListIterator lit = li.listIterator();
	%><div class="table1">
	<h2>Verify the Answers:-</h2>
		<p> 
		<table id="mytab1" width="100%">
		  
			<%
				while (lit.hasNext()) {

						Answer ans1 = (Answer) lit.next();

						if (ans1.getSt1().getS_id() == st_id && ans1.getSub1().getSub_id() == sub_id) {
							i++;
							AddQuestions q = (AddQuestions) ans1.getQuestion();
			%>

			<tr>
				<td width="25%">Question.No(<%=i%>)
				</td>
				<td width="50%"><%=q.getQuestion_text()%></td>
				<td width="25%"><span>(for <%=q.getQ_marks()%>
						marks)
				</span></td>
				<% total_marks=total_marks+q.getQ_marks(); %>
			</tr> 
			<tr>
			      
				<td width="25%">Student's answer</td>
				<td width="50%"><%=ans1.getSubmit_answer()%></td>
				<% if(ans1.getWriteORwrong().equals("approval pending")){	
				   %><td id="answer" width="25%"><a href="AnswerPendingApprovalPage.jsp?id=<%=st_id %>&sub_id=<%=sub_id %>&q_id=<%=q.getQ_id() %>&ans_id=<%=ans1.getAns_id() %>"  style="color:orange;"><%=ans1.getWriteORwrong()%></a></td><% 
				}
				else{
					%><td id="answer" width="25%"><%=ans1.getWriteORwrong()%></td><% 
				       if(ans1.getWriteORwrong().equals("right")){
				    	    obtain_marks=obtain_marks+q.getQ_marks();
				       }
				}
				
				%>
				 
			</tr>
			<tr>
				<td width="25%" style="background-color: lightcyan;"></td>
				<td width="50%" style="background-color: lightcyan;"></td>
				<td width="25%" style="background-color: lightcyan;"></td>
			</tr>
			<%
				}
					}
			%>
			<input id="i" type="hidden" value="<%=i%>">
			</table>
			<p>Marks obtain <%=obtain_marks  %> out of <%=total_marks %> marks 
			<span><a onclick="return certificateValidation()" href="#" style=" margin-left:60%;">Generate Certificate</a>
	  </span></p>
			<%
				}
			%>
		 
		<br>
		 
		 
	<br><br><br>
	</div>
	<br><br><br>
	 
	
	
	
	<script type="text/javascript">
	var table=document.getElementById("mytab1");
	var r=0; //start counting rows in table
	while(row=table.rows[r++])
	{
	  var c = row.cells[2].innerHTML; //start counting columns in row
	     if(c=="wrong")
	    	 {
	    	 row.cells[2].style.color="red";
	    	 }
		    if(c=="right")
		    	{
		    	row.cells[2].style.color="green";
		    	}
		     
	   
	  
	}
	
	    function searchValidation(){
	    	
	    	var search=document.getElementById("search").value;
	    	 if(search=="")
	    		 {
	    		 return false;
	    		 }
	    	 else
	    		 {
	    		 return false;
	    		 }
	    	
	    	
	    }
	    
	    function certificateValidation(){
	    	return false;
	    }
	    
	</script>

</body>
</html>