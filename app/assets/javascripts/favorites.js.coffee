# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	before_add = -> 
		$('p#fav').empty().html('<img src="/assets/ajax-loader.gif" />') 
	
	after_add = -> 
		$('p#fav').empty().html('Added to favorites.')
		 
	$("#add-to-favs")
		.bind('ajax:beforeSend', before_add)
		.bind('ajax:error', (xhr, status, error) ->
		)	