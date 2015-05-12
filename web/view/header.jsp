<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!-- Шапка -->

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">


        <div class="navbar-header">
            <a class="navbar-brand" href="/">Мониторинг</a>
        </div>

        <div class="navbar-collapse collapse" id="navbar-main">

            <ul class="nav navbar-nav">
                <li>
                    <a href="#menu-toggle" id="menu-toggle">Сайдбар</a>
                </li>
            </ul>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control"  id="search" placeholder="Поиск">
                </div>
                <button class="btn btn-success" id="excel-export">Экспорт в Excel</button>
            </form>

            <ul class="nav navbar-nav navbar-right">

                <li>
                    <a  href="/monitoring?agreement=false">На согласование</a>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Группа согласующих<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Генерация</a></li>
                        <li><a href="#">Согласование</a></li>
                        <li><a href="#">Реализация</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%= request.getAttribute("localUser") %><span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Действие</a></li>
                        <li><a href="#">Еще одно действие</a></li>
                        <li><a href="hello.jsp">Выйти</a></li>
                    </ul>
                </li>

            </ul>

        </div>


</nav>