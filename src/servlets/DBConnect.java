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
                //System.out.println("Name from DB is: " + name + password);
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

    public void Query( String id_query, String queryName, String creator, String changer, String content , String action, String point_name, String id_type_query, String date_sla, String date_to, String date_from, String date_change, String agreement,String type  ){
        try {

            //String updateQuery = " UPDATE query SET name = ?, content = ? WHERE ID_QUERY = '" + id_query + "'";
            String updateQuery = " UPDATE query SET name = ?, creator=?, changer=?, content = ?, action = ?, point_name = ?, id_type_query = ?, date_sla = ?, date_to = ?, date_from = ?, date_change = ?, agreement = ? WHERE ID_QUERY = ? ";
            String newQuery = " INSERT INTO QUERY ( name, creator, changer, content, action, point_name, id_type_query, date_sla,  date_to, date_from, date_change, agreement, ID_QUERY) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
            //st.executeUpdate( updateQuery );

            PreparedStatement pst = con.prepareStatement(updateQuery);

            if( type.equals("new") ){
                pst = con.prepareStatement( newQuery );
            }
            else{
                System.out.println("Not new");
            }

            pst.setString( 1, queryName );
            pst.setString( 2, creator );
            pst.setString( 3, changer );
            pst.setString( 4, content );
            pst.setString( 5, action );
            pst.setString( 6, point_name );
            pst.setString( 7, id_type_query );
            pst.setString( 8, date_sla );
            pst.setString( 9, date_to );
            pst.setString( 10, date_from );
            pst.setString( 11, date_change );
            // Согласован заказ или нет
            pst.setString( 12, agreement );
            // Выбор строки, замыкающее значение
            pst.setString( 13, id_query );

            System.out.println("Дата изменения" + date_change + "Кто изменил" + changer);
            System.out.println( id_query + queryName + creator + changer + content + action + point_name + id_type_query + date_sla + date_to + date_from + date_change + agreement );

            pst.executeUpdate();

        }catch (Exception ex){
            System.out.println(ex);
        }
    }

    public void deleteQuery(String id_query, String creator){
        try{
            // (Пока не работает на вошедших в ручную пользователей)Если создатель заказа не совпадает с пользователем windows, то нельзя удалять заказ
            if(creator.equals(USER_NAME)){
                String deleteQuery = "DELETE FROM QUERY WHERE id_query=?";
                PreparedStatement pst = con.prepareStatement( deleteQuery );
                pst.setString( 1, id_query );
                pst.executeUpdate();
            }
            else{
                // Использование нескольких одинаковых кавычек: deleteError = "<div class=\"alert alert-danger\" role=\"alert\">Вы не можете удалить этот заказ</div>";
                System.out.println("Вы не можете удалить заказ, который создан не вами");
            }
        }catch (Exception ex){
            System.out.println(ex);
        }
    }

    public void actionLog(String user, String action, String date,String id_query){
        try{
            String actionLog = "INSERT INTO action_log ( user, action, date, id_query ) values (?,?,?,?)";
            PreparedStatement pst = con.prepareStatement( actionLog );
            pst.setString( 1, user );
            pst.setString( 2, action );
            pst.setString( 3, date );
            pst.setString( 4, id_query );

            pst.executeUpdate();
        }catch (Exception ex){
            System.out.println(ex);
        }
    }

}
