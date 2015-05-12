<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="MySql" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test"
                   user="root"  password="admin"/>


<%
    String agreement = request.getParameter("agreement");
    if(agreement == null){
        agreement = "true";
    }
%>


<sql:query var="sql" dataSource="${MySql}">
    select * from QUERY where agreement = '<%= agreement %>'
</sql:query>


    <table id="orders_table" class="table table-striped table-hover">

        <thead>
            <th>ID Заказа</th>
            <th>Наименование</th>
            <th>Кем создано</th>
            <th>Содержание</th>
            <th>Действие</th>
            <th>Наименование точки</th>
            <th>Id класса запроса</th>
            <th>Дата окончания срока</th>
            <th>Дата начала</th>
            <th>Дата конечная</th>
            <th>Дата изменения</th>
        </thead>

        <tbody>
        <c:forEach var="row" items="${sql.rows}">

          <tr data-toggle="modal" data-target="#orderModal">

            <td class="td-id">${row.id_query}</td>
            <td class="td-name">${row.name}</td>
            <td>${row.creator}</td>
            <td>${row.content}</td>
            <td>${row.action}</td>
            <td >${row.point_name}</td>
            <td>${row.id_type_query}</td>
            <td >${row.date_sla}</td>
            <td>${row.date_to}</td>
            <td >${row.date_from}</td>
            <td>${row.date_change}</td>

          </tr>
        </c:forEach>
        </tbody>
    </table>

