
package com.moffatbay.model;

public class RoomType {

    private int roomTypeId;
    private String roomTypeName;
    private String description;
    private double nightlyRate;
    private int maxGuests;

    public RoomType(int roomTypeId, String roomTypeName,
                    String description, double nightlyRate,
                    int maxGuests) {
        this.roomTypeId = roomTypeId;
        this.roomTypeName = roomTypeName;
        this.description = description;
        this.nightlyRate = nightlyRate;
        this.maxGuests = maxGuests;
    }

    public int getRoomTypeId() {
        return roomTypeId;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public String getDescription() {
        return description;
    }

    public double getNightlyRate() {
        return nightlyRate;
    }

    public int getMaxGuests() {
        return maxGuests;
    }
}
