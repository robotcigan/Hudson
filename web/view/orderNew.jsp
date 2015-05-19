<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<sql:setDataSource var="MySql" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test"
                   user="root"  password="admin"/>

<!-- Установка сегоднейшей даты -->
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate type="date" value="${now}" var="TODAY" pattern="yyyy-MM-dd"/>
<%
    String getUserName =  System.getProperty("user.home");
    String USER_NAME = getUserName.substring(getUserName.lastIndexOf("Users")+6);
%>
<sql:query var="select" dataSource="${MySql}">
    select id_type_query, name from type_query
</sql:query>

<form>

    <div class="form-group">
            <span>ID Заказа</span>
                <div class="input-group">
                    <input class="form-control" type="text" name="id_query">
                    <div class="input-group-addon"><i class="fa fa-check"></i></div>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <span>Наименование</span>
                <div class="input-group">
                    <input class="form-control" type="text" name="name">
                    <div class="input-group-addon"><i class="fa fa-check"></i></div>
                </div>
            </div>
            <div class="form-group">
                <span>Кем создано</span>
                <div class="input-group">
                    <input class="form-control" type="text" disabled name="creator" value="<%= USER_NAME %>">
                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                </div>
            </div>
            <div class="form-group">
                <span>Содержание</span>
                <div class="input-group">
                    <input class="form-control" type="text" name="content">
                    <div class="input-group-addon"><i class="fa fa-comment-o"></i></div>
                </div>
            </div>
            <div class="form-group">
                <span>Действие</span>
                <div class="input-group">
                    <input class="form-control" type="text" name="action">
                    <div class="input-group-addon"><i class="fa fa-check"></i></div>
                </div>
            </div>
            <div class="form-group">
                <span>Наименование точки</span>
                <div class="input-group">
                    <input class="form-control" type="text" name="point_name">
                    <div class="input-group-addon"><i class="fa fa-check"></i></div>
                </div>
            </div>


            <div class="form-group">
                <span>Id класса запроса</span>
                <div class="input-group">
                    <select class="form-control" name="id_type_query">
                        <c:forEach var="option" items="${select.rows}">
                            <option>${option.id_type_query} ${option.name}</option>
                        </c:forEach>
                    </select>
                    <div class="input-group-addon"><i class="fa fa-check"></i></div>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <span>Дата окончания срока</span>
                <div class="input-group">
                    <input class="form-control" type="date" name="date_sla">
                    <div class="input-group-addon"><i class="fa fa-calendar-o"></i></div>
                </div>
            </div>
            <div class="form-group" style="display: none">
                <span>Дата начала</span>
                <div class="input-group">
                    <input class="form-control" type="date" name="date_to" value="${TODAY}" disabled>
                    <div class="input-group-addon"><i class="fa fa-calendar-o"></i></div>
                </div>
            </div>
            <div class="form-group">
                <span>Дата конечная</span>
                <div class="input-group">
                    <input class="form-control" type="date" name="date_from">
                    <div class="input-group-addon"><i class="fa fa-calendar-o"></i></div>
                </div>
            </div>
            <div class="form-group" style="display: none">
                <span>Дата изменения</span>
                <div class="input-group">
                    <input class="form-control" type="date" name="date_change" value="${TODAY}" disabled>
                    <div class="input-group-addon"><i class="fa fa-calendar-o"></i></div>
                </div>
            </div>

</form>
