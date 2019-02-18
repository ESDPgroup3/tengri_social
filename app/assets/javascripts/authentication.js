$(document).on('turbolinks:load', function() {
  $('#phone').mask('9999999999');
  $('#user_nickname').keyup(_.debounce(checkUsernameExists, 350));
});

$(function() {
	let phoneField = $('#phone')[0];
	console.log(phoneField);
	$(phoneField).on('keyup', function(e) {
		console.log(phoneField.value.length);
		const submit = document.getElementById("submit");
		submit.disabled = phoneField.value.length !== 10;
	});
});

$(function() {
  $('#phone').keyup(function() {
    const phone = $('#phone').val();
    if (phone.length == 10) {
      $("#submit").addClass('send-information');
      $("#submit").removeClass('block-send-information');
    } else {
      $("#submit").addClass('block-send-information');
      $("#submit").removeClass('send-information');
    }
  })
});
  
function checkUsernameExists() {
  const nickname = $('#user_nickname').val();
  const submitnick = document.getElementById("create_nickname");
  submitnick.disabled = (nickname.length <= 4 && nickname.length >= 15);
  if (nickname.length >= 4 && nickname.length <= 15) {
    makeServerCallNickname();
  } else {
    disableSubmit();
  }
}

function makeServerCallNickname() {
  $.ajax({
      url: "/authentication/nickname_exists",
      method: "POST",
      contentType: "application/json",
      data: JSON.stringify({ "nickname": $("#user_nickname").val() }),
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
      }
    })
    .done(function(data) {
      if (data === "true") {
        $("#msg_error").removeClass('d-none');
        $("#nick_field").removeClass('input_valide');
        $("#nick_field").addClass('input_invalide');

        disableSubmit();
      } else {
        $("#msg_error").addClass('d-none');
        $("#nick_field").removeClass('input_invalide');
        $("#nick_field").addClass('input_valide');
        enableSubmit();
      } 
    });
}


function disableSubmit() {
  $("#create_nickname").removeClass('send-information');
  $("#create_nickname").addClass('block-send-information');

}

function enableSubmit() {
  $("#create_nickname").addClass('send-information');
  $("#create_nickname").removeClass('block-send-information');
}