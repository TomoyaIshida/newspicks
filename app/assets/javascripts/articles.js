$(function(){
  $("#submit-url").on("click",function(e){
    e.preventDefault();
    var url = $("#keyword").val();
    $.ajax({
      type: 'POST',
      url: '/articles',
      data: { content: url },
      dataType: 'json',
    })
    .done(function(data) {
      console.log("done")
      // location.href = "/picks/new"
      location.href = "/articles/" + data.article_id + "/picks/new"
    })
    .fail(function() {
      console.log("fail")
      alert('投稿できないURLのようです。プロトタイプのためお許しください。');
    })
  });
});
