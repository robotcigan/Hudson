package servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private final String URL = "jdbc:mysql://localhost:3306/test";
    private final String LOGIN = "root";
    private final String PASSWORD = "admin";

    public Connection connection;

    public DBConnection(){
        try {
            connection = DriverManager.getConnection(URL,LOGIN,PASSWORD);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return connection;
    }
}
