package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "OrderController", urlPatterns = {"/order"})
public class OrderController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/plain");
        //String element = request.getParameter("element");
        PrintWriter out = response.getWriter();
        //out.print("<h1>Hello </h1>" + element);

        String id_query = request.getParameter("id_query");
        String queryName = request.getParameter("name");
        String creator = request.getParameter("creator");
        String content = request.getParameter("content");
        String action = request.getParameter("action");
        String point_name = request.getParameter("point_name");
        String id_type_query = request.getParameter("id_type_query");
        String date_sla = request.getParameter("date_sla");
        String date_to = request.getParameter("date_to");
        String date_from = request.getParameter("date_from");
        String date_change = request.getParameter("date_change");

        // Определение типа поступившего запроса
        String type = request.getParameter("type");

        // Подключение к класу обработки запроса
        DBConnect connect = new DBConnect();

        System.out.println(type);

        if(type.equals("delete")){
            connect.deleteQuery( id_query, creator );
        }else{
            connect.Query( id_query, queryName, creator, content, action, point_name, id_type_query, date_sla, date_to, date_from, date_change, type );
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
