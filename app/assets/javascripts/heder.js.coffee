$ ->
	a = 0;
	v = 0;
	$("button.navbar-toggle.collapsed").click ->
		if (a==0)
			$(".navbar-collapse.bs-js-navbar-collapse.collapse").addClass('in')
			$(".navbar-collapse.bs-js-navbar-collapse.collapse").css('height','auto')
			v = $(".panel").css('height');
			$(".sidebar_d").css('margin-top',v)
			a=1;
		else
			$(".navbar-collapse.bs-js-navbar-collapse.collapse").removeClass('in')
			$(".navbar-collapse.bs-js-navbar-collapse.collapse").css('height','1px')
			v = $(".panel").css('height');
			$(".sidebar_d").css('margin-top',v)
			a=0;


  
