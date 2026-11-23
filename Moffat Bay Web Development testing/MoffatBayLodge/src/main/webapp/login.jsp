<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@ page import="java.sql.SQLException" %>
<jsp:useBean id="database" class="database.databaseInfo" scope="session" />
<%
String messageNote = "The email or password entered is incorrect";
Boolean showMessage = false;
int count = 0;
    if ("POST".equals(request.getMethod())) {

        String username = request.getParameter("email");
        String password = request.getParameter("password");

        Integer result = database.getLogin(username, password);

        if (result >= 0){
        	session = request.getSession();
        	// Regenerate the session ID
        	request.changeSessionId();
         	// Store user information
        	session.setAttribute("accountId", result);
        	session.setAttribute("loggedIn", true);
        	// Set 30-minute inactivity timeout
        	session.setMaxInactiveInterval(30 * 60);
        	response.sendRedirect("reservations.jsp");
        }
        else{
        	showMessage = true;
        	count = count + 1;
        	if (count == 3){
        		//lockout user, need to update database further to work with this
        	}
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Moffat Bay Lodge - Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>Moffat Bay Lodge</h1>
        <nav aria-label="Main navigation">
            <a href="index.jsp">Home</a>
            <a href="about.jsp">About Us</a>
            <a href="index.jsp#accommodations">Accommodations</a>
            <a href="attractions.jsp">Attractions</a>
            <a href="login.jsp" aria-current="page">Login</a>
        </nav>
    </header>

    <main>
        <section id="login-section">
            <h2>Log In to Your Account</h2>
            <p>Enter your email address and password to access your Moffat Bay Lodge account.</p>
            <form id = login-form action="" method = "POST">
                <label for="login-email">Email Address:</label>
                <input id="login-email" name="email" type="email" autocomplete="username" required maxlength="254">

                <label for="login-password">Password:</label>
                <input id="login-password" name="password" type="password" autocomplete="current-password" required>

                <p id="login-message" role="status" aria-live="polite"></p>
                <button type="submit">Log In</button>
            </form>
            <p class="login-footer">Don't have an account? <a href="registration.html">Create an Account</a></p>
            <p class="login-note" style="display: <%= showMessage ? "block" : "none" %>;"> <%= messageNote %></p>
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
            <a href="about.jsp">About Us</a>
            <a href="contact.jsp">Contact Us</a>
            <a href="attractions.jsp">Attractions</a>
        </div>
        <div class="social-media">
            <h3>Social Media</h3>
            <p>Social media links placeholder</p>
        </div>
        <p class="copyright">&copy; 2026 Moffat Bay Lodge. All rights reserved.</p>
    </footer>

</body>
</html>