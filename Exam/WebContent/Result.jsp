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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
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

div.header {
	text-align: center;
}

button {
	color: white;
	width: 10%;
}

td {
	height: 50px;
}

div.table1 {
	background-color: cyan;
	width: 80%;
	margin-left: 10%;
	margin-right: 10%;
	margin-top: 5%;
}
</style>
</head>
<body bgcolor="lightcyan">
	<div class="topnav">
		<a class="active" href="StudentHomePage.jsp">Home</a> <a href="#about">About</a>
		<a href="StudentPhase1.jsp">Take a test</a> <a
			href="TestResultPhase1.jsp">Test Result</a><a href="Logout">Log
			Out</a>
		<div class="search-container">
			<form onsubmit="return searchValidation()" action=" ">
				<input id="search" type="text" placeholder="Search for a subject.."
					name="search">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	</div>
	<%
		if (session.getAttribute("id") != null) {
			long st_id = Long.parseLong(session.getAttribute("id").toString());
			int sub_id = Integer.parseInt(request.getParameter("sub_id"));
			StudentOperation sto = new StudentOperation();
			SubjectOperation subo = new SubjectOperation();
			AnswerOperation ao = new AnswerOperation();
			QuestionOperation qo1 = new QuestionOperation();
			int i = 0;
			int obtain_marks = 0;
			int total_marks = 0;
			long qpre_id = 0;
			Student st = sto.selectStudent(st_id);
			Subject sub = subo.selectSubject(sub_id);
			List li = ao.selectAnswer();
			int k = li.size();
			ListIterator lit = li.listIterator();
	%><div class="table1">
		<p>
		<table id="mytab1" width="100%">
			<h2>Result:-</h2>
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
				<td width="25%"><span>(for <%=q.getQ_marks()%> marks) <%
					total_marks = total_marks + q.getQ_marks();
				%>
				</span></td>
			</tr>
			<tr>
				<td width="25%">Your answer</td>
				<td width="50%"><%=ans1.getSubmit_answer()%></td>
				<td id="answer" width="25%"><%=ans1.getWriteORwrong()%></span></td>
				<%
					if (ans1.getWriteORwrong().equals("right")) {
									obtain_marks = obtain_marks + q.getQ_marks();
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
		<p>
			Marks obtain <%=obtain_marks %> out of <%=total_marks %> marks <span><a
				onclick="return certificateValidation()" href="#"
				style="margin-left: 80%; margin-right: 2%;">Generate Certificate</a>
			</span>
		</p>
			<%
				}
			%>
		 
		 
		<br>
		 
		<br>
		<br>
		<br>
	</div>
	<br>
	<br>
	<br>




	<script type="text/javascript">
		var table = document.getElementById("mytab1");
		var r = 0; //start counting rows in table
		while (row = table.rows[r++]) {
			var c = row.cells[2].innerHTML; //start counting columns in row
			if (c == "wrong") {
				row.cells[2].style.color = "red";
			}
			if (c == "right") {
				row.cells[2].style.color = "green";
			}
			if (c == "approval pending") {
				row.cells[2].style.color = "orange";

			}

		}

		function searchValidation() {

			var search = document.getElementById("search").value;
			if (search == "") {
				return false;
			} else {
				return false;
			}

		}

		function certificateValidation() {
			return false;
		}
	</script>

</body>
</html>