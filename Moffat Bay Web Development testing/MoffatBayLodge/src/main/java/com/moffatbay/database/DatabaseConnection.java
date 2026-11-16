
package com.moffatbay.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/moffat_bay";

    public static Connection getConnection() throws SQLException {
        String username = System.getenv("MOFFAT_DB_USER");
        String password = System.getenv("MOFFAT_DB_PASSWORD");

        if (username == null || password == null) {
            throw new SQLException("Database credentials are not configured.");
        }
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC driver not found", e);
        }
        
        return DriverManager.getConnection(URL, username, password);
    }
}
