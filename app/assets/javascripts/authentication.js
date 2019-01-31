$(document).on('turbolinks:load', function() {
$('#phone').mask('9999999999');
  });

$(function(){
	let phoneField = $('#phone')[0]
	console.log(phoneField)

	$(phoneField).on('keyup', function(e){
		console.log(phoneField.value.length)

		const submit = document.getElementById("submit");
		submit.disabled = phoneField.value.length !== 10;
	})
})



