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
<title>Insert title here</title>
</head>
<body bgcolor="cyan">

	<form>
		<div>
			<input type="text" placeholder="Search.." name="search">
			<button type="submit" name="search_submit">Submit</button>
		</div>
	</form>
	<%
		//out.println("search value is"+request.getParameter("search_submit"));
		if (request.getParameter("search") != null) {
			if (request.getParameter("search") != "") {
				//out.println("search value is :" + request.getParameter("search_submit"));
	%>
	<div>
		<table class="table table-stiped" style="width: 100%" bcolor="cyan">
			 
				<tr>
					<td>Id</td>
					<td>Name</td>
					<td>Address</td>
					<td>Contact</td>
					<td>Course</td>
					<td>Subject Taken</td>
					<td>Username</td>
				</tr>
				<%
					StudentOperation st1 = new StudentOperation();
							List lt1 = st1.searchByName(request.getParameter("search"));
							ListIterator lit1 = lt1.listIterator();
							while (lit1.hasNext()) {
								Student student = (Student) lit1.next();
				%>
				<tr>
					<td><%=student.getS_id()%></td>
					<td><%=student.getName()%></td>
					<td><%=student.getAddress()%></td>
					<td><%=student.getContact()%></td>
					<td><%=student.getCourse()%></td>
					<td></td>
					<td><%=student.getUsername()%></td>
					<td><a href="Update.jsp?id=<%=student.getS_id()%>">Update</a></td>
					<td><a href="DeleteStudent.jsp?id=<%=student.getS_id()%>">Delete</a></td>
						  <%
 	}
 %>
			</tbody>


		</table>
		<hr>
		<%
			}
			}
		%>
	</div>



	<br>
	<table class="table table-stiped" style="width: 100%" bcolor="cyan">
		<tbody>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Address</th>
				<th>Contact</th>
				<th>Course</th>
				<th>Subject taken  </th>
				<th>Username</th>
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
		 

	</table>
</body>
</html>