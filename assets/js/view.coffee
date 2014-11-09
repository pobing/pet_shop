class window.View
  renderToElement: (id,output) ->
    $("##{id}").html(output)
    # el = document.getElementById(id)
    # el.innerHTML = output

  imageTag: (fileName) ->
    if fileName?
      "<img src='images/#{fileName}' />"
    else
      ""