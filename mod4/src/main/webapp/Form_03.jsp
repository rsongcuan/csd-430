<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
 Professor Darrell Payne
 Bellevue University
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form 3</title>
    </head>
    <body>
        <h1>Form 3</h1>
        
        <%
            if(request.getMethod().equals("GET")){
        %>
        <form method='post' action='Form_03.jsp'>
            Enter an int value:
            <input type='text' name='intValue' maxlength='20'>
            <input type='submit' value='Submit'>
        </form>
        <%
            }
            if(request.getMethod().equals("POST")){

                try{

                    out.println(Integer.parseInt(request.getParameter("intValue")) + 
                                Integer.parseInt(request.getParameter("intValue")));
                    /*
                     * Or
                     */

                    out.println("<br />");

                    int i = Integer.parseInt(request.getParameter("intValue"));
                    out.println(i + i);
                }
                catch(Exception jspE){
    
                    out.println("You have entered an invalid char");
                }
            }
        %>

    </body>
</html>