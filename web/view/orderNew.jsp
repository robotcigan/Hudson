<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="change_order.jsp" method="get">

    <ul>

        <div class="row">

            <div class="col-xs-6">

                <li>
                    <p>ID Заказа</p>
                    <input class="sql_result" type="text" name="id_query">
                <li>
                    <p>Наименование</p>
                    <input class="sql_result" type="text" name="name">
                </li>
                <li>
                    <p>Содержание</p>
                    <input class="sql_result" type="text" name="content">
                </li>
                <li>
                    <p>Действие</p>
                    <input class="sql_result" type="text" name="action">
                </li>
                <li >
                    <p >Наименование точки</p>
                    <input class="sql_result" type="text" name="point_name">
                </li>

            </div>

            <div class="col-xs-6">

                <li>
                    <p>Id класса запроса</p>
                    <input class="sql_result" type="text" name="id_type_query">
                </li>
                <li >
                    <p >Дата окончания срока</p>
                    <div class="input-group">
                        <input class="sql_result form-control" type="date" name="date_sla">
                        <div class="input-group-addon"><i class="fa fa-calendar-o"></i></div>
                    </div>
                </li>
                <li>
                    <p>Дата начала</p>
                    <div class="input-group">
                        <input class="sql_result form-control" type="date" name="date_to">
                        <div class="input-group-addon"><i class="fa fa-calendar-o"></i></div>
                    </div>
                </li>
                <li >
                    <p>Дата конечная</p>
                    <div class="input-group">
                        <input class="sql_result form-control" type="date" name="date_from">
                        <div class="input-group-addon"><i class="fa fa-calendar-o"></i></div>
                    </div>
                </li>
                <li>
                    <p>Дата изменения</p>
                    <div class="input-group">
                        <input class="sql_result form-control" type="date" name="date_change">
                        <div class="input-group-addon"><i class="fa fa-calendar-o"></i></div>
                    </div>
                </li>

            </div>

        </div>

    </ul>

</form>
