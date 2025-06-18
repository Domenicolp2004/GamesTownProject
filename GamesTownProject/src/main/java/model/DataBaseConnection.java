package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConnection {

    private static final String URL = "jdbc:mysql://127.0.0.1:3306/gamestown";
    private static final String USER = "tuo_utente";
    private static final String PASSWORD = "tua_password";

    public static Connection getConnection() throws SQLException {
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver"); // Driver per MySQL 8
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}