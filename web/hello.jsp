<%--
  Created by IntelliJ IDEA.
  User: Арсений
  Date: 09.04.2015
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.4/yeti/bootstrap.min.css">--%>
    <link rel="stylesheet" href="lib/bootstrap-yeti.min.css"/>
    <script src="lib/jquery-2.1.1.js"></script>
    <script src="lib/bootstrap.js"></script>
</head>
<body>


<!-- Шапка -->

<nav class="navbar navbar-default" role="navigation">
  <div class="container">

        <div class="navbar-header">
            <a class="navbar-brand" href="/">Мониторинг</a>
         </div>


      <ul class="nav navbar-nav navbar-right">

        <li>
          <a  href="/mon/monitoring.jsp">Согласующие</a>
        </li>
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Группа согласующих<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Генерация</a></li>
            <li><a href="#">Согласование</a></li>
            <li><a href="#">Реализация</a></li>
          </ul>
        </li>
      </ul>
         
      </div>
</nav>

<!-- Контент -->
    <div class="container">

      <div class="row text-center">

        <div class="col-xs-2"></div>
        <div class="col-xs-8">
          
          <h2>Введите свой логин и пароль</h2>

            <form action="monitoring" method="GET">
                Введите имя 
                <input type="text" name="login"/>


                Введите пароль 
                <input type="text" name="password"/>

                <button class="btn btn-primary">Submit</button>

            </form>

        </div>
        <div class="col-xs-2"></div>
        
      </div>

    </div>



</body>
</html>
