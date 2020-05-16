

<%@page import="bean.Answer"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="dao.AnswerOperation"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Date"%>
<%@page import="bean.Student"%>
<%@page import="dao.StudentOperation"%>
<%@page import="bean.QuestionOptions"%>
<%@page import="bean.AddQuestions"%>

<%@page import="bean.Subject"%>
<%@page import="dao.SubjectOperation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
input[type=submit] {
	padding: 5px 15px;
	allingment: center border:0 none;
	cursor: pointer;
}

div {
	background-color: lightblue;
}

.submit {
	text-align: center;
}

h1.completed {
	background-color: green;
}
</style>

</head>
<body bgcolor="cyan">
	<%
		if (session.getAttribute("id")!=null) {
			int sub_id =Integer.parseInt(request.getParameter("Sub_id"));
			long st_id =Long.parseLong(session.getAttribute("id").toString());
			StudentOperation sto = new StudentOperation();
			SubjectOperation subo = new SubjectOperation();
			Student st = sto.selectStudent(st_id);
			Subject sub1 = subo.selectSubject(sub_id);
			AnswerOperation aop = new AnswerOperation();
			int i = 0;

			int size1 = 0;
			int asize = 0;
			boolean answer_already_submmited = false;

			Set s = sub1.getQuestion();
			size1 = s.size();
			Iterator<AddQuestions> it = s.iterator();
             int l=0,m=0;
			while (it.hasNext()) {
                    l++;
				AddQuestions q = (AddQuestions) it.next();
				long check_qid = q.getQ_id();

				List li = aop.selectAnswer();
				asize = li.size();
				if (li != null) {
					ListIterator lit = li.listIterator();

					while (lit.hasNext()) {
						Answer ans = (Answer) lit.next();
						if (ans.getQuestion().getQ_id() == check_qid && ans.getSt1().getS_id() == st_id
								&& ans.getSub1().getSub_id() == sub_id) {
							answer_already_submmited = true;
						}
                           
					}
				}
				 
				if (!answer_already_submmited) {
                    
					i++;
	%><div>
		<form action="AnswerControler" method="post">
			<%
				if (q.getQuestion_type().equals("optional")) {
								QuestionOptions op = q.getOpt();
			%>
			<p>
				Question Type:<%=q.getQuestion_type()%>
				&emsp; (for
				<%=q.getQ_marks()%>
				marks)
			</p>
			<p>
				Q.No-><%=i%>:<%=q.getQuestion_text()%>
				&emsp;<span style="color: blue;"> (for <%=q.getQ_marks()%>
					marks)
				</span>
			</p>
			&emsp;<input type="checkbox" name="answer"
				value="<%=op.getOption_1()%>"> <label for="option_1"><%=op.getOption_1()%></label><br>

			&emsp;<input type="checkbox" name="answer"
				value="<%=op.getOption_2()%>"> <label for="option_2"><%=op.getOption_2()%></label><br>

			&emsp;<input type="checkbox" name="answer"
				value="<%=op.getOption_3()%>"> <label for="option_3"><%=op.getOption_3()%></label><br>

			&emsp;<input type="checkbox" name="answer"
				value="<%=op.getOption_4()%>"> <label for="option_4"><%=op.getOption_4()%></label><br>

			<%
				} else {
			%>
			<p>
				Question Type:<%=q.getQuestion_type()%>
				&emsp;<span style="color: blue;"> (for <%=q.getQ_marks()%>
					marks)
				</span>
			</p>
			<p>
				Q.No-><%=i%>:<%=q.getQuestion_text()%>
				&emsp; (for
				<%=q.getQ_marks()%>
				marks)
			</p>
			<textarea name="answer" rows="4" cols="100"> </textarea>
			<%
				}
			%>
			<input type="hidden" value="<%=st_id%>" name="st_id"> <input
				type="hidden" value="<%=sub_id%>" name="sub_id"> <input
				type="hidden" value="<%=q.getQ_id()%>" name="q_id"> <input
				type="submit" class="submit">
			 
		</form>
	</div>
      

	<%
		} 
			}
			
			if(size1>0 && i==0 ){
				%><h1>You have already given the test: (<a href="Result.jsp" name="sub_id" value="<%=st_id %>" >see the result</a>)</h1><%
			}
			if(size1==0)
			{
				%><h1>There is no any qestion is added for this subject contact to admin</h1> <% 
			}
			
			 
		} 
		else {
			response.sendRedirect("StudentHomePage");
		}
	%>
</body>
</html>