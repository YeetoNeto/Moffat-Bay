
<%@ page import="java.sql.*" %>
<%@ page import="com.moffatbay.database.DatabaseConnection" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Moffat Bay Database Test</title>
</head>
<body>
    <h1>Database Connection Test</h1>

    <%
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                 "SELECT * FROM Room_Types");
             ResultSet rs = stmt.executeQuery()) {

            out.println("<h2>Connection Successful!</h2>");

            while (rs.next()) {
                out.println("<p>Room: " +
                    rs.getString("room_type_name") +
                    " | Price: $" +
                    rs.getDouble("nightly_rate") +
                    "</p>");
            }

        } catch (SQLException e) {
            out.println("<h2>Connection Failed</h2>");
            out.println("<p>Check the Eclipse console for details.</p>");
            application.log("Database connection test failed", e);
        }
    %>
</body>
</html>
