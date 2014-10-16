find the index of an array indexOf()

add two strings together .concat


---Intro to Callbacks: File I/O---

closures are often used as  call backs
A callback is a function that is passed to another function and intended to be called at a later time

.setTimeout, holds a function and a value of time before it runs the function

javascript is asynchronous, these functions dont wait for work to be completed.

readline library for server-side node.js programs. is sort of like puts for js

var readline = require('readline');

?: example 3

---this and that---

below is a way to call a object function

function times(num, fun) {
  for (var i = 0; i < num; i++) {
    fun(); // call is made "function-style"
  }
}

var cat = {
  age: 5,

  ageOneYear: function () {
    this.age += 1;
  }
};

// Function argument is different:
times(10, function () {
  cat.ageOneYear();
});


a less verbose option
times(10, cat.ageOneYear.bind(cat));

bind is a method you can call on js functions. js functions are objects too
bind creates the anonymous function we had made by hand in the last example
this allows a function to be called function style but works like method style

Methods of Function objects live in Function.prototype.


you can capture this in a variable to use in anonymous fuctions

function SumCalculator() {
  // scope 0
  this.sum = 0;
}

SumCalculator.prototype.addNumbers = function (numbers) {
  var sumCalculator = this;

  numbers.forEach(function (number) {
    sumCalculator.sum += number; // will work as intended
  });

  return this.sum;
};

---Ways to Call a Function---

Let''s review the various ways to call a function that we have learned:

Function-style (fun(arg1, arg2))
this is set to window
Method-style (obj.method(arg1, arg2))
this is set to obj
Constructor-style (new ClassName(arg1, arg2)).
Creates a new, blank object.
Sets its __proto__ property to ClassName.prototype.
The ClassName function is called with this set to the blank object.
Your constructor function should setup the variables.
Implemented like the initialize method from Ruby
The return value is ignored.


Note that callbacks (that is, functions you pass to other functions)
are almost always eventually called function style, which makes this
the global object

apply Function#apply takes two arguments: an object to bind this to,
and an array of arguments

apply simulates calling greet as a method on obj

obj = {
  name: "Earl Watts"
};

// weird function; how is `this` supposed to be set if we don't call
// `greet` method style?
function greet(msg) {
  console.log(msg + ": " + this.name);
}

greet.apply(obj, ["hello"]);

Function#call is really similar to apply, but instead of taking in an array
of parameters, it takes them individually

apply has a performace cost

---Node Modules----


below is similar to adding a def to a class
// ./cat.js
function Cat () {
  // ...
};

Cat.prototype.meow = function () {
  // ...
};

module.exports = Cat;

// ./dog.js
function Dog () {
  // ...
};

Dog.prototype.bark = function () {
  // ...
};

module.exports = Dog;

// ./animals.js
var Cat = require("./cat");
var Dog = require("./dog");

var cat = new Cat();
var dog = new Dog();

cat.meow();
dog.bark();

Node uses require to allow one JS file to load a second JS file.

Node does something Ruby does not: every file gets its own "global" namespace.

To "export" a class definition to the requirer, we need to set module.exports.
The module variable is set up by Node, and its exports property is what is
returned by the call to require. Let''s see:

// ./silly.js
module.exports = "THIS IS MY EXPORTED STRING";

// ./main.js
var silly = require("./silly");
console.log(silly);

?: does the value have to be exported to be used by another program?

exporting mulitble objects
module.exports = {
  Pawn: require("./pawn"),
  Knight: require("./knight"),
  Bishop: require("./bishop"),
  // ...
};

// chess-board.js
var Pieces = require("./pieces");

var p = new Pieces.Pawn();
var k = new Pieces.Knight();
var b = new Pieces.Bishop();

?: pieces? where is that being exported?

---Crockcord----

<script src=filename.js> tags should be placed as late in the body as possible.
This reduces the effects of delays imposed by script loading on other page
components.

four spaces

Make comments meaningful. Focus on what is not immediately visible.

Define all variables at the top of the function.

try {
      statements
  } catch (variable) {
      statements
 } finally {
      statements
  }

  Blank spaces should be used in the following circumstances:

  A keyword followed by ( (left parenthesis) should be separated by a space.
          while (true) {
  A blank space should not be used between a function value and its
  ( (left parenthesis). This helps to distinguish between keywords
  and function invocations. All binary operators except . (period) and
  ( (left parenthesis) and [ (left bracket) should be separated from their
  operands by a space. No space should separate a unary operator and its
  operand except when the operator is a word such as typeof. Each ; (semicolon)
  in the control part of a for statement should be followed with a space.
  Whitespace should follow every , (comma).


