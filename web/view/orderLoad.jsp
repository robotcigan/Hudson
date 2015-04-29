<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="MySql" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test"
                   user="root"  password="admin"/>

<% String id_query = request.getParameter("id_query"); %>

<sql:query var="rs0" dataSource="${MySql}">
    select ID_QUERY, NAME, CONTENT, DATE_TO, DATE_FROM, DATE_CHANGE, DATE_SLA, ACTION, POINT_NAME, ID_TYPE_QUERY, creator from QUERY where ID_QUERY='<%= id_query %>'
</sql:query>



    <form>

        <c:forEach var="row" items="${rs0.rows}">

            <div class="form-group">
                <span>ID Заказа</span>
                <input class="form-control" type="text" name="id_query" value="${row.id_query}">
            </div>
            <div class="form-group">
                <span>Наименование</span>
                <input class="form-control" type="text" name="name" value="${row.name}">
            </div>
            <div class="form-group">
                <span>Кем создано</span>
                <input class="form-control" type="text" disabled name="creator" value="${row.creator}">
            </div>
            <div class="form-group">
                <span>Содержание</span>
                <input class="form-control" type="text" name="content" value="${row.content}">
            </div>
            <div class="form-group">
                <span>Действие</span>
                <input class="form-control" type="text" name="action" value="${row.action}">
            </div>
            <div class="form-group">
                <span>Наименование точки</span>
                <input class="form-control" type="text" name="point_name" value="${row.point_name}">
            </div>


            <div class="form-group">
                <span>Id класса запроса</span>
                <input class="form-control" type="text" name="id_type_query" value="${row.id_type_query}">
            </div>
            <div class="form-group">
                <span>Дата окончания срока</span>
                <div class="input-group">
                    <input class="form-control form-control" type="date" name="date_sla" value="${row.date_sla}">
                    <div class="input-group-addon"><i class="fa fa-calendar-o"></i></div>
                </div>
            </div>
            <div class="form-group">
                <span>Дата начала</span>
                <div class="input-group">
                    <input class="form-control form-control" type="date" name="date_to" value="${row.date_to}">
                    <div class="input-group-addon"><i class="fa fa-calendar-o"></i></div>
                </div>
            </div>
            <div class="form-group">
                <span>Дата конечная</span>
                <div class="input-group">
                    <input class="form-control form-control" type="date" name="date_from" value="${row.date_from}">
                    <div class="input-group-addon"><i class="fa fa-calendar-o"></i></div>
                </div>
            </div>
            <div class="form-group">
                <span>Дата изменения</span>
                <div class="input-group">
                    <input class="form-control form-control" type="date" name="date_change" value="${row.date_change}">
                    <div class="input-group-addon"><i class="fa fa-calendar-o"></i></div>
                </div>
            </div>

        </c:forEach>

    </form>



