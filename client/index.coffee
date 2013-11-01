
Template.sheet.events
  "keypress #cmdline": (e) ->
    if e.which is 13 and not e.shiftKey and not e.ctrlKey
      e.preventDefault()
      e.stopImmediatePropagation()
      Sheet.execute e.target.value
      e.target.value = ""

Template.sheet.helpers
  cells: ->
    ({label: label} for label in Session.get("cells") || [])

Template.cell.helpers
  label: ->
    @label
  value: ->
    parse Session.get("cell-#{@label}")
  even: (index) ->
    console.log index
    if index % 2 is 0 then "even" else "odd"


Template.sheet.rendered = ->
  $("#cmdline").focus()


