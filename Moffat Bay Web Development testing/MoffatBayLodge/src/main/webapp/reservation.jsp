<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="com.moffatbay.dao.RoomTypeDAO" %>
<%@ page import="com.moffatbay.model.RoomType" %>
<%@ page import="java.math.BigDecimal" %>
<jsp:useBean id="database" class="database.databaseInfo" scope="session" />
<%
Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");

if (loggedIn == null || !loggedIn) {
    response.sendRedirect("login.jsp");
    return;
}
List<RoomType> rooms = null;

try {
    RoomTypeDAO roomDAO = new RoomTypeDAO();
    rooms = roomDAO.getAllRoomTypes();
} catch (SQLException e) {
    application.log("Unable to load room types", e);
}

if ("POST".equalsIgnoreCase(request.getMethod())) {
	String action = request.getParameter("action");
	if ("cancel".equals(action)) {
        response.sendRedirect("index.jsp");
        return;
    }
	Integer accountId = (Integer) session.getAttribute("accountId");
	String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");

    Integer numGuests = Integer.parseInt(request.getParameter("numGuests"));
    Integer roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));

    String date1 = request.getParameter("date1");
    String date2 = request.getParameter("date2");

    String requests = request.getParameter("requests");
	BigDecimal total = new BigDecimal(rooms.get(roomTypeId).getNightlyRate());

 // "Confirmed" is status we are skipping payment section
    int reservationId = database.addReservation(accountId, firstName, lastName, roomTypeId, numGuests, "Confirmed", date1, date2, requests, total);

    if (reservationId > 0) {
        response.sendRedirect(
            "reservationSummary.jsp?reservationId=" + reservationId
        );
        return;
    }
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge- Home</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <header>
        <h1>Moffat Bay Lodge</h1>

         <nav aria-label="Main navigation">
            <a href="index.jsp">Home</a>
            <a href="about.jsp">About Us</a>
            <a href="contact.jsp">Contact Us</a>
            <a href="index.jsp#accommodations">Accommodations</a>
            <a href="attractions.jsp">Attractions</a>
            <a href="reservations.jsp">My Reservations</a>
            <a href="registration.jsp">Register</a>
            <a href="login.jsp">Login</a>
        </nav>
    </header>

    <main>
        <div class="reservation">
            <h2>Reservation Information</h2>
            <form method="GET">
            
            <label for="firstName">First Name: </label>
            <input type="text" id="firstName" name="firstName">
            <br><br>
            <label for="lastName">Last Name: </label>
            <input type="text" id="lastName" name="lastName">
            <br><br>
            <br><br>
            <label for="guests">Number of Guests:</label>
            <select id="guests" name="numGuests">
                <option value="1">1 Guest</option>
                <option value="2">2 Guests</option>
                <option value="3">3 Guests</option>
                <option value="4">4 Guests</option>
                <option value="5">5 Guests</option>
            </select>

            <br><br>
            <label for="rooms">Reservation Room</label>
            <select id="rooms" name="roomTypeId">
            <% if (rooms != null && !rooms.isEmpty()) { %>
		        <% for (RoomType room : rooms) { %>
                <option value="<%= room.getRoomTypeId() %>"><%= room.getRoomTypeName() + "  $" + room.getNightlyRate() %></option>
                 <% } %>
                <% } else { %>
		        <option value="1" >Default Room, Other Room options unavailable</option>
		    <% } %>
            </select>
            <br><br>
            <label for="date">Reservation Check In Date:</label>
            <input type="date" id="date1" name="date1">
            <br><br>
            <label for="date">Reservation Check out Date:</label>
            <input type="date" id="date2" name="date2">
            <br><br>
            <label for="requests">Special Requests:</label>
            <br>
            <textarea id="requests" name="requests" placeholder="Any special requests?" rows="4" cols="40" maxlength="500"></textarea>
            <br><br>
            <h2>Payment Information</h2>

            <label for="cardName">Name on Card:</label>
            <input type="text" id="cardName">
            <br><br>
            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" maxlength="19">
            <br><br>
            <label for="expiration">Expiration Date:</label>
            <input type="text" id="expiration" maxlength="5">
            <br><br>
            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" maxlength="3">
            <br><br>
            <button type="submit" name="action" value="cancel"> Cancel Reservation</button> 
            <button type="submit" name="action" value="submit"> Submit Reservation</button>
            </form>
        </div>
        <br>
    </main>

    <footer>
        <div class="contact-info">
            <h3>Contact Information</h3>
            <p>Address placeholder</p>
            <p>Phone and email placeholder</p>
        </div>

        <div class="quick-links">
            <h3>Quick Links</h3>
            <a href="index.jsp">Home</a>
            <a href="about.jsp">About Us</a>
            <a href="contact.jsp">Contact Us</a>
        </div>

        <div class="social-media">
            <h3>Social Media</h3>
            <p>Social media links placeholder</p>
        </div>

        <p>&copy; 2026 Moffat Bay Lodge. All rights reserved.</p>
    </footer>

</body>
</html>