package com.moffat.bay.test;

import java.sql.SQLException;
import java.util.List;

import com.moffatbay.dao.RoomTypeDAO;
import com.moffatbay.model.RoomType;

public class RoomTypeDAOTest {

    public static void main(String[] args) {
        RoomTypeDAO dao = new RoomTypeDAO();

        try {
            List<RoomType> rooms = dao.getAllRoomTypes();

            if (rooms != null && !rooms.isEmpty()) {
                System.out.println("TEST PASSED: Room data loaded successfully.");

				for (RoomType room : rooms) {
				    System.out.println(room.getRoomTypeName()
				        + " - $" + room.getNightlyRate());
				
				    boolean valid = false;
				
				    switch (room.getRoomTypeName()) {
				        case "Single":
				            valid = room.getNightlyRate() == 100.0
				                    && room.getMaxGuests() == 2;
				            break;
				
				        case "Double":
				            valid = room.getNightlyRate() == 150.0
				                    && room.getMaxGuests() == 4;
				            break;
				
				        case "Suite":
				            valid = room.getNightlyRate() == 250.0
				                    && room.getMaxGuests() == 6;
				            break;
				    }
				
				    if (valid) {
				        System.out.println("TEST #2 PASSED: "
				                + room.getRoomTypeName()
				                + " details are correct.");
				    } else {
				        System.out.println("TEST #2 FAILED: "
				                + room.getRoomTypeName()
				                + " details do not match.");
				    }
				}

            } else {
                System.out.println("TEST FAILED: No room data found.");
            }

        } catch (SQLException e) {
            System.out.println("TEST FAILED: Database connection error.");
            e.printStackTrace();
        }
    }
}
