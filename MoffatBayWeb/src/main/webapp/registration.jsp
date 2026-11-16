
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Moffat Bay Lodge - Registration</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <header>
        <h1>Moffat Bay Lodge</h1>

        <nav aria-label="Main navigation">
            <a href="index.html">Home</a>
            <a href="about.html">About Us</a>
            <a href="index.html#accommodations">Accommodations</a>
            <a href="attractions.html">Attractions</a>
            <a href="reservations.html">My Reservations</a>
            <a href="registration.jsp" aria-current="page">Register</a>
            <a href="login.html">Login</a>
        </nav>
    </header>

    <main>
        <section id="registration-section">

            <h2>Create an Account</h2>

            <p>
                Register with Moffat Bay Lodge to get ready
                to make a reservation.
            </p>

            <form id="registration-form" action="register" method="post">

                <label for="first-name">First Name:</label>
                <input
                    id="first-name"
                    name="firstName"
                    type="text"
                    autocomplete="given-name"
                    required
                    maxlength="50">

                <label for="last-name">Last Name:</label>
                <input
                    id="last-name"
                    name="lastName"
                    type="text"
                    autocomplete="family-name"
                    required
                    maxlength="100">

                <label for="username">Username:</label>
                <input
                    id="username"
                    name="username"
                    type="text"
                    autocomplete="username"
                    required
                    maxlength="32">

                <label for="email">Email Address:</label>
                <input
                    id="email"
                    name="email"
                    type="email"
                    autocomplete="email"
                    required
                    maxlength="254">

                <label for="telephone">Telephone Number:</label>
                <input
                    id="telephone"
                    name="telephone"
                    type="tel"
                    autocomplete="tel"
                    maxlength="20">

                <label for="password">Password:</label>
                <input
                    id="password"
                    name="password"
                    type="password"
                    autocomplete="new-password"
                    required
                    minlength="8"
                    aria-describedby="password-help">

                <p id="password-help" class="form-hint">
                    Use at least 8 characters, including an
                    uppercase letter, a lowercase letter,
                    and a number.
                </p>

                <label for="confirm-password">Confirm Password:</label>
                <input
                    id="confirm-password"
                    name="confirmPassword"
                    type="password"
                    autocomplete="new-password"
                    required>

                <%-- Display messages from RegistrationServlet --%>
                <%
                    String message = (String) request.getAttribute(
                            "registrationMessage");

                    Boolean success = (Boolean) request.getAttribute(
                            "registrationSuccess");
                %>

                <p id="registration-message"
                   class="<%= Boolean.TRUE.equals(success)
                           ? "success" : "error" %>"
                   role="status"
                   aria-live="polite">
                    <%= message == null ? "" : message %>
                </p>

                <button type="submit">Create Account</button>

            </form>

            <p class="form-footer">
                Already have an account?
                <a href="login.html">Log In</a>
            </p>

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
            <a href="index.html">Home</a>
            <a href="about.html">About Us</a>
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
