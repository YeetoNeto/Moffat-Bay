
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
/*
 * Name: Brady Heinz
 * Project: Moffat Bay Lodge
 * Assignment: Module 7
 * Description: Displays the About Us page, including lodge
 * information, amenities, location, and contact information.
 */

// About Us page information
String pageTitle = "About Moffat Bay Lodge";

String welcomeMessage = "Welcome to Moffat Bay Lodge, a relaxing "
        + "destination for guests looking to enjoy nature, "
        + "comfortable accommodations, and outdoor activities.";

String storyMessage = "Moffat Bay Lodge offers guests a peaceful "
        + "getaway surrounded by natural beauty. Our goal is to "
        + "provide a welcoming environment for families, couples, "
        + "and travelers.";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Moffat Bay Lodge - About Us</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<header>
    <h1>Moffat Bay Lodge</h1>

    <nav aria-label="Main navigation">
        <a href="index.jsp">Home</a>
        <a href="about.jsp" aria-current="page">About Us</a>
        <a href="index.jsp#accommodations">Accommodations</a>
        <a href="index.jsp#activities">Activities</a>
        <a href="attractions.html">Attractions</a>
        <a href="reservations.jsp">My Reservations</a>
        <a href="registration.html">Register</a>
        <a href="login.jsp">Login</a>
    </nav>
</header>

<main>

    <!-- About Us Introduction -->
    <section id="about-intro">
        <h2><%= pageTitle %></h2>
        <p><%= welcomeMessage %></p>
    </section>

    <!-- Our Story -->
    <section id="our-story">
        <h2>Our Story</h2>
        <p><%= storyMessage %></p>
    </section>

    <!-- Amenities -->
    <section id="amenities">
        <h2>Our Amenities</h2>

        <ul>
            <li>Comfortable guest accommodations</li>
            <li>Outdoor recreational activities</li>
            <li>Scenic surroundings</li>
            <li>Relaxing atmosphere</li>
        </ul>
    </section>

    <!-- Location -->
    <section id="about-page-location">
        <h2>Our Location</h2>
        <p>Location and map information coming soon.</p>
    </section>

    <!-- Contact Information -->
    <section id="contact-section">
        <h2>Contact Information</h2>

        <p>
            Have questions about Moffat Bay Lodge?
            Reach out to us using the information below.
        </p>

        <p>Address: To be confirmed</p>
        <p>Phone: To be confirmed</p>
        <p>Email: To be confirmed</p>
    </section>

</main>

<footer>

    <!-- Contact Information -->
    <div class="contact-info">
        <h3>Contact Information</h3>
        <p>Address: To be confirmed</p>
        <p>Phone and email: To be confirmed</p>
    </div>

    <!-- Quick Links -->
    <div class="quick-links">
        <h3>Quick Links</h3>
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="attractions.html">Attractions</a>
    </div>

    <!-- Social Media -->
    <div class="social-media">
        <h3>Social Media</h3>
        <p>Social media links coming soon.</p>
    </div>

    <p>&copy; 2026 Moffat Bay Lodge. All rights reserved.</p>

</footer>

</body>
</html>
