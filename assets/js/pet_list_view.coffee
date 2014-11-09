class window.PetListView extends View
  constructor: (@views, @featuredPets) ->
    @featured = featuredPets

  render: ->
    @renderList()
    @renderFilteringBar()
    @renderFeatured()
    window.listView = @
    window.displayPetlist = (filterType) ->
      window.listView.renderList(filterType)
    window.selectPet = (index, element) ->
      window.listView.selectPet(index,element)

  renderList: (filter) ->
    petOutput = for view, i in @views when view.pet.matchesFilter filter
      "<li>#{view.formattedLink i}</li>"
    @renderToElement "available_pets", petOutput.join ""

  selectPet: (petIndex, element) ->
    petView = @views[petIndex]
    @renderToElement "pet_information", petView.formattedDescription()
    for link in $("#available_pets a")
      link.className = ""
    element.className = "selected"
    # for link in document.querySelectorAll("#available_pets a")
    #   link.className = ""
    # element.className = "selected"

  renderFeatured: ->
    return unless @featured?
    chosenPetIndex = Math.floor Math.random() * @featured.length
    chosenPetName = @featured[chosenPetIndex]
    for view, i in @views when view.pet.name is chosenPetName
      [chosenPetView, fullListIndex] = [view, i]
    @renderToElement "featured",
      "<span class='title'> Featured Pet </span>" + chosenPetView.formattedLink fullListIndex, false

  renderFilteringBar: ->
    filteringOutput =  for type in Animal.CATEGORIES
      "<li> <a href='#' onclick='displayPetlist(\"#{type}\")'>#{type}</a></li>"
    @renderToElement "filtering_ops", filteringOutput.join ""
