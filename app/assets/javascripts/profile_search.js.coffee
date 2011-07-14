# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$("#change-bg").click ->
		if $("#search-container").attr("class") == "splash-male"
			$("#search-container").attr("class", "splash-female")
		else if $("#search-container").attr("class") == "splash-female"
			$("#search-container").attr("class", "splash-female-2")
		else
			$("#search-container").attr("class", "splash-male")
			
	$("#seeking_gender").change ->
		if $("#seeking_gender").val() == "male"
			$("#search-container").attr("class", "splash-male")
		else
			$("#search-container").attr("class", "splash-female")
			
	
		