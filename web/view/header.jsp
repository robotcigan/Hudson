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
                <input type="text" class="form-control"  id="search" placeholder="Поиск">
            </form>

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

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Арсений Иванов<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Действие</a></li>
                        <li><a href="#">Еще одно действие</a></li>
                        <li><a href="#">Выйти</a></li>
                    </ul>
                </li>

            </ul>

        </div>


</nav>