<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="bean.Subject"%>
<%@page import="bean.Student"%>
<%@page import="dao.StudentOperation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Phase-1</title>
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

form.action{
width 50%;
margin-right: 25%;
margin-left: 25%;
background-color: cyan;
margin-top: 8%;

}
p{
   text-align: center;
}

select,input{
width: 50%;
margin-left: 25%;
 margin-right: 25%;
 height: 40px;
}




</style>
</head>
<body bgcolor="lightcyan">
   <% if(session.getAttribute("id")!=null){
	   
   %>
     

<div class="topnav">
		<a class="active" href="">Home</a> <a href="#about">About</a>  
		<div class="search-container">
			<form action=" ">
				<input type="text" placeholder="Search for a subject.." name="search">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	</div>
	  
	  
	  <form class="action" action="QuestionAnswerPage.jsp">
       <div class="form-phase1"  >
       <h1>Examination Process ->Phase-1</h1><br>
        
       
				<p>
					<label for="Subject" >Select Subject to take test:</label><br>  
					<br><br>
					
					<select  
						class="form-phase1" name="Sub_id">
						
						<% 
						long id1=Integer.parseInt(session.getAttribute("id").toString());
						StudentOperation sto=new StudentOperation();
						Student st1=sto.selectStudent(id1);
						Set  s =st1.getSubject();
						 Iterator<Subject> it= s.iterator();
						  
						 while(it.hasNext())
						 {
							 Subject sb1=(Subject)it.next();
						
						%>
						
						<option   value="<%= sb1.getSub_id() %>"> <%= sb1.getSub_name() %></option>
						  
						  <% }
						 %>
						 </select>
				</p>
				<p> 
			<input type="submit" name="Take test" value="Take test" style="background-color: lightgreen;">	
          </p>
          </div>
          
            
          
			 
			
						 <p><%=st1.getName() %> </p>
			</form>			 
         <%
   }
   else{
	   response.sendRedirect("StudentHomePage.jsp");
   }
         %>
       
</body>
</html>