<%@page import="bean.Subject"%>
<%@page import="dao.SubjectOperation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update the subject</title>
<style type="text/css">
input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

input[type=submit] {
	width: 40%;
	margin-right: 30%;
	margin-left: 30%;
	padding: 12px 20px;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

h1, h2 {
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

form {
	width: 60%;
	border-color: black;
	border-width: thick;
	margin-left: 20%;
	margin-right: 20%;
	background-color: cyan;
}
</style>
</head>
<body>
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

	<%
		if (request.getParameter("id") != null) {

			int id = Integer.parseInt(request.getParameter("id"));
			SubjectOperation sb = new SubjectOperation();
			Subject subject = sb.selectSubject(id);
			if (subject != null) {
	%>
	<form action="SubjectFinalUpdate" method="post">

		<div class="container">
			<h1>Update Here</h1>
			<p>Please fill in the form to update Subject details:</p>
			<hr>

			<label for="name"><b>Subject name</b></label><br> <input
				type="text" placeholder="Subject name" size="100" name="name"
				value=<%=subject.getSub_name()%> required><br> <label
				for="marks"><b>Subject Marks</b></label><br> <input type="text"
				placeholder="subject marks" name="marks" size="100"
				value=<%=subject.getSub_max_marks()%> required><br> <br>
			<label for="passing marks"><b>Passing Marks</b></label><br> <input
				type="text" placeholder="passing marks" name="pass marks" size="100"
				value=<%=subject.getSub_passing_marks()%> required><br>

			<label for="questions"><b>Number of questions</b></label><br> <input
				type="text" placeholder="number of questions" name="questions"
				size="100" value=<%=subject.getSub_total_questions()%> required><br>
			<br> <label for="course duration"><b>Course Duration</b></label><br>
			<input type="text" placeholder="Course Duration"
				name="course duration" size="100"
				value=<%=subject.getSub_duration()%> required><br> <label
				for="fees"><b>Course fees</b></label><br> <input type="text"
				placeholder="Course fees" name="course fees" size="100"
				value=<%=subject.getSub_fees()%> required><br> <label
				for="offer"><b>Offer in %</b></label><br> <input type="text"
				placeholder="Offer" name="offer" size="100"
				value=<%=subject.getSub_offer()%> required><br> <input
				type="hidden" name="id" value=<%=subject.getSub_id()%> required><br>

			<input type="submit" value="update" style="background-color: lightgreen;">
			<hr>

		</div>
	</form>





	<%
		}
		}
	%>



</body>
</html>