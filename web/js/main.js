(function(){

    var search;
    search = $('#search');

    function searchText( string, compared ) {
        return !!(string.search( compared ) + 1);
    }

    function trHide ( fieldType ) {
        
        $(fieldType).each(function () {

            if( searchText( $(this).text(), search.val() ) === false ){
                $(this).parent('tr').hide();
            }else{
                $(this).parent('tr').show();
            }

        })

    }

    search.on("keyup", function(){

        if( isNaN(search.val()) === true ){
            trHide('.td-name');
        }
        else{
            trHide('.td-id');
        }

        if( search.val() === '' ){
            $('#orders_table tbody tr').show();
        }

    })


})();