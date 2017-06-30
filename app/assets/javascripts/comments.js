$(function(){
  $("#save-comment").on("click",function(e){
    e.preventDefault();
    var comment = $("#keyword-comment").val();
    console.log(comment)
    $.ajax({
      type: 'POST',
      url: '/comments',
      data: { content: comment },
      dataType: 'html',
    })
    .done(function() {
      console.log("done")
      location.href = "/picks/new"
    })
    .fail(function() {
      console.log("fail")
      alert('コメントの投稿に失敗しました。もう一度お試しください');
    })
  });
});
