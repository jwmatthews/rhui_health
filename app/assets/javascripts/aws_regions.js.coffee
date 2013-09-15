# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#aws_forum_sync_button").click -> 
    # Submit a task to enque a look up to aws forum
    $("#aws_forum_sync_status").text("Processing...")
    $.ajax '/tasks/sync_aws_forum_ip_ranges',
        type: 'PUT'
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
            $('#aws_forum_sync_status').text "AJAX Error: #{textStatus}"
        success: (data, textStatus, jqXHR) ->
            $('#aws_forum_sync_status').text "Successful AJAX call: #{JSON.stringify(data)}"

