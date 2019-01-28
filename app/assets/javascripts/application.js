// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require jquery.mask
//= require popper 
//= require bootstrap
//= bootstrap
//= require rails_emoji_picker
//= require_tree .


$(document).ready(function(){
$(".toggle-password").click(function() {
  $(this).toggleClass("fa-eye fa-eye-slash");
  var input = $($(this).attr("toggle"));
  if (input.attr("type") == "password") {
    input.attr("type", "text");
  } else {
    input.attr("type", "password");
  }
  });
$('#user_password').keyup(function() {
  var pass = $('#user_password').val();
  if (pass.length >= 8) {
    $("#check_simbol").addClass('text-success');
  }
});

var find_password = $('#user_password, #user_password_confirmation');
$('#user_password_confirmation').keyup(function() {
  var pass = $('#user_password').val();
  var pass_rep = $('#user_password_confirmation').val();
  if (pass == pass_rep) {
        $('#password_error').addClass('d-none');
  }
  else{
    $('#password_error').removeClass('d-none');
  }
});
});





