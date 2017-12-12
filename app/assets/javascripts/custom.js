// exam partial delete link and segment partial del link
$(document).on("click", ".deletebutton", function(url){
  exam_id = $(this).data("id");
  url = $(this).data("url");
  $.ajax({
      type: "DELETE",
      url: url
  });
});

$(document).on("click", ".deletelink", function(url){
  question_id = $(this).data("id");
  url = $(this).data("url");
  $.ajax({
      type: "DELETE",
      url: url
  });
});

$(document).on("click", ".close, .close-btn", function(){
  $('.modal-backdrop').remove();
});


