# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  build_form = ->
    $('.vote_form input[type="hidden"]').remove()
    $('.vote_list li').filter(':not(.ui-sortable-placeholder)').each ->
      console.log 'wut'
      id = $(this).attr('id').replace('beer_id_', '')

      $('.vote_form').append("<input type=\"hidden\" name=\"beers[]\" value=\"#{id}\">")

  $('.master_beer_list li').draggable
    helper: 'clone'
    cursor: 'move'

  $('.vote_list').droppable(
    activeClass: "target_outline"
    hoverClass: "drop_now"
    accept: (draggable) ->
      return false if $(draggable).hasClass("ui-sortable-helper")
      return false if $(this).find('li').size() >= 5
      true
    drop: (event, ui) ->
      $(this).find(".place_holder").remove()
      $(this).find('li').filter( ->
        $(this).text() == ui.draggable.text() + '✖'
      ).remove()
      $("<li id=\"#{ui.draggable.attr('id')}\"></li>").text(ui.draggable.text()).append('<span class="remove">✖</span>').appendTo(this)
      build_form()
    tolerance: 'touch'
  ).sortable(
    items: "li:not(.place_holder)"
    sort: ->
      # gets added unintentionally by droppable interacting with sortable
      # using connectWithSortable fixes this, but doesn't allow you to customize active/hoverClass options
      $(this).removeClass("target_outline")
    stop: build_form
  )

  $('.vote_list').delegate '.remove', 'click', ->
    parent_list = $(this).parents('ol')

    $(this).parent('li').remove()

    if parent_list.find('li').size() < 1
      parent_list.append('<li class="place_holder">Drag here.</li>')
