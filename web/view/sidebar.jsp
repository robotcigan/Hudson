<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="lib/simple-sidebar.css"/>


<!-- Sidebar -->
<div id="sidebar-wrapper">

    <ul class="sidebar-nav">

        <li>
            <a href="/monitoring">Все заказы<span class="badge">119</span></a>
        </li>
        <li id="createOrder" data-toggle="modal" data-target="#orderModal">
            <a href="#">Создать заказ</a>
        </li>
        <li>
            <a href="/view/charts.jsp">Графики</a>
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