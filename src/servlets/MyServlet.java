package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.io.PrintWriter;



/**
 * Created by Арсений on 09.04.2015.
 */
@WebServlet(name = "MyServlet", urlPatterns = {"/welcome", "/servlets/myServlet"})
public class MyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        request.setCharacterEncoding("UTF-8");

        String LOGIN = request.getParameter("login");
        String PASSWORD = request.getParameter("password");

        String DB_LOGIN = "test";

        out.println(LOGIN + PASSWORD);
        out.println("<a href='orders.jsp'>Welcome " + LOGIN + "!</a>");

        if( LOGIN.equals(DB_LOGIN) ){
            out.println("<h1>Welcome " + LOGIN + "!</h1>");
        }
        else{
            String back = new String("/");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", back);
        }

        out.flush();
        out.close();

    }
}
