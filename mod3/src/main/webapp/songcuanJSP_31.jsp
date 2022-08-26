<!-- 
Ryan Songcuan
6/12/22
CSD 430
Module 3 Assignment

Create a JSP that declares and initializes an int array. 
Then, using loop iteration and selection, go through the array displaying
	each element along with identifying even and odd values.
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Module 3: Integer Array</title>
</head>
<body>
	<h1>Module 3: Integer Array</h1>
	<p>
		This page will display each value of an integer array, 
		and whether that value is odd or even.
	</p>
	<%! 
		int[] intArray = {85, 79, 49, 10, 94, 51, 57, 29, 76, 23};
	%>
	<%
		for (int i: intArray) {
			if (i % 2 == 0) {
				out.print(i + ", Even <br/>");
			}
			else {
				out.print(i + ", Odd <br/>");
			}
		}
	%>
</body>
</html>