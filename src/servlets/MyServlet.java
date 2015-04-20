package servlets;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.*;




@WebServlet(name = "MyServlet", urlPatterns = {"/welcome", "/servlets/myServlet"})
public class MyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String LOGIN = request.getParameter("login");
        String PASSWORD = request.getParameter("password");

        String DB_LOGIN = "test";

        // Определение логина пользователя Windows
        String getUserName =  System.getProperty("user.home");
        String USER_NAME = getUserName.substring(getUserName.lastIndexOf("Users")+6);
        request.setAttribute("localUser", USER_NAME);
        request.getRequestDispatcher("orders.jsp").forward(request, response);


        out.println(LOGIN + PASSWORD);
        out.println("<a href='orders.jsp'>Welcome " + LOGIN + "!</a>");
        out.println( USER_NAME );

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
