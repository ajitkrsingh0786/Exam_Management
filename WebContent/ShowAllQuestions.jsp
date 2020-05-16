<%@page import="bean.Subject"%>
<%@page import="bean.AddQuestions"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>

<%@page import="dao.QuestionOperation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
<
style type ="text/css">h1 {
	text-align: center;
}

* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}

.topnav {
	overflow: hidden;
	background-color: #e9e9e9;
}

.topnav a {
	float: left;
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.topnav a.active {
	background-color: #2196F3;
	color: white;
}

.topnav .search-container {
	float: right;
}

.topnav input[type=text] {
	padding: 6px;
	margin-top: 8px;
	font-size: 17px;
	border: none;
}

.topnav .search-container button {
	float: right;
	padding: 6px 10px;
	margin-top: 8px;
	margin-right: 16px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

.topnav .search-container button:hover {
	background: #ccc;
}

@media screen and (max-width: 600px) {
	.topnav .search-container {
		float: none;
	}
	.topnav a, .topnav input[type=text], .topnav .search-container button {
		float: none;
		display: block;
		text-align: left;
		width: 100%;
		margin: 0;
		padding: 14px;
	}
	.topnav input[type=text] {
		border: 1px solid #ccc;
	}
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

table {
	text-align: center;
	width: 100%;
}

tr {
	height: 70px;
}

form {
	width: 90%;
	margin-left: 5%;
	margin-right: 5%;
	background-color: cyan;
}
</style>
</head>
<body bgcolor="lightcyan">

	<div class="topnav">
		<a class="active" href="">Home</a> <a href="#about">About</a> <a
			href="AddSubject.jsp">Add Subjects</a> <a href="AddQuestionForm.jsp">Add
			Questions</a> <a href="ShowAllSubject.jsp">Show all subjects</a> <a
			href="ShowAllQuestions.jsp">Show all questions</a>
		<div class="search-container">
			<form action=" ">
				<input type="text" placeholder="Search for a subject.."
					name="search">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>

		</div>
	</div>


	<form>

		<p>All Available Questions:</p>
		<table style="width: 100%">

			<tr>
				<th>Subject</th>
				<th>Q_id</th>
				<th>Q_marks</th>
				<th>Q_type</th>
				<th>Question</th>
				<th>Answer</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>

			<%
				QuestionOperation qo = new QuestionOperation();
				List lt = qo.selectQuestions();
				ListIterator lti = lt.listIterator();
				while (lti.hasNext()) {
					AddQuestions qs = (AddQuestions) lti.next();
					Subject sb = qs.getSub();
			%>
			<tr>
				<%
					if (sb != null) {
				%>
				<td><%=sb.getSub_name()%></td>
				<%
					} else {
				%>
				<td>null</td>
				<%
					}
				%>

				<td><%=qs.getQ_id()%></td>

				<td><%=qs.getQ_marks()%></td>


				<td><%=qs.getQuestion_type()%></td>


				<td><%=qs.getQuestion_text()%></td>


				<td><%=qs.getAnswer_text()%></td>
				<td><a href="">Update</a>
				<td><a href="">Delete</a>
			</tr>

			<%
				}
			%>

		</table>

	</form>
	<br>
	<br>
</body>
</html>