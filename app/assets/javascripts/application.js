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
//= require lodash
//= require_tree .

$(document).ready(function(){
$(".toggle-password").click(function() {
  $(this).toggleClass("fa-eye fa-eye-slash");
  const input = $($(this).attr("toggle"));
  if (input.attr("type") == "password") {
    input.attr("type", "text");
  } else {
    input.attr("type", "password");
  }
});

$('#user_password').keyup(function() {
  const pass = $('#user_password').val();
  const submit = document.getElementById("create_password");
  submit.disabled = pass.length < 8 || pass.match(/\d/i) == 0;
  if (pass.length >= 8) {
    $("#check_simbol").addClass('text-success');
  } else {
    $("#check_simbol").removeClass('text-success');
  }
  if (pass.match(/\d/i) > 0) {
    $("#check_integer").addClass('text-success');
  } else {
    $("#check_integer").removeClass('text-success');
  }
  if (pass.match(/\d/i) > 0 && pass.length >= 8) {
    $("#create_password").addClass('send-information');
    $("#create_password").removeClass('block-send-information');
  } else {
    $("#create_password").removeClass('send-information');
    $("#create_password").addClass('block-send-information');
  }
});


});


