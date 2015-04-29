<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- Modal -->
<div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Редактирование</h4>
            </div>
            <div id="orderLoad" class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                <button id="deleteOrder" type="button" class="btn btn-danger">Удалить</button>
                <button id="saveNewOrder" type="button" class="btn btn-success">Создать</button>
                <button id="saveOrder" type="button" class="btn btn-primary">Сохранить</button>
            </div>
        </div>
    </div>
</div>