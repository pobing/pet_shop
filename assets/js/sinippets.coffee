class Airplane
  takeoff: (eta) ->
    @taxi()
    console.log "#{s}..." for s in [eta..0]
    console.log "mumu"
  taxi: ->
    if Math.random() > 0.5
      console.log "Taxi ..."
plane = new Airplane()
plane.takeoff(7)
plane.color = "white"

Date::getYearAE = ->
  monthOffset = if @getMonth() <  11 then 1 else 0
  @getFullYear - 1944 - monthOffset

today = new Date()
console.log "It is the year #{today.getYearAE()} AE"

class Train
  constructor: (numCars, type="diese") ->
    @type = type
    @numCars = numCars
    @load = 0
    @capacity = numCars * 100

  descible: ->
    "A #{@type} train with #{@numCars} cars. " +
      "current filled: #{@load}/#{@capacity} tons."

train1 = new Train(35)
console.log train1.descible()

train2 = new Train(20, "steam")
console.log train2.descible()

class Automoible
  honk: ->
   console.log "Beep"
  radio: (volume=0) ->
    @radioVolume = volume

class Hatchback extends Automoible
  carAlarm: ->
    @honk()
    @honk()
    @honk()

myCar = new Hatchback
myCar.honk()

class Truck extends Automoible
  honk: ->
    console.log "BarAAAAp"
  radio: (volume) ->
    super volume + 2

truck = new Truck
truck.radio 9 # raidio at 11

class Police extends Automoible
  honk: ->
    super
    console.log "Weewoo,Weewoo"

