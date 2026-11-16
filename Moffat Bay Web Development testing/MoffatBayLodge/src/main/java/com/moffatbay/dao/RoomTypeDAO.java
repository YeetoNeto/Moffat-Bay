
package com.moffatbay.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.moffatbay.database.DatabaseConnection;
import com.moffatbay.model.RoomType;

public class RoomTypeDAO {

    public List<RoomType> getAllRoomTypes() throws SQLException {
        List<RoomType> rooms = new ArrayList<>();

        String sql = "SELECT room_type_id, room_type_name, " +
                     "description, nightly_rate, max_guests " +
                     "FROM Room_Types ORDER BY room_type_id";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet results = statement.executeQuery()) {

            while (results.next()) {
                RoomType room = new RoomType(
                    results.getInt("room_type_id"),
                    results.getString("room_type_name"),
                    results.getString("description"),
                    results.getDouble("nightly_rate"),
                    results.getInt("max_guests")
                );

                rooms.add(room);
            }
        }

        return rooms;
    }
}
