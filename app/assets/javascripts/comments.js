
$(document).on('turbolinks:load', function() {
    $("#reply").on('click', function(event){
        event.preventDefault();
        if ($(".form-reply").hasClass("d-none"))
          $(".form-reply").removeClass("d-none");
        else
          $(".form-reply").addClass("d-none");
    });
});
