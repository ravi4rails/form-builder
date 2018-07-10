var ready, set_positions;

set_positions = function(){
  $('.sortable-form-block').each(function(i){
    $(this).attr("data-pos",i+1);
  });

  $('.sortable-checkbox-questions').each(function(i){
    $(this).attr("data-pos",i+1);
  });

  $('.multiple-choice-sortable-form-block').each(function(i){
    $(this).attr("data-pos",i+1);
  });

  $('.dropdown-sortable-form-block').each(function(i){
    $(this).attr("data-pos",i+1);
  });

}

ready = function(){
  set_positions();

  $('.sortable').sortable();
  $('.checkbox-sortable').sortable();
  $('.multiple-choice-sortable').sortable();
  $('.dropdown-sortable').sortable();
  
  $('.sortable').sortable().bind('sortupdate', function(e, ui) {
    updated_order = []
    set_positions();
    $('.sortable-form-block').each(function(i){
      updated_order.push({ id: $(this).data("id"), position: i+1 });
    });
    $.ajax({
      type: "PUT",
      url: '/basic_forms/sort_blocks',
      data: { order: updated_order }
    });
  });

  $('.checkbox-sortable').sortable().bind('sortupdate', function(e, ui) {
    updated_order = []
    set_positions();
    $('.sortable-checkbox-questions').each(function(i){
      updated_order.push({ id: $(this).data("id"), position: i+1 });
    });
    $.ajax({
      type: "PUT",
      url: '/basic_forms/sort_checkbox_questions',
      data: { order: updated_order }
    });
  });

  $('.multiple-choice-sortable').sortable().bind('sortupdate', function(e, ui) {
    updated_order = []
    set_positions();
    $('.multiple-choice-sortable-form-block').each(function(i){
      updated_order.push({ id: $(this).data("id"), position: i+1 });
    });
    $.ajax({
      type: "PUT",
      url: '/basic_forms/sort_multiple_choices',
      data: { order: updated_order }
    });
  });

  $('.dropdown-sortable').sortable().bind('sortupdate', function(e, ui) {
    updated_order = []
    set_positions();
    $('.dropdown-sortable-form-block').each(function(i){
      updated_order.push({ id: $(this).data("id"), position: i+1 });
    });
    $.ajax({
      type: "PUT",
      url: '/basic_forms/sort_dropdowns',
      data: { order: updated_order }
    });
  });

}

$(document).ready(ready);
$(document).on('page:load', ready);