<%@page import="bean.Subject"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
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
    text-align:center;
   width: 100%;
    
}
tr{
  
 height:70px;
 }
 div.a{
 width:90%;
 margin-left:5%;
 margin-right: 5%;
 }
  
</style>
</head>
<body bgcolor="cyan">

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
	
	
	<%
		//out.println("search value is"+request.getParameter("search_submit"));
		if (request.getParameter("search") != null) {
			if (request.getParameter("search") != "") {
				//out.println("search value is :" + request.getParameter("search_submit"));
	
	SubjectOperation st1 = new SubjectOperation();
							List lt1 = st1.searchByName(request.getParameter("search"));
							if(lt1!=null){
	%>
	<hr>
	<p>Searched name:</p>
	<div>
		<table class="table table-stiped" style="width: 100%" bcolor="cyan">
			<tbody>
				<tr>
					<th>Id</th>
					<th>Subject Name</th>
					<th>Subject Marks</th>
					<th>Passing Marks</th>
					<th>Number of questions</th>
					<th>Course Duration</th>
					<th>Course fees</th>
					<th>Offer</th>
					<th></th>
				    <th></th>
				</tr>
				<%
					 
							ListIterator lit1 = lt1.listIterator();
							while (lit1.hasNext()) {
								Subject subject1 = (Subject) lit1.next();
				%>
				<tr>
				<td><%=subject1.getSub_id()%></td>
				<td><%=subject1.getSub_name()%></td>
				<td><%=subject1.getSub_max_marks()%></td>
				<td><%=subject1.getSub_passing_marks()%></td>
				<td><%=subject1.getSub_total_questions()%></td>
				<td><%=subject1.getSub_duration()%></td>
				<td><%=subject1.getSub_fees()%></td>
				<td><%=subject1.getSub_offer()%></td>
				<td><a href="UpdateSubject.jsp?id=<%=subject1.getSub_id() %> ">Update</a></td>
				<td><a href="SubjectDelete.jsp?id=<%=subject1.getSub_id() %> ">Delete</a></td>
			</tr> <%
 	}
 %>
			</tbody>


		</table>
		 
		<%
			}else{
				
				%> 
				<p>There is no match:</p>
				
				 <%
				
				
			}
							
			}
			
			}
		%>
	 
    


	
	
	<%
	%>
	</tbody>
	</table>



<hr>
<div class="a"> 
<p>All Available Subjects:</p>
	<table class="table table-stiped" style="width: 100%">
		<tbody>

			<tr>
				<th>Id</th>
				<th>Subject Name</th>
				<th>Subject Marks</th>
				<th>Passing Marks</th>
				<th>Number of questions</th>
				<th>Course Duration</th>
				<th>Course fees</th>
				<th>Offer</th>
				<th></th>
				<th></th>
			</tr>

			<%
				SubjectOperation sb = new SubjectOperation();
				List li = sb.selectSubjects();
				if(li!=null){
				ListIterator lit = li.listIterator();
				while (lit.hasNext()) {

					Subject subject = (Subject) lit.next();
			%>
			<tr>
				<td><%=subject.getSub_id()%></td>
				<td><%=subject.getSub_name()%></td>
				<td><%=subject.getSub_max_marks()%></td>
				<td><%=subject.getSub_passing_marks()%></td>
				<td><%=subject.getSub_total_questions()%></td>
				<td><%=subject.getSub_duration()%></td>
				<td><%=subject.getSub_fees()%></td>
				<td><%=subject.getSub_offer()%></td>

				<td><a href="UpdateSubject.jsp?id=<%=subject.getSub_id() %> ">Update</a></td>
				<td><a href="SubjectDelete.jsp?id=<%=subject.getSub_id() %> ">Delete</a></td>
			</tr>
           <%
				}}else{
					
					out.println("no any subject to show,first add a subject:");
					%> <hr><%
				}
			%>
		</tbody>
	</table>
	</div>
</body>
</html>