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
button {
	 
	color: white;
	 
	width: 10%;
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
         <body bgcolor="lightcyan">
    <div class="topnav">
		<a class="active" href="StudentHomePage.jsp">Home</a> <a href="#about">About</a> <a
			href="StudentPhase1.jsp">Take a test</a> <a
			href="TestResultPhase1.jsp">Test Result</a><a
			href="Logout">Log Out</a>
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