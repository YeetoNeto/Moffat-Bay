package database;


import java.sql.*;
import java.util.*;
import org.mindrot.jbcrypt.BCrypt;
import java.io.Serializable;
import java.math.BigDecimal;
import jakarta.servlet.http.HttpSession;


public class databaseInfo {
	
	public Integer getLogin(String login_user, String login_pass) {
		String url = System.getenv("MOFFAT_DB_URL");
		String username = System.getenv("MOFFAT_DB_USER");
		String password = System.getenv("MOFFAT_DB_PASSWORD");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url,username, password);
			String sql = "SELECT account_id, password FROM users WHERE username = ?";
			java.sql.PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, login_user);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
			    // User exists
				String hashPass = rs.getString("password");
				int accountId = rs.getInt("account_id");
				if (BCrypt.checkpw(login_pass, hashPass)) {
					conn.close();
					System.out.println("Password is correct");
					return accountId;
				}
				else {
					conn.close();
					System.out.println("Password is incorrect");
					return -1;
				}
			} 
			else {
				conn.close();
				System.out.println("User not found!");
			    return -2;
			}
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		    return -3;
		} catch (SQLException e) {
			e.printStackTrace();
			return -4;
		}
	}
	
	public Integer addReservation(Integer accountId, String firstName, String lastName, Integer roomTypeId, Integer guests, String status, String date1, String date2,  String requests, BigDecimal total) {
		String url = System.getenv("MOFFAT_DB_URL");
		String username = System.getenv("MOFFAT_DB_USER");
		String password = System.getenv("MOFFAT_DB_PASSWORD");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url,username, password);
			String sql = "INSERT INTO reservations " + "(account_id, room_type_id, check_in_date, check_out_date, " + "number_of_guests, reservation_status, total_price) " + "VALUES (?, ?, ?, ?, ?, ?, ?)";
			java.sql.PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, accountId);
			ps.setInt(2, roomTypeId);
			ps.setDate(3, java.sql.Date.valueOf(date1));
			ps.setDate(4, java.sql.Date.valueOf(date2));
			ps.setInt(5, guests);
			ps.setString(6, status);
			ps.setBigDecimal(7, total);

			ps.executeUpdate();

			// Retrieve generated reservation ID
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				conn.close();
				return rs.getInt(1);
			} 
			else {
				conn.close();
				System.out.println("Reservation not found!");
			    return -1;
			}
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		    return -2;
		} catch (SQLException e) {
			e.printStackTrace();
			return -3;
		}
		
	}
        
}

