$(document).on('turbolinks:load', function() {
    uppendListeners();
  });
  function uppendListeners() {
    $(".reply_comment").unbind('click');
    $(".send").unbind('click');
    $(".reply_comment").on('click', function(event){
      event.preventDefault();
      hideFormReplies();
      const mainDiv = $(this).parentsUntil(".commentt")[2];
      const commentForm = $($(mainDiv).next().children()[0]);
      if (commentForm.hasClass("d-none")) {
        commentForm.removeClass("d-none");
        $("#comment_form_down").addClass("d-none"); 
        $(this).addClass("d-none");   
      } else {
        commentForm.addClass("d-none");
        $("#comment_form_down").removeClass("d-none");
      }
    });
    $(".send").on('click', function(){
      hideFormReplies();
      $("#comment_form_down").removeClass("d-none");
      $(".reply_comment").removeClass("d-none"); 
    });
  }
function hideFormReplies() {
  const commentForms = $(".form-reply");
    for (let i = 0; i < commentForms.length; i++)
      $(commentForms[i]).addClass("d-none");
      
}