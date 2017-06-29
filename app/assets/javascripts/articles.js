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
    })
    .done(function() {
      console.log("done")
      location.href = "/"
    })
    .fail(function() {
      console.log("fail")
      alert('投稿できないURLのようです。プロトタイプのためお許しください。');
    })
  });
});
