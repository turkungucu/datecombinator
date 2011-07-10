# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	before = -> 
		$('#ajax-loader').toggle() 
		$('#search-results').slideUp("slow")
	
	after = -> 
		$('#search-results').slideDown("slow", -> 
			$('#ajax-loader').toggle()
		)
		 
	$("#search-form")
		.bind('ajax:beforeSend', before)
		.bind('ajax:complete', after)
		.bind('ajax:error', (xhr, status, error) ->
		)	