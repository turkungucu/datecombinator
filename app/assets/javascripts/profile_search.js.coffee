# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	splash = ['splash-male.jpg', 'splash-female.jpg', 'splash-female-2.jpg']
	image = "url(/assets/" + splash[Math.floor(Math.random() * splash.length)] + ")"
	$('.search-container').css('background-image', image)
			
	
		