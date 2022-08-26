<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><title>Debug problem</title></head>
    <body>
        <%
            double num = Math.random();
            if (num > 0.50) {
        %>
        <h2>You're in the majority!!</h2><p>(<%= num %>)</p>
        <%
            } 
            else {
        %>
        <h2>You're an outcast!</h2><p>(<%= num %>)</p>
        <%
            }
        %>
        <a href="<%= request.getRequestURI() %>"><h3>Try Again</h3></a>
    </body>
</html>