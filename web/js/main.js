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

    } )

})();