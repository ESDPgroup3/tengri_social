$(document).ready(function(){
$('#phone').mask('9999999999');
  });
<<<<<<< HEAD
// $(document).ready(function(){
// $('form').submit(function(){
//   var phone = $('#phone').val();
//   if (phone.length != 10){
//     $('#phone_error').removeClass('d-none');
//     return false;
//   }
//   else{
//     return true;
//   }
// });
//   });

=======

$(document).ready(function(){
$('form').submit(function(){
  var phone = $('#phone').val();
  if (phone.length != 10){
    $('#phone_error').removeClass('d-none');
    return false;
  }
  else{
    return true;
  }
});
  });
>>>>>>> 4bfea19f1bbbe34b95b930e328c4beaf059ff631
