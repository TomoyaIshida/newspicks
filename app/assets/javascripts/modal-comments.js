$(document).on('turbolinks:load',function() {

  $(".modal-comment-open").click(function(){
    $(this).blur() ;
    if($("#modal-comment-overlay")[0]) return false ;
      $(".pickarea").append('<div id="modal-comment-overlay"></div>');
      $("#modal-comment-overlay").fadeIn("slow");
      $("#modal-comment-content").fadeIn("slow");
  });

  $('#modal-comment-close').click(function(){
    $("#modal-comment-content").fadeOut("slow",function(){
    });
    $("#modal-comment-overlay").fadeOut("slow",function(){
      $("#modal-comment-overlay").remove();
    });
  });
});
