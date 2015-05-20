<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="MySql" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test"
                   user="root"  password="admin"/>

<%
    String getUserName =  System.getProperty("user.home");
    String USER_NAME = getUserName.substring(getUserName.lastIndexOf("Users") + 6);
%>

<sql:query var="sql" dataSource="${MySql}">
    select * from action_log where user = '<%= USER_NAME %>'
</sql:query>

<!-- Modal -->
<div class="modal fade" id="action_log" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-default">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Журнал действий</h4>
            </div>
            <div class="modal-body">
                <table class="table table-striped">
                    <thead>
                        <th>Действие</th>
                        <th>Дата действия</th>
                        <th>Id заказа</th>
                    </thead>
                    <tbody>
                        <c:forEach var="action" items="${sql.rows}">
                            <tr data-toggle="modal" data-target="#orderModal">
                                <td class="action">${action.action}</td>
                                <td>${action.date}</td>
                                <td>${action.id_query}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</div>