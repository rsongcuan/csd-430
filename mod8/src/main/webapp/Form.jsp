<!--
Ryan Songcuan
7/4/22
Module 8 Assignment
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Module 8 Assignment</title>
    </head>
    <body>
        <h1>College World Series Database Search</h1>
        <div>
            <% 
                if(request.getMethod().equals("POST")){
            %>
            <jsp:useBean id='myDB' class='beanMod8.DatabaseBean' />

            <%
	            out.println("<table border='1'>");
            	out.println("<tr>");
	            out.println("<th>Year</th>");
	            out.println("<th>Champion</th>");
	            out.println("<th>Runner Up</th>");
	            out.println("</tr>");
	            out.println("</table>");
	            
            	java.sql.ResultSet resultSet;
            
            	String year = request.getParameter("Year_T");
            
            	resultSet = myDB.getResults("SELECT * FROM CWS_Champions WHERE Year_T = '" + year + "'");
            
	            try{
	                out.println("<table border='1' bgcolor='d3d3d3'>");
	                
	                while(resultSet.next()){
	                	out.println("<tr>");
	                    
	                    for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
	                        out.println("<td>");
	                        out.print((resultSet.getString(i)));
	                        out.println("</td>");
	                    }
	                    
	                    out.println("</tr>");
	                }
	                
	                out.println("</table>");
	            }
	            catch(Exception e){
	                out.println("<b>No results.</b><br />");
	            }
	            
	            myDB.closeConnection();

//--------------------------------------------------------------------------
                
                String team = request.getParameter("Team");
                
                resultSet = myDB.getResults("SELECT * FROM CWS_Champions WHERE Team = '" + team + "'");
                
                try{
                    out.println("<table border='1' bgcolor='00ac00'>");
                    
                    while(resultSet.next()){
                    	out.println("<tr>");
                        
                        for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                            out.println("<td>");
                            out.print((resultSet.getString(i)));
                            out.println("</td>");
                        }
                        
                        out.println("</tr>");
                    }
                    
                    out.println("</table>");
                }
                catch(Exception e){
                    out.println("<b>No results.</b><br />");
                }
                
                myDB.closeConnection();

//--------------------------------------------------------------------------
                
                String loser = request.getParameter("Loser");
                
                resultSet = myDB.getResults("SELECT * FROM CWS_Champions WHERE Loser = '" + loser + "'");
                
                try{
                    out.println("<table border='1' bgcolor='D40000'>");
                    
                    while(resultSet.next()){
                    	out.println("<tr>");
                        
                        for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                            out.println("<td>");
                            out.print((resultSet.getString(i)).trim());
                            out.println("</td>");
                        }
                        
                        out.println("</tr>");
                    }
                    
                    out.println("</table>");
                }
                catch(Exception e){
                    out.println("<b>No results.</b><br />");
                }
                
                myDB.closeConnection();

//--------------------------------------------------------------------------

                out.println("<h2>Complete Results</h2>");
                
                resultSet = myDB.getResults("SELECT * FROM CWS_Champions");
                
                try{
                    out.println("<table border='1' bgcolor='ADD8E6'>");
                    out.println("<tr>");
                    out.println("<th>Year</th>");
                    out.println("<th>Champion</th>");
                    out.println("<th>Runner Up</th>");
                    out.println("</tr>");
                    
                    while(resultSet.next()){
                        out.println("<tr>");
                        
                        for(int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++){
                            out.println("<td>");
                            out.print((resultSet.getString(i)).trim());
                            out.println("</td>");
                        }
                        
                        out.println("</tr>");
                    }
                    
                    out.println("</table>");
                }
                catch(Exception e){
                    out.println("<b>No results.</b><br />");
                }
                
                myDB.closeConnection();
            }
            %>

            <%
                if(request.getMethod().equals("GET")){
            %>
            
            <form method='post' action='Form.jsp'>
            	<label for='year'>Search College World Series results for any year from 1947-2022</label>&nbsp;&nbsp;&nbsp;
                <input type='text' id='year' name='Year_T' size='5' maxlength='5'/>
                <input type='submit' value='Search Results by Year'/><br />
                <label for='team'>Search for a College World Series Champion Team</label>&nbsp;&nbsp;&nbsp;
                <input type='text' id='team' name='Team' size='40' maxlength='40'/>
                <input type='submit' value='Search CWS Champions'/><br />
                <label for='loser'>Search for a College World Series Runner Up Team</label>&nbsp;&nbsp;&nbsp;
                <input type='text' id='loser' name='Loser' size='40' maxlength='40'/>
                <input type='submit' value='Search CWS Runners Up'/>
            </form>
            <%
            }
            %>
        </div>
        
    </body>
</html>