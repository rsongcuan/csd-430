<!-- 
Ryan Songcuan
6/4/22
CSD 430
Module 2 Assignment
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World dynamic HTML</title>
</head>
<body>
	<%
		out.println("<h1> Hello World! </h1>");
	%>
	<% String uni = "Bellevue University";%>
	<% 
    	out.print("<h3> Welcome "+ uni + " classmates! </h3>");  
    %>
    Server Date and Time: <%=new Date()%>
    <%
    	String userAgent = request.getHeader("user-agent");
    	out.println("<br/>user-agent " + userAgent);
    %>
</body>
</html>