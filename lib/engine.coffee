defaultLabel = "result"
@Sheet =
  execute: (str) ->
    items = str.split("=")
    m = /^(\s*([a-zA-Z][a-zA-Z]*)\s*=)?(.*)$/.exec str
    return if not m

    label = if m[1] then m[2] else defaultLabel
    formula = m[3]

    parser.parse(formula) # just to test
    SetFormula label, formula

@SetFormula = (label, formula) ->
  Session.set "cell-#{label}", formula
  cells = Session.get("cells") or []
  if not _.contains cells, label
    cells.push label
    Session.set "cells", cells

@GetFormulaResult = (label) ->
  console.log "result", label
  parser.parse Session.get "cell-#{label}"

