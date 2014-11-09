class window.Persion
  constructor: (@name) ->
  possessiveName: ->
    if @name[@name.length-1] in ['x','s','z']
      "#{@name}'"
    else
      "#{@name}'s"