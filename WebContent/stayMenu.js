$(document).ready(function() {
	var jbOffset = $('.zeta-menu').offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() > jbOffset.top) {
			$('.zeta-menu').addClass('Fixed');
		} else {
			$('.zeta-menu').removeClass('Fixed');
		}
	});
});