package servlets;

import java.sql.ResultSet;
import java.sql.Statement;

public class Main {

    public static void main(String[] args){
        DBConnection connection = new DBConnection();

        String query = "select * from users";

        try {
            Statement statement = connection.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()){

                int id = resultSet.getInt("id");
                String login = resultSet.getString("login");
                String password = resultSet.getString("password");

                System.out.println( "User: " + id + login + password);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
