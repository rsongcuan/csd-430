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
        <h1>College World Series Database Creation</h1>
        
        <%
            java.sql.Connection con = null;
            java.sql.Statement stmt = null;
           
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/";
                con = java.sql.DriverManager.getConnection(url, "student1", "pass");
                stmt = con.createStatement();
                String dropDB = "DROP DATABASE IF EXISTS cws";
                stmt.executeUpdate(dropDB);
                String createDB = "CREATE DATABASE cws";
                stmt.executeUpdate(createDB);
                out.println("<b>Database 'CWS' created sucessfully.</b><br />");
            } 
            catch(Exception e) {
                out.println("<b>Database not created, an error occurred.</b><br />");
            }
            
            try{                
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/cws";
                con = java.sql.DriverManager.getConnection(url, "student1", "pass");             
                stmt = con.createStatement();
            }
            catch(Exception e){
                out.println("<h1>Error connection to database.</h1><br />");
            }
            
            try{
                stmt.executeUpdate("DROP TABLE CWS_Champions");
                out.println("<b>Table CWS_Champions Dropped</b><br />");
            }
            catch(java.sql.SQLException e){                
                out.println("<b>Table CWS_Champions does not exist</b><br />");
            }
            
            try{
                stmt.executeUpdate("CREATE TABLE CWS_Champions(Year_T CHAR(4) NOT NULL PRIMARY KEY, Team CHAR(40) NOT NULL, Loser CHAR(40) NOT NULL)");
                out.println("<b>Table CWS_Champions Created</b><br />");
            }
            catch(java.sql.SQLException e){
                out.println("<b>Table CWS_Champions Creation failed</b><br />");
            }
            
            try{
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1947', 'California', 'Yale')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1948', 'Southern California', 'Yale')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1949', 'Texas', 'Wake Forest')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1950', 'Texas', 'Washington State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1951', 'Oklahoma', 'Tennessee')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1952', 'Holy Cross', 'Missouri')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1953', 'Michigan', 'Texas')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1954', 'Missouri', 'Rollins')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1955', 'Wake Forest', 'Western Michigan')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1956', 'Minnesota', 'Arizona')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1957', 'California', 'Penn State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1958', 'Southern California', 'Missouri')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1959', 'Oklahoma State', 'Arizona')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1960', 'Minnesota', 'Southern California')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1961', 'Southern California', 'Oklahoma State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1962', 'Michigan', 'Santa Clara')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1963', 'Southern California', 'Arizona')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1964', 'Minnesota', 'Missouri')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1965', 'Arizona State', 'Ohio State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1966', 'Ohio State', 'Oklahoma State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1967', 'Arizona State', 'Houston')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1968', 'Southern California', 'Southern Illinois')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1969', 'Arizona State', 'Tulsa')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1970', 'Southern California', 'Florida State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1971', 'Southern California', 'Southern Illinois')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1972', 'Southern California', 'Arizona State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1973', 'Southern California', 'Arizona State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1974', 'Southern California', 'Miami (FL)')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1975', 'Texas', 'South Carolina')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1976', 'Arizona', 'Eastern Michigan')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1977', 'Arizona State', 'South Carolina')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1978', 'Southern California', 'Arizona State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1979', 'Cal State Fullerton', 'Arkansas')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1980', 'Arizona', 'Hawaii')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1981', 'Arizona State', 'Oklahoma State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1982', 'Miami (FL)', 'Wichita State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1983', 'Texas', 'Alabama')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1984', 'Cal State Fullerton', 'Texas')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1985', 'Miami (FL)', 'Texas')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1986', 'Arizona', 'Florida State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1987', 'Stanford', 'Oklahoma State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1988', 'Stanford', 'Arizona State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1989', 'Wichita State', 'Texas')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1990', 'Georgia', 'Oklahoma State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1991', 'LSU', 'Wichita State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1992', 'Pepperdine', 'Cal State Fullerton')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1993', 'LSU', 'Wichita State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1994', 'Oklahoma', 'Georgia Tech')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1995', 'Cal State Fullerton', 'Southern California')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1996', 'LSU', 'Miami (FL)')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1997', 'LSU', 'Alabama')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1998', 'Southern California', 'Arizona State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('1999', 'Miami (FL)', 'Florida State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2000', 'LSU', 'Stanford')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2001', 'Miami (FL)', 'Stanford')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2002', 'Texas', 'South Carolina')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2003', 'Rice', 'Stanford')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2004', 'Cal State Fullerton', 'Texas')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2005', 'Texas', 'Florida')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2006', 'Oregon State', 'North Carolina')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2007', 'Oregon State', 'North Carolina')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2008', 'Fresno State', 'Georgia')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2009', 'LSU', 'Texas')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2010', 'South Carolina', 'UCLA')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2011', 'South Carolina', 'Florida')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2012', 'Arizona', 'South Carolina')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2013', 'UCLA', 'Mississippi State')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2014', 'Vanderbilt', 'Virginia')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2015', 'Virginia', 'Vanderbilt')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2016', 'Coastal Carolina', 'Arizona')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2017', 'Florida', 'LSU')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2018', 'Oregon State', 'Arkansas')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2019', 'Vanderbilt', 'Michigan')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2020', 'CANCELED: COVID', 'CANCELED: COVID')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2021', 'Mississippi State', 'Vanderbilt')");
                stmt.executeUpdate("INSERT INTO CWS_Champions(Year_T, Team, Loser)VALUES('2022', 'Ole Miss', 'Oklahoma')");
                
                stmt.executeUpdate("COMMIT");
                
                out.println("<b>Data Inserted</b><br />");
            }
            catch(java.sql.SQLException e){
                out.println("<b>Error inserting data</b><br />");
            }
            try{
                stmt.close();
                con.close();
                out.println("<b>Database connections closed</b><br />");
            }
            catch(java.sql.SQLException e){
                out.println("<b>Connection close failed</b><br />");
            }
        %>
        <br /><br />
        <a href='index.html'>Back to Main Page</a>
        
    </body>
</html>