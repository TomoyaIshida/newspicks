$(function(){
  $("#submit-url").on("click",function(e){
    e.preventDefault();
    var url = $("#keyword").val();
    $.ajax({
      type: 'POST',
      url: '/articles',
      data: { content: url },
      dataType: 'html',
    })
    .done(function() {
      console.log("done")
      location.href = "/picks/new"
    })
    .fail(function() {
      console.log("fail")
      alert('投稿できないURLのようです。プロトタイプのためお許しください。');
    })
  });
});
