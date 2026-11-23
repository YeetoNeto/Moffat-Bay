<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="database.ReservationDAO" %>
<%@ page import="com.moffatbay.model.Reservation" %>

<%
	ReservationDAO reservationDAO = new ReservationDAO();
	Reservation reservation = null;
	
	try {
		String reservationIdParam = request.getParameter("reservationId");

		if (reservationIdParam != null) {
		    int reservationId = Integer.parseInt(reservationIdParam);
		    reservation = reservationDAO.getReservationById(reservationId);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge - Reservation Summary</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<header>
    <h1>Moffat Bay Lodge</h1>

    <nav aria-label="Main navigation">
        <a href="index.html">Home</a>
        <a href="about.html">About Us</a>
        <a href="contact.html">Contact Us</a>
        <a href="index.html#accommodations">Accommodations</a>
        <a href="attractions.html">Attractions</a>
        <a href="reservations.jsp">My Reservations</a>
        <a href="registration.html">Register</a>
        <a href="login.jsp">Login</a>
    </nav>
</header>
	
<main>
    <div class="reservation">
        <h2>Reservation Summary</h2>

		<label for="firstName">First Name:</label>
		<input type="text" id="firstName"
		       value="<%= reservation != null ? reservation.getFirstName() : "" %>"
		       readonly>
		<br><br>
		
		<label for="lastName">Last Name:</label>
		<input type="text" id="lastName"
		       value="<%= reservation != null ? reservation.getLastName() : "" %>"
		       readonly>
		<br><br>
		
		<label for="email">Email:</label>
		<input type="email" id="email"
		       value="<%= reservation != null ? reservation.getEmail() : "" %>"
		       readonly>
		<br><br>
		
		<label for="guests">Number of Guests:</label>
		<input type="number" id="guests"
		       value="<%= reservation != null ? reservation.getNumberOfGuests() : "" %>"
		       readonly>
		<br><br>
		
		<label for="rooms">Reservation Room:</label>
		<input type="text" id="rooms"
		       value="<%= reservation != null ? reservation.getRoomType() : "" %>"
		       readonly>
		<br><br>
		
		<label for="checkIn">Check-in Date:</label>
		<input type="text" id="checkIn"
		       value="<%= reservation != null && reservation.getCheckIn() != null ? reservation.getCheckIn() : "" %>"
		       readonly>
		<br><br>
		
		<label for="checkOut">Check-out Date:</label>
		<input type="text" id="checkOut"
		       value="<%= reservation != null && reservation.getCheckOut() != null ? reservation.getCheckOut() : "" %>"
		       readonly>
		<br><br>
		
		<label for="requests">Special Requests:</label>
		<textarea id="requests" rows="3" cols="35" readonly><%= reservation != null && reservation.getSpecialRequests() != null ? reservation.getSpecialRequests() : "" %></textarea>
		<br><br>
		
		<label for="cost">Reservation Cost:</label>
		<input type="text" id="cost"
		       value="<%= reservation != null && reservation.getTotalPrice() != null ? reservation.getTotalPrice() : "" %>"
		       readonly>
		<br><br>        
    </div>
</main>
	
<footer>
    <div class="contact-info">
        <h3>Contact Information</h3>
        <p>Address placeholder</p>
        <p>Phone and email placeholder</p>
    </div>

    <div class="quick-links">
        <h3>Quick Links</h3>
        <a href="index.html">Home</a>
        <a href="about.html">About Us</a>
        <a href="contact.html">Contact Us</a>
        <a href="attractions.html">Attractions</a>
    </div>

    <div class="social-media">
        <h3>Social Media</h3>
        <p>Social media links placeholder</p>
    </div>

    <p>&copy; 2026 Moffat Bay Lodge. All rights reserved.</p>
</footer>

</body>
</html>
