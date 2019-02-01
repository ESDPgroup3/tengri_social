$(document).on('turbolinks:load', function() {
$('#phone').mask('9999999999');
  });

$(function(){
	let phoneField = $('#phone')[0]
	console.log(phoneField)

	$(phoneField).on('keyup', function(e){
		console.log(phoneField.value.length)

		if (phoneField.value.length === 10) {
			$($('#submit')[0]).attr('disabled', false)
		} else {
			$($('#submit')[0]).attr('disabled', true)
		}
	})
})


