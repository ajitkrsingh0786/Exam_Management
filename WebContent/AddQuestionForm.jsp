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
<title>Add Question Form</title>
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
    
   width: 100%;
    
}
tr{
  
 height:70px;
 }
  form.question {border: 3px solid black;
        background-color: cyan;
        width: 50%;
        margin-left: 25%;
        margin-right: 25%;
        margin-top: 5%;
  }
  div.form-group{
  margin-left: 5%;
        margin-right: 5%;
        margin-top: 5%;
  }
  
  input[type=submit]{
  width:50%;
  height:100%;
  margin-right: 25%;
        margin-top: 25%;
  
  }
  input[type=text], input[type=password],input[type=submit],select,option {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
   
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
	 
	
	  
	   
		<form class="question" action="AddQuestionControler" method="post">
			<div class="form-group">
				 
					<label>Select Any option to add question:</label><br> <select
						name="subject_name1" style="width: 200px">
						<%
							SubjectOperation so = new SubjectOperation();
							List li = so.selectSubjects();
							ListIterator it = li.listIterator();
							while (it.hasNext()) {
								Subject sb = (Subject) it.next();
						%>
						<option value="<%=sb.getSub_id()%>">
							<%=sb.getSub_name()%>
						</option>
						<%
							}
						%>
					</select>
				
			</div>
			 

			<div class="form-group">
				<label for="question Marks">Enter Question Marks:</label><br> <input
					type="text"   name="question_marks" 
					placeholder="question Marks">
			</div>
			 



			<div class="form-group" id="q_option">

				 
					<label for="question type">Select Question Type:</label><br> <select
						class="form-group" name="question_type" id="question_type">
						<option   name="practical" value="practical" selected>practical</option>
						<option   name="written" value="written">written</option>
						<option   name="optional" value="optional">optional</option>
					</select>
				 

			</div>

 
			 
			<div class="form-group">
				<label for="question Text">Enter Question Text:</label><br> <input
					type="text"   name="question_text"  
					placeholder="question Text">
			</div>
			 
			<div   class="form-group" id="qoption" style="">
				 
					<label for="question type">Give Options for this question</label><br>
					<input type="text" name="option1" id="option1"
						placeholder="option1"><br> <input type="text"
						name="option2" id="option2" placeholder="option2"><br>
					<input type="text" name="option3" id="option3"
						placeholder="option3"><br> <input type="text"
						name="option4" id="option3" placeholder="option4"><br>

				 
			</div>

			 
			
			
			<div class="form-group">
				<label for="answer text">Enter Answer Text:</label><br> <input
					type="text"   name="answer"  
					placeholder="answer text">
			</div>
			 
			<div class="form-group">
			<input type="submit" value="Add Subject" name="addsub"
				style=" background-color: green;">
			 </div>
		</form>
		<h1 style="color:red;"><%=request.getParameter("result")!=null?request.getParameter("result"):"" %></h1>
	</div>
      
	<script type="text/javascript" src="app1/jquery-3.5.0.js"></script>
	<script type="text/javascript"> 
 $(document).ready(function(){
	  
	 $('#q_option').change(function(){
		 
		var optionSelected=$(this).find("option:selected");
		var textSelected=optionSelected.text();
		if(textSelected=="optional")
			{
			$('#qoption').slideDown(1000);
			}
		  else{
			$('#qoption').slideUp();
			 
			  
		}

	 }
 })

 </script>


</body>
</html>