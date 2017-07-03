$(document).on("click","#submit-url", function(e){
  e.preventDefault();
  var url = $("#keyword").val();
  $.ajax({
    type: 'POST',
    url: '/articles',
    data: { content: url },
    dataType: 'json',
  })
  .done(function(data) {
    location.href = "/articles/" + data.article_id + "/picks/new"
  })
  .fail(function() {
    alert('投稿できないURLのようです。プロトタイプのためお許しください。');
  })
});
