<!--
Ryan Songcuan
5/29/22
Module 1 Assignment
-->

<%@page language="java" contentType="text/html"%>
<html>
    <head>
        <title>Hello World dynamic HTML</title>
    </head>
    <body>
        Hello World!
        <%
            String userAgent = request.getHeader("user-agent");
            out.println("<br/>user-agent " + userAgent);
        %>
    </body>
</html>