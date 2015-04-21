package servlets;

import java.sql.*;


public class DBConnect {

    public String name;
    public String password;
    public String query;


    private Connection con;
    private Statement st;
    private ResultSet rs;

    public DBConnect(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "admin");
            st = con.createStatement();
        }catch (Exception ex){
            System.out.println("Error: " + ex);
        }
    }

    // Определение логина пользователя Windows
    String getUserName =  System.getProperty("user.home");
    String USER_NAME = getUserName.substring(getUserName.lastIndexOf("Users")+6);


    public void getData(){
        try {

                query = "select * from users where login = '" + USER_NAME + "'";

            rs = st.executeQuery(query);
            while(rs.next()){
                name = rs.getString("login");
                password = rs.getString("password");
                System.out.println("Name from DB is: " + name + password);
            }

        }catch (Exception ex){
            System.out.println(ex);
        }
    }

}
