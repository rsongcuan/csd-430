/*
Ryan Songcuan
7/4/22
Module 8 Assignment
*/

package beanMod8;

public class DatabaseBean implements java.io.Serializable {
	java.sql.Connection con = null;
	java.sql.Statement stmt = null;
	java.sql.ResultSet resultSet = null;
	public DatabaseBean() {
	}
	
	public java.sql.ResultSet getResults(String SQL) throws ClassNotFoundException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/cws";
			con = java.sql.DriverManager.getConnection(url, "student1", "pass");
			stmt = con.createStatement();
		}
		catch(java.sql.SQLException e) {
		}

		try {
			resultSet = stmt.executeQuery(SQL);
		}
		catch(java.sql.SQLException e) {
		}
		return resultSet;
	}
	
	public void closeConnection() {
		try {
			stmt.close();
			con.close();
		}
		catch(java.sql.SQLException e) {
		}
	}
}
