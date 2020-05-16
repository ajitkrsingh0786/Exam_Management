<%@page import="bean.Student"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="dao.StudentOperation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
h1{
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
table{
   width:90%;
   margin-left:5%;
   margin-right:5%;
    
}
th{
  
 height:70px;
 }
  
</style>
</head>

<body bgcolor="lightcyan">
 
<div class="topnav">
		<a class="active" href="">Home</a> <a href="#about">About</a> 
		<a href="AddSubject.jsp" >Add Subjects</a>
		<a href="AddQuestionForm.jsp" >Add Questions</a>
		<a href="ShowAllSubject.jsp" >Show all subjects</a>
		<a href="ShowAllQuestions.jsp" >Show all questions</a>
		
		<div class="search-container">
			<form action=" ">
				<input type="text" placeholder="Search for a subject.." name="search">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	</div>
 
<h1>Admin Home Page</h1>
<p style="margin-left:3%;">List of all students:</p>
 
	 <table class="table table-stiped" >
		 
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Address</th>
				<th>Contact</th>
				<th>Course</th>
				<th>Subject taken  </th>
				<th>Username</th>
				<th></th>
				<th></th>
			</tr>
			<%
				StudentOperation st = new StudentOperation();
				List lt = st.selectStudents();
				ListIterator lit = lt.listIterator();
				while (lit.hasNext()) {
					Student student = (Student) lit.next();
			%><tr>

				<th><%=student.getS_id()%></th>
				<th><%=student.getName()%></th>
				<th><%=student.getAddress()%></th>
				<th><%=student.getContact()%></th>
				<th><%=student.getCourse()%></th>
			    <th></th>
				<th><%=student.getUsername()%></th>
				<th><a href="Update.jsp?id=<%=student.getS_id()%>">Update</a></th>
				<th><a href="DeleteStudent.jsp?id=<%=student.getS_id()%>">Delete</a></th>
					<%
						}
					%>
		</tbody>


	</table>
	 
</body>
</html>