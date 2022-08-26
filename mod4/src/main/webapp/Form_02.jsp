<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
 Professor Darrell Payne
 Bellevue University
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form 2</title>
    </head>
    <body>
        <h1>Form 2</h1>
        
        <% 
            if(request.getMethod().equals("GET")){
        %>
        
        <form method='post' action='Form_02.jsp'>
            Enter your name:
            <input type='text' name='Name' maxlength='20'>
            <input type='submit' value='Submit'>
        </form>
        
        <%
            }
            
            if(request.getMethod().equals("POST")){

                out.println(request.getParameter("Name"));
            }
        %>

    </body>
</html>