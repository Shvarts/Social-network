$ ->
	$(document).on "click", "button.navbar-toggle.collapsed", ->
		v = $(".panel").css('height');
		if (v=="35px")
			$(".navbar-collapse.bs-js-navbar-collapse.collapse").addClass('in')
			$(".navbar-collapse.bs-js-navbar-collapse.collapse").css('height','auto')	
		else
			$(".navbar-collapse.bs-js-navbar-collapse.collapse").removeClass('in')
			$(".navbar-collapse.bs-js-navbar-collapse.collapse").css('height','1px')