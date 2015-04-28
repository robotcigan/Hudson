package servlets;

import java.sql.*;


public class DBConnect {

    public String name;
    public String password;
    public String query;
    public Boolean findUser;

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


    public void getData(String LOGIN, String PASSWORD){
        try {

            query = "select * from users where login = '" + USER_NAME + "'";
            rs = st.executeQuery(query);
            while(rs.next()){
                name = rs.getString("login");
                //password = rs.getString("password");
                System.out.println("Name from DB is: " + name + password);
                if(USER_NAME == name){
                    findUser = true;
                }
            }

            if (findUser == null){

                query = "select * from users where login = '" + LOGIN + "'" + " and password = '" + PASSWORD + "'";
                rs = st.executeQuery(query);
                while(rs.next()){
                    name = rs.getString("login");
                    password = rs.getString("password");
                }
                //System.out.println(query);
            }

            //System.out.println(name);
           // System.out.println(password);


        }catch (Exception ex){
            System.out.println(ex);
        }
    }

    public void saveQuery( String id_query, String queryName, String content , String action, String point_name, String id_type_query, String date_sla, String date_to, String date_from, String date_change  ){
        try {

            //String updateQuery = " UPDATE query SET name = ?, content = ? WHERE ID_QUERY = '" + id_query + "'";
            String updateQuery = " UPDATE query SET name = ?, content = ?, action = ?, point_name = ?, id_type_query = ?, date_sla = ?, date_to = ?, date_from = ?, date_change = ? WHERE ID_QUERY = ? ";
            //st.executeUpdate( updateQuery );
            PreparedStatement pst = con.prepareStatement( updateQuery );
            pst.setString( 1, queryName );
            pst.setString( 2, content );
            pst.setString( 3, action );
            pst.setString( 4, point_name );
            pst.setString( 5, id_type_query );
            pst.setString( 6, date_sla );
            pst.setString( 7, date_to );
            pst.setString( 8, date_from );
            pst.setString( 9, date_change );
            // Выбор строки, замыкающее значение
            pst.setString( 10, id_query );

            System.out.println( id_query + queryName + content + action + point_name + id_type_query + date_sla + date_to + date_from + date_change );
            System.out.println(updateQuery );

            pst.executeUpdate();

        }catch (Exception ex){
            System.out.println(ex);
        }
    }

}
