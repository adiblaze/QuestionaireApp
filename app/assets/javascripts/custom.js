// exam partial delete link
$(document).on("click", ".deletebutton", function(url){
  exam_id = $(this).data("id");
  $.ajax({
      type: "DELETE",
      url: "/exams/" + exam_id
  });
});

$(document).on("click", ".close", function(){
  $('.modal-backdrop').remove();
});


//Segment
$(document).on("click", ".deletelink", function(url){
  segment_id = $(this).data("id");
  $.ajax({
      type: "DELETE",
      url: "/segments/" + segment_id
  });
});

