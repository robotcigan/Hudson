(function(){

    //Поиск по id и name
    var search;
    search = $('#search');

    // Возвращает true если нашлись совпадения в сравниваемых строках
    function searchText( string, compared ) {
        return !!(string.search( compared ) + 1);
    }

    // Удаление строк в которых не нашлось совпадений
    function trSearching( fieldType ) {
        
        $(fieldType).each(function () {

            if( searchText( $(this).text().toLowerCase(), search.val().toLowerCase() ) === false ){
                $(this).parent('tr').hide();
            }else{
                $(this).parent('tr').show();
            }

        })

    }

    // Активацие функций при вводе данных в input
    search.on("keyup", function(){

        if( isNaN( search.val() ) === true ){
            trSearching('.td-name');
        }
        else{
            trSearching('.td-id');
        }

        if( search.val() === '' || search.val() === ' ' ){
            $('#orders_table tbody tr').show();
        }

    })

    //Сортировка элементов по возрастаниию/убыванию
    $('#orders_table th').on( 'click', function(){

        $('#orders_table tr').each(function(){
            $(this).insertAfter( $('#orders_table tr').first() );
        })

    } );


    // Переменные типа отправки запроса и номера заказа на открытие
    var id_query, type;

    // Открытие заказа на редактирование
    $('#orders_table tbody tr').on("click", function(){
        id_query = $(this).children('.td-id').text();
        $("#orderLoad").load( "/view/orderLoad.jsp", { "id_query": id_query } );
    });

    // Открытие создания заказа
    $('#createOrder').on("click", function(){
        $("#orderLoad").load( "/view/orderNew.jsp" );
        // Определяет тип поступаещего запроса
        type = "new";
    });

    // Отправка на сохранение измененного заказа
    $('#saveOrder').on("click", function(){

        var name, creator, content, action, point_name, id_type_query, date_sla, date_to, date_from, date_change, type;

        name = $( "input[name$='name']").val();
        creator = $( "input[name$='creator']").val();
        content = $( "input[name$='content']").val();
        action = $( "input[name$='action']").val();
        point_name = $( "input[name$='point_name']").val();
        id_type_query = $( "input[name$='id_type_query']").val();
        date_sla = $( "input[name$='date_sla']").val();
        date_to = $( "input[name$='date_to']").val();
        date_from = $( "input[name$='date_from']").val();
        date_change = $( "input[name$='date_change']").val();

        console.log($( "input[name$='content']").text());
        // Определяет тип поступаещего запроса
        type = "change";

        $.post( "/order", { id_query: id_query, name: name, creator: creator ,content: content, action: action, point_name: point_name, id_type_query: id_type_query, date_sla: date_sla, date_to: date_to, date_from: date_from, date_change: date_change, type: type  } );

    });

    // Отправка на сохранение нового заказа
    $('#saveNewOrder').on("click", function(){

        var name, creator, content, action, point_name, id_type_query, date_sla, date_to, date_from, date_change, type;

        id_query = $( "input[name$='id_query']").val();

        name = $( "input[name$='name']").val();
        creator = $( "input[name$='creator']").val();
        content = $( "input[name$='content']").val();
        action = $( "input[name$='action']").val();
        point_name = $( "input[name$='point_name']").val();
        id_type_query = $( "input[name$='id_type_query']").val();
        date_sla = $( "input[name$='date_sla']").val();
        date_to = $( "input[name$='date_to']").val();
        date_from = $( "input[name$='date_from']").val();
        date_change = $( "input[name$='date_change']").val();

        // Определяет тип поступаещего запроса
        type = "new";

        $.post( "/order", { id_query: id_query, name: name, creator: creator,content: content, action: action, point_name: point_name, id_type_query: id_type_query, date_sla: date_sla, date_to: date_to, date_from: date_from, date_change: date_change, type: type  } );

    });

    // Отправка на удаление заказа
    $('#deleteOrder').on("click", function(){

        var type, creator;

        id_query = $( "input[name$='id_query']").val();
        creator = $( "input[name$='creator']").val();

        // Определяет тип поступаещего запроса
        type = "delete";

        $.post( "/order", { id_query: id_query, creator: creator,type: type  } );

    });

    // Экспорт в excel
    $("#excel-export").click(function(){
        $("#orders_table").table2excel({
            // exclude CSS class
            exclude: ".noExl",
            name: "Orders"
        });
    });

})();
