<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="MySql" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test"
                   user="root"  password="admin"/>


<sql:query var="rs0" dataSource="${MySql}">
    select ID_QUERY, NAME, CONTENT, DATE_TO, DATE_FROM, DATE_CHANGE, DATE_SLA, ACTION, POINT_NAME, ID_TYPE_QUERY from QUERY where ID_QUERY='2'
</sql:query>


    <div class="order panel panel-default">
        <div class="panel-heading">
            Редактирование
        </div>
        <form action="change_order.jsp" method="get">



            <div class="panel-body">

                <ul>

                    <c:forEach var="row" items="${rs0.rows}">

                        <div class="row">

                            <div class="col-xs-6">

                                <li>
                                    <p>ID Заказа</p>
                                    <input class="sql_result" type="text" name="id_query" value="${row.id_query}">
                                <li>
                                    <p>Наименование</p>
                                    <input class="sql_result" type="text" name="name" value="${row.name}">
                                </li>
                                <li>
                                    <p>Содержание</p>
                                    <input class="sql_result" type="text" name="content" value="${row.content}">
                                </li>
                                <li>
                                    <p>Действие</p>
                                    <input class="sql_result" type="text" name="action" value="${row.action}">
                                </li>
                                <li >
                                    <p >Наименование точки</p>
                                    <input class="sql_result" type="text" name="point_name" value="${row.point_name}">
                                </li>

                            </div>

                            <div class="col-xs-6">

                                <li>
                                    <p>Id класса запроса</p>
                                    <input class="sql_result" type="text" name="id_type_query" value="${row.id_type_query}">
                                </li>
                                <li >
                                    <p >Дата окончания срока</p>
                                    <input class="sql_result" type="date" name="date_sla" value="${row.date_sla}">
                                </li>
                                <li>
                                    <p>Дата начала</p>
                                    <input class="sql_result" type="date" name="date_to" value="${row.date_to}">
                                </li>
                                <li >
                                    <p>Дата конечная</p>
                                    <input class="sql_result" type="date" name="date_from" value="${row.date_from}">
                                </li>
                                <li>
                                    <p>Дата изменения</p>
                                    <input class="sql_result" type="date" name="date_change" value="${row.date_change}">
                                </li>

                            </div>

                        </div>


                    </c:forEach>

                </ul>

            </div>

            <div class="panel-footer">
                <button class="btn btn-primary" id="send" type="submit">Изменить</button>
            </div>

        </form>

    </div>
