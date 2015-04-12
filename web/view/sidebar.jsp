<%--
  Created by IntelliJ IDEA.
  User: Арсений
  Date: 11.04.2015
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="lib/simple-sidebar.css"/>


<!-- Sidebar -->
<div id="sidebar-wrapper">

    <ul class="sidebar-nav">

        <li>
            <a href="#">Все заказы</a>
        </li>
        <li>
            <a href="#">Редактирование заказов</a>
        </li>
        <li>
            <a href="#">Overview</a>
        </li>
        <li>
            <a href="#">Events</a>
        </li>
        <li>
            <a href="#">About</a>
        </li>
        <li>
            <a href="#">Services</a>
        </li>
        <li>
            <a href="#">Contact</a>
        </li>
    </ul>
</div>


<!-- Menu Toggle Script -->
<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>