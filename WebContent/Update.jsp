<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ListIterator"%>
<%@page import="bean.Subject"%>
<%@page import="dao.SubjectOperation"%>
<%@page import="bean.Student"%>
<%@page import="dao.StudentOperation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Update page</title>

<style type="text/css">
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
   
}
input[type=submit]{
width:100%;
height: 100%;
}
div.a {
   width:50%;
	float:left;
	 
}
div.b {
   width:40%;
	float:right;
	margin-top:10%;
	 
}
 
table.a{
float: right;
}

table.b{
float: left;
}


table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
td{
 width:100%;
 height:50px;
 }
</style>


</head>
<body bgcolor="cyan">


	<%
		if (request.getParameter("id") != null) {
			long Id = Long.parseLong(request.getParameter("id"));
			StudentOperation st = new StudentOperation();
			Student student = (Student) st.selectStudent(Id);
			if (student != null) {
	%>
	<div class="a"> 
	<form action="FinalUpdate" method="post">


		<h1 style="text-align: center;">Update Here</h1>
		<p>Please update the details here</p>
		<hr>

		<label for="name"><b>name</b></label><br> <input type="text"
			placeholder="name" size="100" name="name"
			value=<%=student.getName()%> size="40" required><br> <label
			for="address"><b>Address</b></label><br> <input type="text"
			placeholder="address" size="100" name="address"
			value=<%=student.getAddress()%> size="40" required><br>

		<label for="contact"><b>Contact</b></label><br> <input
			type="text" placeholder="cantact" size="100" name="cantact" size="40"
			value=<%=student.getContact()%> required><br> <label
			for="course"><b>Course</b></label><br> <input type="text"
			placeholder="course name" size="100" name="course" size="40"
			value=<%=student.getCourse()%> required><br> <label
			for="username"><b>Username</b></label><br> <input type="text"
			placeholder="username" size="100" name="username" size="40"
			value=<%=student.getUsername()%> required><br> <input
			type="hidden" name="id" value=<%=student.getS_id()%>><br>
		<input type="hidden" name="password" size="100"
			value=<%=student.getPassword()%>>

		 
		<input type="submit" value="Update " style="font-size: 12pt; color: white; background-color: green; border: 2px solid #336600; padding: 3px">


	</form>
	</div>
<div class="b">
	<form action="AddSubjectControl" method="get">
		

		 
     <table class="a">
     <tr><th>
     <p style="color: red">All Available Subjects:</p></th></tr>
		<%
			SubjectOperation sb = new SubjectOperation();
					List li = sb.selectSubjects();
					if (li != null) {
						ListIterator lit = li.listIterator();
						while (lit.hasNext()) {

							Subject subject = (Subject) lit.next();
		%>
		<tr><td>
		<input type="checkbox" name="<%= subject.getSub_name() %>" value="<%= subject.getSub_id() %>"> 
		<label for="<%= subject.getSub_name() %>"><%= subject.getSub_name() %></label> 
          </td></tr>
		<%
			}
					}
		%>
    <tr><td>
         <input type="hidden" name="id" value="<%=Id%>">
        
		 
		<input type="submit" value="Add Subject" name="addsub"
			style=" background-color: green;">
           </td></tr>
</table>
	</form>
	 
	   
	<form>
	<table  class="b">
	<tr><th><p style="color: red">Subject taken by <%=student.getName()%></p></th></tr>
	
	<%
	long id1=Id;
	StudentOperation sto=new StudentOperation();
	Student st1=sto.selectStudent(id1);
	Set  s =st1.getSubject();
	 Iterator<Subject> it= s.iterator();
	 while(it.hasNext())
	 {
		 Subject sb1=(Subject)it.next();
		 %>
		 <tr>
		 <td style="background:lightgreen;">
		 <input type="checkbox" name="<%= sb1.getSub_name() %>" value="<%= sb1.getSub_id() %>"> 
		<label for="<%= sb1.getSub_name() %>"><%= sb1.getSub_name() %></label><br>
          </td>
          </tr>
           
		 <%  
	 }	
	%>
	<tr><td>
          <input type="submit" value="Delete Subject" name="deletsub"
			style=" background-color: green;">
           </td></tr>
	</table>
	</form>
	 
</div>

	<%
		}
		} else {
			out.println("The id is null");
			out.println(request.getParameter("id"));

		}
	%>
	

	 
	 
</body>
</html>