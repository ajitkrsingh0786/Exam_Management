<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Registration page</title>
   <style type="text/css">
   body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid black;}
   .container {
  padding: 15px;
}
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
   
}
input[type=submit]{
width: 40%;
   
  margin-right: 30%;
  margin-left: 30%;
   padding: 12px 20px;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

   span.a {
        float:right;
   }
   p.b {
         width: 40%;
   
   
  margin-left: 35%;
        color:green;
   }
   
   </style>
   <script type="text/javascript">
       function validate(){
    	   var password=getElementById(password).value;
    	   if(password.length<5)
    		   {
    		   
    		   getElementById(password).innerHTML
    		   }
       } 
   
   </script>
   
   
</head>
<body bgcolor="cyan">

    <form name="myForm" onsubmit="return validate()" action="RegistrationControler" method="post">
    
    <div class="container">
    <h1>Register Here  </h1>
    <%
     if(request.getParameter("message")!=null)
     {
    	 %>
    	 <p class="b"><%=request.getParameter("message") %></p>
    	 
    	 <%
     }
     
     
     %>
    <p>Please fill in the form to create account <span class="a"><a href="LoginPage.jsp">Return to login page</a></span></p>
    <hr>
    
    <label for="name"><b>name</b></label>
    <input type="text" placeholder="name" name="name" size="40" required>
    
    <label for="address"><b>Address</b></label>
    <input type="text" placeholder="address" name="address" size="40" required><br><br>
    
    <label for="contact"><b>Contact</b></label>
    <input type="text" placeholder="cantact" name="cantact" size="40" required>
    
    <label for="course"><b>Course</b></label>
    <input type="text" placeholder="course name" name="course" size="40" required><br><br>
    
    <label for="username"><b>Username</b></label>
    <input type="text" placeholder="username" name="username" size="40" required>
    
    <label for="password"><b>Password</b></label>
    <input id="password" type="password" placeholder="password"  name="password" size="40" required>
    <hr>
    <input type="submit"  width="40" height="20">  
     </div>
    </form>
      

</body>
</html>