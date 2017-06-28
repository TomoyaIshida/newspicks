$(function(){
  $("#submit-url").on("click",function(e){
    e.preventDefault();
    var url = $("#keyword").val();
    console.log(url)
    $.ajax({
      type: 'POST',
      url: '/articles',
      data: { content: url },
      dataType: 'html',
      contentType: false,
    })
    .done(function() {
      console.log("done")
    })
    .fail(function() {
      console.log("fail")
    })
  });
});
