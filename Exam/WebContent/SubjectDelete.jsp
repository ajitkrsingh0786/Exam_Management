<%@page import="dao.SubjectOperation"%>
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
     int id=Integer.parseInt(request.getParameter("id"));
   SubjectOperation sb=new SubjectOperation();
      boolean a= sb.delete(id);
      if(a)
      {
    	  response.sendRedirect("ShowAllSubject.jsp");
      }else{
    	  out.println("not deleted due to some problem");
      }
   
   
   
   
   %>

</body>
</html>