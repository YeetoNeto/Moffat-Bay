
package com.moffatbay;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

/**
 * Name: Brady Heinz
 * Project: Moffat Bay Lodge
 * Description: Validates registration information and
 * saves new customer accounts to the MySQL database.
 */
@WebServlet(name = "RegistrationServlet", urlPatterns = {"/register"})
public class RegistrationServlet extends HttpServlet {

    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/moffat_bay";

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Get registration form information
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Check for empty required fields
        if (isBlank(firstName) || isBlank(lastName)
                || isBlank(username) || isBlank(email)
                || isBlank(password) || isBlank(confirmPassword)) {

            showMessage(request, response,
                    "Please complete all required fields.", false);
            return;
        }

        // Remove extra spaces
        firstName = firstName.trim();
        lastName = lastName.trim();
        username = username.trim();
        email = email.trim();

        // Check field lengths
        if (firstName.length() > 50
                || lastName.length() > 100
                || username.length() > 32
                || email.length() > 254) {

            showMessage(request, response,
                    "One or more fields are too long.", false);
            return;
        }

        // Validate email address
        if (!email.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$")) {

            showMessage(request, response,
                    "Please enter a valid email address.", false);
            return;
        }

        // Validate password requirements
        if (!password.matches(
                "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$")) {

            showMessage(request, response,
                    "Password must contain at least 8 characters, "
                    + "an uppercase letter, a lowercase letter, "
                    + "and a number.", false);
            return;
        }

        // Confirm passwords match
        if (!password.equals(confirmPassword)) {

            showMessage(request, response,
                    "Passwords do not match.", false);
            return;
        }

        // Get database credentials from Tomcat
        String dbUser = getServletContext()
                .getInitParameter("db.username");

        String dbPassword = getServletContext()
                .getInitParameter("db.password");

        if (isBlank(dbUser) || isBlank(dbPassword)) {

            showMessage(request, response,
                    "Database connection is not configured.", false);
            return;
        }

        // Load the MySQL JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException ex) {

            getServletContext().log(
                    "MySQL JDBC driver not found", ex);

            showMessage(request, response,
                    "Registration could not be completed.", false);
            return;
        }

        // Connect to the database
        try (Connection connection =
                DriverManager.getConnection(
                        DB_URL, dbUser, dbPassword)) {

            connection.setAutoCommit(false);

            try {

                // Check whether username already exists
                String checkSQL =
                        "SELECT account_id FROM users "
                        + "WHERE username = ?";

                try (PreparedStatement check =
                        connection.prepareStatement(checkSQL)) {

                    check.setString(1, username);

                    try (ResultSet results = check.executeQuery()) {

                        if (results.next()) {
                            connection.rollback();

                            showMessage(request, response,
                                    "That username is already taken.",
                                    false);
                            return;
                        }
                    }
                }

                // Encrypt password using BCrypt
                String hashedPassword =
                        BCrypt.hashpw(password, BCrypt.gensalt());

                // Insert new user
                String userSQL =
                        "INSERT INTO users (username, password) "
                        + "VALUES (?, ?)";

                int accountId;

                try (PreparedStatement insertUser =
                        connection.prepareStatement(
                                userSQL,
                                Statement.RETURN_GENERATED_KEYS)) {

                    insertUser.setString(1, username);
                    insertUser.setString(2, hashedPassword);

                    insertUser.executeUpdate();

                    // Get newly created account ID
                    try (ResultSet keys =
                            insertUser.getGeneratedKeys()) {

                        if (!keys.next()) {
                            throw new SQLException(
                                    "Account ID was not generated.");
                        }

                        accountId = keys.getInt(1);
                    }
                }

                // Save customer account information
                String infoSQL =
                        "INSERT INTO account_information "
                        + "(account_id, first_name, last_name, email) "
                        + "VALUES (?, ?, ?, ?)";

                try (PreparedStatement insertInfo =
                        connection.prepareStatement(infoSQL)) {

                    insertInfo.setInt(1, accountId);
                    insertInfo.setString(2, firstName);
                    insertInfo.setString(3, lastName);
                    insertInfo.setString(4, email);

                    insertInfo.executeUpdate();
                }

                // Save both database inserts
                connection.commit();

            } catch (SQLException | RuntimeException ex) {

                // Undo changes if registration fails
                try {
                    connection.rollback();
                } catch (SQLException rollbackError) {
                    ex.addSuppressed(rollbackError);
                }

                throw ex;
            }

        } catch (SQLException ex) {

            getServletContext().log(
                    "Registration database error", ex);

            if (ex.getErrorCode() == 1062) {

                showMessage(request, response,
                        "That username is already taken.", false);

            } else {

                showMessage(request, response,
                        "Registration could not be completed.", false);
            }

            return;

        } catch (RuntimeException ex) {

            getServletContext().log(
                    "Registration error", ex);

            showMessage(request, response,
                    "Registration could not be completed.", false);
            return;
        }

        // Registration successful
        showMessage(request, response,
                "Your account has been created successfully!", true);
    }

    /**
     * Checks whether a field is empty.
     */
    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }

    /**
     * Displays a message on the registration page.
     */
    private void showMessage(HttpServletRequest request,
                             HttpServletResponse response,
                             String message,
                             boolean success)
            throws ServletException, IOException {

        request.setAttribute("registrationMessage", message);
        request.setAttribute("registrationSuccess", success);

        request.getRequestDispatcher("/registration.jsp")
                .forward(request, response);
    }

    /**
     * Redirects GET requests to the registration page.
     */
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        response.sendRedirect(
                request.getContextPath() + "/registration.jsp");
    }
}
