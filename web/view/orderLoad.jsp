<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<sql:setDataSource var="MySql" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test"
                   user="root"  password="admin"/>

<% String id_query = request.getParameter("id_query"); %>
<%
    String getUserName =  System.getProperty("user.home");
    String USER_NAME = getUserName.substring(getUserName.lastIndexOf("Users") + 6);
%>

<!-- Установка сегоднейшей даты -->
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate type="date" value="${now}" var="TODAY" pattern="yyyy-MM-dd"/>

<sql:query var="rs0" dataSource="${MySql}">
    select ID_QUERY, NAME, CONTENT, DATE_TO, DATE_FROM, DATE_CHANGE, DATE_SLA, ACTION, POINT_NAME, ID_TYPE_QUERY, creator, changer, agreement from QUERY where ID_QUERY='<%= id_query %>'
</sql:query>
<sql:query var="select" dataSource="${MySql}">
    select id_type_query, name from type_query
</sql:query>


    <form>

        <c:forEach var="row" items="${rs0.rows}">

            <div class="form-group">
                <span>ID Заказа</span>
                <div class="input-group">
                    <input class="form-control" type="text" name="id_query" value="${row.id_query}">
                    <div class="input-group-addon"><i class="fa fa-check"></i></div>
                </div>
            </div>
            <hr>
            <div class="form-group">
                <span>Наименование</span>
                <div class="input-group">
                    <input class="form-control" type="text" name="name" value="${row.name}">
                    <div class="input-group-addon"><i class="fa fa-check"></i></div>
                </div>
            </div>
            <div class="form-group">
                <span>Кем создано</span>
                <div class="input-group">
                    <input class="form-control" type="text" disabled name="creator" value="${row.creator}">
                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                </div>
            </div>
            <div class="form-group">
                <span>Последниий изменивший</span>
                <div class="input-group">
                    <input class="form-control" type="text" disabled value="${row.changer}">
                    <div class="input-group-addon"><i class="fa fa-user"></i></div>
                </div>
                <input name="changer" type="text" style="display: none" value="<%= USER_NAME %>">
            </div>
            <div class="form-group">
                <span>Содержание</span>
                <div class="input-group">
                    <input class="form-control" type="text" name="content" value="${row.content}">
                    <div class="input-group-addon"><i class="fa fa-comment-o"></i></div>
                </div>
            </div>
            <div class="form-group">
                <span>Действие</span>
                <div class="input-group">
                    <input class="form-control" type="text" name="action" value="${row.action}">
                    <div class="input-group-addon"><i class="fa fa-check"></i></div>
                </div>
            </div>
            <div class="form-group">
                <span>Наименование точки</span>
                <div class="input-group">
                    <input class="form-control" type="text" name="point_name" value="${row.point_name}">
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
                    <input class="form-control" type="date" name="date_sla" value="${row.date_sla}">
                    <div class="input-group-addon"><i class="fa fa-calendar-o"></i></div>
                </div>
            </div>
            <div class="form-group">
                <span>Дата начала</span>
                <div class="input-group">
                    <input class="form-control" type="date" name="date_to" value="${row.date_to}" disabled>
                    <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                </div>
            </div>
            <div class="form-group">
                <span>Дата конечная</span>
                <div class="input-group">
                    <input class="form-control" type="date" name="date_from" value="${row.date_from}">
                    <div class="input-group-addon"><i class="fa fa-calendar-o"></i></div>
                </div>
            </div>
            <div class="form-group">
                <span>Дата изменения</span>
                <div class="input-group">
                    <input class="form-control" type="date" value="${row.date_change}" disabled>
                    <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                </div>
                <input name="date_change" type="date" style="display: none" value="${TODAY}">
            </div>
            <c:if test="${row.agreement == false}">
                <hr>
                <div class="form-group">
                    <span>Согласован</span>
                    <input class="form-control" type="checkbox" name="agreement">
                </div>
            </c:if>
            <c:if test="${row.agreement == true}">
                <input class="hideAgreement" type="checkbox" name="agreement">
            </c:if>


        </c:forEach>

    </form>



