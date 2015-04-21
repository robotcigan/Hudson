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

    public String LOGIN;
    public String PASSWORD;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        LOGIN = request.getParameter("login");
        PASSWORD = request.getParameter("password");

        // Хлам пример кода взятия параметров из java файлов
        Main DBSelect = new Main();
        int res = DBSelect.pow(4);
        out.println(res);
        String sample = DBSelect.test;
        out.println(sample);

        // Берет значения из java файла который выполняет селект sql
        DBConnect connect = new DBConnect();
        connect.getData();
        String DB_LOGIN = connect.name;
        String DB_PASSWORD = connect.password;

        // Определение логина пользователя Windows
        String getUserName =  System.getProperty("user.home");
        String USER_NAME = getUserName.substring(getUserName.lastIndexOf("Users")+6);
        // Переменная для пользователя Windows
        request.setAttribute("localUser", USER_NAME);

        int a = 3;

        // Проверка подлинности пользователя и перенаправление назад в случае неправильности
        if( USER_NAME.equals(DB_LOGIN) ){
            // Перенаправление на главную страницу с парамаметрами пользователя
            request.getRequestDispatcher("orders.jsp").forward(request, response);
        }
        //else if( LOGIN.equals(DB_LOGIN) && PASSWORD.equals(DB_PASSWORD) ){
            // Перенаправление на главную страницу с парамаметрами пользователя
            //request.getRequestDispatcher("orders.jsp").forward(request, response);
        //}
        else{
            String back = new String("hello.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", back);
        }



        out.flush();
        out.close();

    }
}
