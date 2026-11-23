package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.moffatbay.model.Reservation;

/*
 * CSD-460 Capstone - Assignment 7
 * Retrieves reservation information from MySQL.
 */

public class ReservationDAO {

    public Reservation getReservationById(int reservationId)
            throws SQLException {

    	String url = "jdbc:mysql://localhost:3306/moffat_bay";
    	String username = "moffat_user";
    	String password = "MOFFAT_DB_PASSWORD";

        String sql = """
            SELECT r.reservation_id,
                   a.first_name,
                   a.last_name,
                   a.email,
                   rt.room_type_name,
                   r.number_of_guests,
                   r.check_in_date,
                   r.check_out_date,
                   r.reservation_status,
        		   r.total_price,
        		   r.special_requests
            FROM Reservations r
            JOIN Account_Information a
                ON r.account_id = a.account_id
            JOIN Room_Types rt
                ON r.room_type_id = rt.room_type_id
            WHERE r.reservation_id = ?
            """;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC driver could not be loaded", e);
        }
        
        try (Connection connection =
                DriverManager.getConnection(url, username, password);
             PreparedStatement statement =
                connection.prepareStatement(sql)) {

            statement.setInt(1, reservationId);

            try (ResultSet results = statement.executeQuery()) {

                if (results.next()) {

                    Reservation reservation = new Reservation();

                    reservation.setReservationId(
                        results.getInt("reservation_id"));

                    reservation.setFirstName(
                        results.getString("first_name"));

                    reservation.setLastName(
                        results.getString("last_name"));

                    reservation.setEmail(
                        results.getString("email"));

                    reservation.setRoomType(
                        results.getString("room_type_name"));

                    reservation.setNumberOfGuests(
                        results.getInt("number_of_guests"));

                    reservation.setCheckIn(
                        results.getDate("check_in_date").toLocalDate());

                    reservation.setCheckOut(
                        results.getDate("check_out_date").toLocalDate());

                    reservation.setReservationStatus(
                        results.getString("reservation_status"));

                    reservation.setTotalPrice(
                        results.getBigDecimal("total_price"));                 

                    	reservation.setSpecialRequests(
                    	    results.getString("special_requests"));
                    	
                    return reservation;
                }
            }
        }

        return null;
    }
}
