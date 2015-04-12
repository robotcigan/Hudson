(function(){

    var search;
    search = $('#search');

    function searchText( string, compared ) {
        return !!(string.search( compared ) + 1);
    }

    search.on("keyup", function(){

        $('.td-id').each(function () {

            if( searchText($(this).text(), search.val()) === false ){
                $(this).parent('tr').hide();
            }else{
                $(this).parent('tr').show();
            }

        })

        if( search.val() === '' ){
            $('#orders_table tbody tr').show();
        }

    })


})();