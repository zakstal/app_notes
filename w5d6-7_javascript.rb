---Arguments in Javascript---

arguments (array like object) keyword (like this) set every time a function is called. contains
all arguments even if you gave a function more than it asked for.

can use array#slice to make a copy of the array

var args = Array.prototype.slice.call(arguments);

currying decomposing a function that takes multiple arguments inot on that takes
single arguments successivly until it has the sufficuent number of arguments to
run.

---Prototypal Inheritance---

prototypal inheritance is the name of javascript inheritance

when calling a property on an object. first looks in object then in __proto__
  then recursivly look at the __proto__''s __proto__ unil == null

we want Poodle.prototype.__proto__ == Dog.prototype

we can set an objects __protp__ with the keyword new

function Animal () {};

function Dog () {};

// Replace the default `Dog.prototype` completely!
// `Dog.prototype.__proto__ == Animal.prototype`.
Dog.prototype = new Animal();

function Poodle() {};
// Likewise with `Poodle.prototype`.
Poodle.prototype = new Dog();

var myAnimal = new Animal();
var myDog = new Dog();
var myPoodle = new Poodle();

to inherit from a class use a surrogate class

function Animal (name) {
  this.name = name;
};

Animal.prototype.sayHello = function () {
  console.log("Hello, my name is " + this.name);
};

function Dog () {};

// The surrogate will be used to construct `Dog.prototype`.
function Surrogate () {};
// A `Surrogate` instance should delegate to `Animal.prototype`.
Surrogate.prototype = Animal.prototype;

// Set `Dog.prototype` to a `Surrogate` instance.
// `Surrogate.__proto__` is `Animal.prototype`, but `new
// Surrogate` does not invoke the `Animal` constructor function.
Dog.prototype = new Surrogate();

Dog.prototype.bark = function () {
  console.log("Bark!");
};

this will run the animal initialization logic without makeing a new animal object

function Dog (name, coatColor) {
  // call super-constructor function on **the current `Dog` instance**.
  Animal.call(this, name);

  // `Dog`-specific initialization
  this.coatColor = coatColor;
}

Note that we write Animal.call and not new Animal. Inside the Dog constructor,
we don''t want to construct a whole new Animal object. We just want to run the
Animal initialization logic on the current Dog instance. That''s why we use
call to call the Animal constructor, setting this to the current Dog instance.

Object.create method, which returns a new object with its __proto__ set to its
first argument. Here''s the modified code:

function Animal (name) {
  this.name = name;
}

Animal.prototype.sayHello = function () {
  console.log("Hello, my name is " + this.name);
};

function Dog (name, coatColor) {
  Animal.call(this, name);
  this.coatColor = coatColor;
};

// Set Dog.prototype to a new object whose
// __proto__ points to Animal.prototype.
Dog.prototype = Object.create(Animal.prototype);

Dog.prototype.bark = function () {
  console.log("Bark!");
};


---Client-side JavaScript---

there is no way to load there is no built-in way like Node''s require function
for a JavaScript library to ask that a second JavaScript library be loaded.

  ?: what is the difference between doing m.prototype = new Thing, or surrogate

  cannnot run a typical game loop with sleep. here is an alternative

  window.setInterval(function () {
    // call this once per second
    game.advanceState();
  }, 1000);

  console.log("Timer set!");

  The window.setInterval method schedules a timer that fires once every 1000
  milliseconds.