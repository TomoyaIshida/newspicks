$(document).on('turbolinks:load',function() {

  $(".modal-open").click(function(){
    $(this).blur() ;
    if($("#modal-overlay")[0]) return false ;
      $("body").append('<div id="modal-overlay"></div>');
      $("#modal-overlay").fadeIn("slow");
      $("#modal-content").fadeIn("slow");
  });

  $('#modal-close').click(function(){
    $("#modal-content, #modal-overlay").fadeOut("slow",function(){
      $("#modal-overlay").remove();
    });
  });
});
