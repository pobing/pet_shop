// Generated by CoffeeScript 1.8.0
(function() {
  var Airplane, Automoible, Hatchback, Police, Train, Truck, myCar, plane, today, train1, train2, truck,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Airplane = (function() {
    function Airplane() {}

    Airplane.prototype.takeoff = function(eta) {
      var s, _i;
      this.taxi();
      for (s = _i = eta; eta <= 0 ? _i <= 0 : _i >= 0; s = eta <= 0 ? ++_i : --_i) {
        console.log("" + s + "...");
      }
      return console.log("mumu");
    };

    Airplane.prototype.taxi = function() {
      if (Math.random() > 0.5) {
        return console.log("Taxi ...");
      }
    };

    return Airplane;

  })();

  plane = new Airplane();

  plane.takeoff(7);

  plane.color = "white";

  Date.prototype.getYearAE = function() {
    var monthOffset;
    monthOffset = this.getMonth() < 11 ? 1 : 0;
    return this.getFullYear - 1944 - monthOffset;
  };

  today = new Date();

  console.log("It is the year " + (today.getYearAE()) + " AE");

  Train = (function() {
    function Train(numCars, type) {
      if (type == null) {
        type = "diese";
      }
      this.type = type;
      this.numCars = numCars;
      this.load = 0;
      this.capacity = numCars * 100;
    }

    Train.prototype.descible = function() {
      return ("A " + this.type + " train with " + this.numCars + " cars. ") + ("current filled: " + this.load + "/" + this.capacity + " tons.");
    };

    return Train;

  })();

  train1 = new Train(35);

  console.log(train1.descible());

  train2 = new Train(20, "steam");

  console.log(train2.descible());

  Automoible = (function() {
    function Automoible() {}

    Automoible.prototype.honk = function() {
      return console.log("Beep");
    };

    Automoible.prototype.radio = function(volume) {
      if (volume == null) {
        volume = 0;
      }
      return this.radioVolume = volume;
    };

    return Automoible;

  })();

  Hatchback = (function(_super) {
    __extends(Hatchback, _super);

    function Hatchback() {
      return Hatchback.__super__.constructor.apply(this, arguments);
    }

    Hatchback.prototype.carAlarm = function() {
      this.honk();
      this.honk();
      return this.honk();
    };

    return Hatchback;

  })(Automoible);

  myCar = new Hatchback;

  myCar.honk();

  Truck = (function(_super) {
    __extends(Truck, _super);

    function Truck() {
      return Truck.__super__.constructor.apply(this, arguments);
    }

    Truck.prototype.honk = function() {
      return console.log("BarAAAAp");
    };

    Truck.prototype.radio = function(volume) {
      return Truck.__super__.radio.call(this, volume + 2);
    };

    return Truck;

  })(Automoible);

  truck = new Truck;

  truck.radio(9);

  Police = (function(_super) {
    __extends(Police, _super);

    function Police() {
      return Police.__super__.constructor.apply(this, arguments);
    }

    Police.prototype.honk = function() {
      Police.__super__.honk.apply(this, arguments);
      return console.log("Weewoo,Weewoo");
    };

    return Police;

  })(Automoible);

}).call(this);
