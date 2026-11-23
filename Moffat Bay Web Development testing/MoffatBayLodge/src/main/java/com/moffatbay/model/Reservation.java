package com.moffatbay.model;

import java.math.BigDecimal;
import java.time.LocalDate;

/*
 * CSD-460 Capstone - Assignment 7
 * Stores reservation information retrieved
 * from the database.
 */
public class Reservation {
	

	public int getReservationId() {
		return reservationId;
	}
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getNumberOfGuests() {
		return numberOfGuests;
	}
	public void setNumberOfGuests(int numberOfGuests) {
		this.numberOfGuests = numberOfGuests;
	}
	public LocalDate getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(LocalDate checkIn) {
		this.checkIn = checkIn;
	}
	public LocalDate getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(LocalDate checkOut) {
		this.checkOut = checkOut;
	}
	public String getReservationStatus() {
		return reservationStatus;
	}
	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
	}
	public BigDecimal getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}
	private int reservationId;
	private String firstName;
	private String lastName;
	private String email;
	private String roomType;
	private int numberOfGuests;
	private LocalDate checkIn;
	private LocalDate checkOut;
	private String specialRequests;
	private String reservationStatus;
	private BigDecimal totalPrice;
	
	public String getSpecialRequests() {
	    return specialRequests;
	}

	public void setSpecialRequests(String specialRequests) {
	    this.specialRequests = specialRequests;
	}

}