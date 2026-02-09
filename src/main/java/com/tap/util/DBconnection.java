package com.tap.util;
import java.sql.*;

public class DBconnection {
		private static String URL="jdbc:mysql://localhost:3306/tapfood";
		private static String Username="root";
		private static String Password="Sty@12345";
		private static Connection con;

	public static Connection getConnection(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(URL,Username,Password);
		 }
		catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return con;
     }
}