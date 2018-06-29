var ready, set_positions;

set_positions = function(){
    // loop through and give each task a data-pos
    // attribute that holds its position in the DOM
    $('.multiple-choice-sortable-form-block').each(function(i){
        $(this).attr("data-pos",i+1);
    });
}

ready = function(){

    // call set_positions function
    set_positions();

    $('.multiple-choice-sortable').sortable();

    // after the order changes
    $('.multiple-choice-sortable').sortable().bind('sortupdate', function(e, ui) {
        // array to store new order
        updated_order = []
        // set the updated positions
        set_positions();

        $('.multiple-choice-sortable-form-block').each(function(i){
            updated_order.push({ id: $(this).data("id"), position: i+1 });
        });

        // send the updated order via ajax
        $.ajax({
            type: "PUT",
            url: '/basic_forms/sort_multiple_choices',
            data: { order: updated_order }
        });
    });
}

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);