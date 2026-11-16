package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import org.mindrot.jbcrypt.BCrypt;
import java.sql.ResultSet;
import java.io.Serializable;
public class databaseInfo {


	public String getLogin(String login_user, String login_pass) {
		String url = "jdbc:mysql://localhost:3306/moffat_bay";
		String username = "moffat_user";
		String password = "moffat_pass";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url,username, password);
			String sql = "SELECT password FROM users WHERE username = ?";
			java.sql.PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, login_user);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
			    // User exists
				String hashPass = rs.getString("password");
				if (BCrypt.checkpw(login_pass, hashPass)) {
					conn.close();
					System.out.println("Password is correct");
					return "Login successful";
				}
				else {
					conn.close();
					System.out.println("Password is incorrect");
					return "Password is incorrect";
				}
			} 
			else {
				conn.close();
				System.out.println("User not found!");
			    return "User not found!";
			}
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		    return "Database Error";
		} catch (SQLException e) {
			e.printStackTrace();
			return "Database Error";
		}
	}
        
}

