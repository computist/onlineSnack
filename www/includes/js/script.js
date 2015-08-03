$(function() {
	$('.carousel').carousel({
  		interval: 5000
	});
	$( "#signup" ).click(function() {
  		$("#signupModal").appendTo("body").modal('show');

	});

});