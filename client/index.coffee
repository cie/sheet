
Template.sheet.events
  "keypress #cmdline": (e) ->
    if e.which is 13 and not e.shiftKey and not e.ctrlKey
      e.preventDefault()
      e.stopImmediatePropagation()
      Sheet.execute e.target.value
      e.target.value = ""

Template.sheet.helpers
  cells: ->
    Session.get "cells"

Template.cell.helpers
  label: ->
    @
  value: ->
    Session.get("cell-#{@}")
    Formulas[@]()

Template.sheet.rendered = ->
  $("#cmdline").focus()


