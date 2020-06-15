<%@page import="dao.StudentOperation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <%
       long id=Long.parseLong(request.getParameter("id"));
     StudentOperation st=new StudentOperation();
     boolean a=st.delete(id);
     if(a)
     {
    	 response.sendRedirect("AdminHomePage.jsp");
     }
     %>
</body>
</html>