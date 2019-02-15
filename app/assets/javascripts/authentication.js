$(document).on('turbolinks:load', function() {
$('#phone').mask('9999999999');
  });

$(function(){
	let phoneField = $('#phone')[0]
	console.log(phoneField);

	$(phoneField).on('keyup', function(e){
		console.log(phoneField.value.length);

		const submit = document.getElementById("submit");
		submit.disabled = phoneField.value.length !== 10;
	})
});

$(function(){
  $('#phone').keyup(function() {
  const phone = $('#phone').val();
  if (phone.length == 10) {
    $("#submit").addClass('send-information');
    $("#submit").removeClass('block-send-information');
  } else {
    $("#submit").addClass('block-send-information');
    $("#submit").removeClass('send-information');
  }
});
  $('#user_nickname').keyup(function() {
    const nickname = $('#user_nickname').val();
    const submitnick = document.getElementById("create_nickname");
    submitnick.disabled = (nickname.length <= 4 && nickname.length >= 15);
  if (nickname.length >= 4 && nickname.length <= 15) {
    $("#create_nickname").addClass('send-information');
    $("#create_nickname").removeClass('block-send-information');
  } else {
    $("#create_nickname").removeClass('send-information');
    $("#create_nickname").addClass('block-send-information');
  }
})
})

