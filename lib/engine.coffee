defaultLabel = "result"


@Sheet =
  execute: (str) ->
    try
      items = str.split("=")
      m = /^(\s*([a-zA-Z][a-zA-Z]*)\s*=)?(.*)$/.exec str
      throw "Please use <expr> or <var>=<expr> syntax." unless m

      label = if m[1] then m[2] else defaultLabel
      formula = m[3]

      parse(formula) # just to test
      SetFormula label, formula
    catch error
      alert(error)

@SetFormula = (label, formula) ->
  Session.set "cell-#{label}", formula
  cells = Session.get("cells") or []
  if not _.contains cells, label
    cells.push label
    Session.set "cells", cells

@GetFormulaResult = (label) ->
  formula = Session.get("cell-#{label}")
  if not formula
    throw "Undefined variable #{label}"
  result = parse Session.get("cell-#{label}")
  result


@parse = (str) ->
  createParser().parse(str)
