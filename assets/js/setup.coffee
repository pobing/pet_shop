shop = {
  owner: { name: "Jdd" }
  animals: [
    name: "Kelsey"
    type: "dog"
    age: 3
    breed: "Labrador"
    description: "A sweet and loyal dog. Loves to play fetch. Sometimes drinks out of the toilet."
  ,
    name: "Sgt. Snuffles"
    type: "dog"
    breed: "Pug"
    description: "Small in stature, but big in heart, Sgt. Snuffles is never one to back down from a mission."
  ,
    name: "Chomps"
    type: "rabbit"
    age: 4
    breed: "Giant Angora"
    description: "Chomps is usually very good-natured, but he does not take kindly to being mistaken for an ottoman. Come see him in person and you'll understand why that may happen."
  ,
    name: "Flops"
    type: "rabbit"
    age: 2
    breed: "French Lop"
    image: "flops.jpg"
    description: "Enjoys nothing more than a good roll in the grass and a nap in the sun."
  ,
    name: "Bopper"
    type: "rabbit"
    breed: "Checkered Giant"
    description: "The quiet one of the group. Loves celery."
  ,
    name: "Chairman Meow"
    type: "cat"
    breed: "Snowshoe"
    description: "True to his name, Chairman Meow fancies himself in charge."
  ,
    name: "Jacques"
    type: "cat"
    age: 1.5
    breed: "Manx"
    description: "A happy-go-lucky cat who occasionally finds himself at odds with Chairman Meow over who gets to sit at the top of the cat tree."
  ,
    name: "Chupa"
    type: "cat"
    breed: "Scottish Fold"
    image: "chupa.jpg"
    description: "Chupa always appears perplexed with the world, but don't be fooled. That's just the way his face is shaped."
  ,
    name: "Alfred"
    type: "horse"
    age: 3.5
    breed: "Breton"
    description: "The resident shop patriarch. Very calm and tolerates the antics of the other animals when they sneak into his pen."
  ]
}

$("#owner_name").append(shop.owner.name)
$(document).attr("title","#{shop.owner.name} 's Pet Shop")
# document.title = shop.owner.name + "'s Pet Shop"

formatDescription = (pet) ->
  "<h2> #{pet.name} </h2>" +
  "<h3 class='breed'> #{pet.breed} " +
    "(#{pet.age ? "??" } years old)</h3>" +
    imageTag(pet.image) +
  "<p class='description'> #{pet.description}</p>"

imageTag = (filename) ->
  if filename?
    "<img src='images/#{filename}' />"
  else
    ""

window.selectPet = (petIndex,element) ->
  pet = shop.animals[petIndex]
  $("#pet_information").html(formatDescription(pet))
  for link in $("#available_pets a")
    link.className = ""
  element.className = "selected"

# animalSound = (animal) ->
#   switch animal.type
#     when "cat" then "meow"
#     when "dog" then "bark"
#     when "horse", "donkey"
#       "neigh"
#     else "sniff sniff"

animalBehaviors = (animal) ->
  switch animal.type
    when "cat" then ["meow", null]
    when "dog" then ["bark","wag"]
    when "rabbit" then [null, "hop,hop"]
    when "horse","donkey"
      ["neigh", null]
    else
      [null,null]

formatPatName = (pet, showBehavior) ->
  result = pet.name
  if showBehavior
    [sound, action] = animalBehaviors pet
    [behavior, cssClass] = if sound?
      ["#{sound}!", "sound"]
    else
      [action, "action"]

    result += "<span class='#{cssClass}'>#{behavior.toLowerCase()}</span>"
  result


formatPetLink = (pet,i, showBehavior=true) ->
  "<a href='#' onclick='selectPet(#{i},this)'>" +
    "#{formatPatName pet, showBehavior}</a>"


window.displayPetlist = (filter="All") ->
  petOutput = for pet, i in shop.animals when filter  is "All" or filter.toLowerCase() is pet.type
    "<li>#{formatPetLink(pet, i)}</li>"

  $("#available_pets").html(petOutput.join "")

window.displayPetlist()

petTypes = [
  'All'
  'Dog'
  'Cat'
  'Rabbit'
  'Horse'
]

filteringOutput = for type in petTypes
  "<li> <a href='#' onclick='displayPetlist(\"#{type}\")'>#{type}</a></li>"

$("#filtering_ops").html(filteringOutput.join "")

# petOutput = for pet,i in shop.animals
#   "<li> <a href='#' onclick='selectPet(#{i},this)'>" +
#   "#{formatPatName pet}</a> </li>"

displayFeatured = (featurePets...) ->
  chosenPetIndex = Math.floor Math.random() * featurePets.length
  chosenPetName = featurePets[chosenPetIndex]
  for pet, i in shop.animals when pet.name is chosenPetName
    [chosenPet, fullListIndex] = [pet, i]
  $("#featured").html("<span class='title'> Featured Pet </span>" + formatPetLink chosenPet, fullListIndex, false)

displayFeatured "Chupa", "Kelsey", "Flops"


# $("#available_pets").html(petOutput).join("")

