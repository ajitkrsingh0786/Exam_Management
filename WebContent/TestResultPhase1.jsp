<%@page import="bean.AddQuestions"%>
<%@page import="bean.Subject"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="bean.Student"%>
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
td{
 width:50%;
 height:50px;
 }


div.a {
	background-color: cyan;
	width: 70%;
	margin-right: 15%;
	margin-left: 15%;
	margin-top: 10%;
}

h2 {
	width: 70%;
	margin-left: 15%;
	margin-right: 15%;
	text-align: center;
}

table.a {
	width: 40%;
	margin-left: 30%;
	margin-right: 30%;
	text-align: center;
}
</style>
</head>
<body bgcolor="lightcyan">


	<div class="a">
		<%
			if (session.getAttribute("id") != null) {
		%>

		<h2>Select subject to see the result</h2>
		<%
			long st_id = Long.parseLong(session.getAttribute("id").toString());
				StudentOperation sto = new StudentOperation();
				Student st = sto.selectStudent(st_id);
				Set s = st.getSubject();
				Iterator<Subject> it = s.iterator();
		%><table class="a">
			<%
				while (it.hasNext()) {
						Subject sub = (Subject) it.next();
			%>
			<tr>
				<td><a href="Result.jsp?sub_id=<%=sub.getSub_id()%>"> <%=sub.getSub_name()%></a>
				</td>

			</tr>


			<%
				}
			%>
		</table>
		<%
			}
		%>


	</div>





</body>
</html>