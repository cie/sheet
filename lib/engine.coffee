defaultLabel = "result"
@Sheet =
  execute: (str) ->
    value = parser.parse str
    label = defaultLabel
    Formulas[label] = () -> value
    Session.set "cell-#{label}", Math.random()

    cells = Session.get("cells") or []
    if not _.contains cells, label
      cells.push label
      Session.set("cells", cells)

@Formulas = {}

