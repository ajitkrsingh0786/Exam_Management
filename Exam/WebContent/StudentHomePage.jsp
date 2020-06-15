<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="bean.Subject"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="dao.SubjectOperation"%>
<%@page import="bean.Student"%>
<%@page import="dao.StudentOperation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
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

div.holepage {
	background-color: cyan;
}

td {
	width: 50%;
	height: 50px;
}

div.available {
	width: 30%;
	float: right;
	margin-top: 5%;
	margin-right: 15%;
}

div.taken {
	width: 30%;
	float: left;
	margin-left: 25%;
	margin-top: 5%;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 15px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

form.abc {
	width: 90%;
	margin-left: 5%;
	margin-right: 5%;
	background-color: cyan;
}

div.date {
	text-align: right;
}
</style>

<script>
	var d = new Date();
	document.getElementById("demo").innerHTML = d;
</script>
</head>

<body bgcolor="cyan">


	<div class="topnav">
		<a class="active" href="">Home</a> <a href="#about">About</a> <a
			href="StudentPhase1.jsp">Take a test</a> <a
			href="TestResultPhase1.jsp">Test Result</a><a href="Logout">Log
			Out</a>
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
	<section style="background-color: cyan">
		<div class="date">
			<p id="demo"></p>
			<script>
				var d = new Date();
				document.getElementById("demo").innerHTML = d;
			</script>

		</div>


		<div class="header">
			<h1>Welcome to Home Page</h1>
			<%
				long id = Long.parseLong(request.getParameter("id").toString());
				StudentOperation sto = new StudentOperation();
				Student st = sto.selectStudent(id);
			%>

			<h2>
				<%=st.getName()%></h2>
			<%
				session.setAttribute("id", id);
			%>
		</div>

		<div class="available">
			<form name="forms" onsubmit="return subject()" action="PayMent.jsp"
				method="get">


				<p>All Available Subjects:</p>
				<p id="message"></p>
				<table id="mytab1">
					<%
						SubjectOperation sb = new SubjectOperation();
						List li = sb.selectSubjects();
						if (li != null) {
							ListIterator lit = li.listIterator();
							while (lit.hasNext()) {

								Subject subject = (Subject) lit.next();
					%>
					<tr>
						<td><input type="checkbox" name="container"
							value="<%=subject.getSub_id()%>"> <label
							for="<%=subject.getSub_name()%>"><%=subject.getSub_name()%></label>
						</td>
					</tr>
					<%
						}
						}
					%>
					<tr>
						<td>
							<button type="submit" value="Add Subject" name="addsub">Add
								Subject</button>
						</td>
					</tr>
				</table>
			</form>
		</div>

		<div class="taken">
			<form name="forms2">
				<p>Subject taken by you:</p>

				<table>
					<%
						long id1 = id;
						StudentOperation sto1 = new StudentOperation();
						Student st1 = sto1.selectStudent(id1);
						Set s = st1.getSubject();
						Iterator<Subject> it = s.iterator();
						while (it.hasNext()) {
							Subject sb1 = (Subject) it.next();
					%>
					<tr>
						<td><input type="checkbox" value="<%=sb1.getSub_id()%>">
							<input type="hidden" name="container2"
							value="<%=sb1.getSub_id()%>"> <label
							for="<%=sb1.getSub_name()%>"><%=sb1.getSub_name()%></label><br>
							<p id="check"></p></td>
					</tr>
					<%
						}
					%>
				</table>
			</form>
		</div>
	</section>
	<script type="text/javascript">
		function subject() {
			var a = document.forms.container;
			var k = 0;
			var str1;
			var l = 0;
			for (var i = 0; i < a.length; i++) {
				// row.cells[0].value; //start counting columns in row  
				if (a[i].checked == true) {
					k++;
					str1 = a[i];
				}
			}
			if (k == 0) {
				document.getElementById("message").innerHTML = "Select a Subject";
				document.getElementById("message").style.color = "red";
				return false;
			} else if (k == 1) {

				var b = document.forms2.container2;
				//return false;
				for (var j = 0; j < b.length; j++) {

					if (str1.value == b[j].value) {
						l++
					}

				}
				//return false;
				if (l > 0) {
					document.getElementById("message").innerHTML = "Already taken";
					document.getElementById("message").style.color = "red";
					return false;
				}
				return true;
			} else {
				document.getElementById("message").innerHTML = "one subject at a time";
				document.getElementById("message").style.color = "red";
				return false;
			}

		}
	</script>

</body>
</html>