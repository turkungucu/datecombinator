# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->	
	reset_thumbs = ->
		$('.thumbs img').each ->
			if $(this).attr('src') != $('.full-image img').attr('src')
				$(this).attr('class', 'transparency')
			else
				$(this).attr('class', 'no-transparency')
				
	reset_thumbs()
		
	$('.thumbs img').click ->
		$('.full-image img').attr('src', $(this).attr('src'))
		reset_thumbs()
		false
	
	$('.thumbs img').mouseover ->
		$(this).attr('class', 'no-transparency')
	
	$('.thumbs img').mouseout ->
		$(this).attr('class', 'transparency')
		reset_thumbs()