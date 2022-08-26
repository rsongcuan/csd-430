<!-- 
Ryan Songcuan
6/12/22
CSD 430
Module 3 Assignment

Create a JSP that declares and initializes a String array. 
Use a for-each loop to display the array.
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Module 3: String Array</title>
</head>
<body>
	<h1>Module 3: String Array</h1>
	<p>This page display each element of an array using a for-each loop.</p>
	<h2>West Coast Conference Schools</h2>
	<%!
		String[] westCoastConference = {
				"Brigham Young University",
				"Gonzaga University",
				"Loyola Marymount University",
				"University of the Pacific",
				"Pepperdine University",
				"University of Portland",
				"Saint Mary's College of California",
				"University of San Diego",
				"University of San Francisco",
				"Santa Clara University",
		};
	%>
	<%
		for (String school : westCoastConference) {
			out.print(school + "<br/>");
		}
	%>
</body>
</html>