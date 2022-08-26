<!-- 
Ryan Songcuan
6/12/22
CSD 430
Module 4 Assignment

Create a JSP that outputs the requested content, 
	displaying all of the information in a table format.
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Module 4: Displaying Requested Content</title>
</head>
<body>
	<h1>Module 4: Displaying Requested Content</h1>
	<p>
		This page will take information entered by the user on the form below and display 
		it in a table.
	</p>
	<%
		if (request.getMethod().equals("GET")) {
	%>
	<form method="post" action="songcuanJSP_41.jsp">
		First Name: <input type="text" name="FirstName" maxlength="30"> <br/>
		Last Name: <input type="text" name="LastName" maxlength="30"> <br/>
		Favorite Color: <input type="text" name="FavoriteColor" maxlength="10"> <br/>
		<input type="submit" value="Submit">
	</form>
	<%
		}
		if (request.getMethod().equals("POST")) {
	%>
	<table border="1">
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Favorite Color</th>
		</tr>
		<tr>
			<td><%=request.getParameter("FirstName")%></td>
			<td><%=request.getParameter("LastName")%></td>
			<td><%=request.getParameter("FavoriteColor")%></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>