# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$("#seeking_gender").change ->
		if $("#seeking_gender").val() == "male"
			$("#search-container").attr("class", "splash-male")
		else
			$("#search-container").attr("class", "splash-female")
			
	
		