package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {

    private static Connection connection;
    private static final String URL = "jdbc:mysql://localhost:3306/";
    private static final String DATABASE = "medishop";
    private static final String USERNAME = "root";
    private static final String PASSWORD = ""; // Empty password

    private static Statement createConnection() throws Exception {

        if (connection == null) {
            // Ensure correct MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL + DATABASE, USERNAME, PASSWORD);
            System.out.println("Database connected successfully!");
        } else {
            System.out.println("Using existing database connection.");
        }
        return connection.createStatement();
    }

    public static int iud(String query) {
        int return_val = 0;
        try {
            System.out.println("Executing update: " + query);
            return_val = createConnection().executeUpdate(query);
            System.out.println("Update executed successfully.");
        } catch (SQLException e) {
            // Handle SQL exceptions
            System.err.println("SQLException: " + e.getMessage());
            System.err.println("SQLState: " + e.getSQLState());
            System.err.println("VendorError: " + e.getErrorCode());
            e.printStackTrace();
            return e.getErrorCode();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return return_val;
    }

    public static ResultSet search(String query) throws Exception {
        System.out.println("Executing query: " + query);
        ResultSet rs = createConnection().executeQuery(query);
        System.out.println("Query executed successfully.");
        return rs;
    }

    public static Connection getConnection() {
        if (connection == null) {
            try {
                // Ensure correct MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(URL + DATABASE, USERNAME, PASSWORD);
                System.out.println("Database connected successfully!");
            } catch (Exception e) {
                System.err.println("Failed to connect to the database.");
                e.printStackTrace();
            }
        } else {
            System.out.println("Using existing database connection.");
        }
        return connection;
    }
}
