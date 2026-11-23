<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.moffatbay.dao.RoomTypeDAO" %>
<%@ page import="com.moffatbay.model.RoomType" %>
<%@ page import="java.sql.SQLException" %>

<%
    List<RoomType> rooms = null;

    try {
        RoomTypeDAO roomDAO = new RoomTypeDAO();
        rooms = roomDAO.getAllRoomTypes();
    } catch (SQLException e) {
        application.log("Unable to load room types", e);
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

        <nav>
            <a href="index.jsp">Home</a>
            <a href="about.jsp">About Us</a>
            <a href="#accommodations">Accommodations</a>
            <a href="#activities">Activities</a>
        </nav>
    </header>

    <main>
        <section id="hero">
            <h2>Welcome to Moffat Bay Lodge</h2>

            <p>Hero image placeholder</p>

            <p>
                Experience a relaxing getaway at Moffat Bay Lodge.
            </p>

            <a href="reservation.jsp">Book Now</a>
        </section>
		
		<section id="accommodations">
		    <h2>Accommodations</h2>
		
		    <% if (rooms != null && !rooms.isEmpty()) { %>
		        <% for (RoomType room : rooms) { %>
		            <div class="room">
		                <h3><%= room.getRoomTypeName() %></h3>
		                <p>Room image placeholder</p>
		                <p><%= room.getDescription() %></p>
		                <p>Nightly Rate: $<%= String.format("%.2f", room.getNightlyRate()) %></p>
		                <p>Maximum Guests: <%= room.getMaxGuests() %></p>
		            </div>
		        <% } %>
		    <% } else { %>
		        <p>Room information is currently unavailable.</p>
		    <% } %>
		</section>

        <section id="activities">
            <h2>Activities</h2>

            <div class="activity">
                <h3>Activity 1</h3>
                <p>Activity image placeholder</p>
                <p>Activity description placeholder</p>
            </div>

            <div class="activity">
                <h3>Activity 2</h3>
                <p>Activity image placeholder</p>
                <p>Activity description placeholder</p>
            </div>

            <div class="activity">
                <h3>Activity 3</h3>
                <p>Activity image placeholder</p>
                <p>Activity description placeholder</p>
            </div>
        </section>

        <section id="about-location">
            <h2>About / Location</h2>

            <div class="location">
                <h3>Our Location</h3>
                <p>Map and location image placeholder</p>
            </div>

            <div class="about">
                <h3>About Moffat Bay Lodge</h3>
                <p>Information and description placeholder</p>
                <a href="about.html">Learn More About Us</a>
            </div>
        </section>

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
            <a href="about.html">About Us</a>
        </div>

        <div class="social-media">
            <h3>Social Media</h3>
            <p>Social media links placeholder</p>
        </div>

        <p class="copyright">&copy; 2026 Moffat Bay Lodge. All rights reserved.</p>
    </footer>

</body>
</html>