
var dubArr = [1,2,3];

var dubArray = function(arr) {
  for(var i = 0; i < arr.length; i++) {
    console.log(arr[i] * 2)
  };
};

var dub = function(el){
  return el * 2;
};

var myEach = function (arr, funky) {
  for (var i = 0; i < arr.length; i++){
    funky(arr[i]);
  };
};

myMap(dubArr,dub)

var myMap = function(arr,funky) {
  var new_arr = [];

  var myEach = function (arr, funky) {

    for (var i = 0; i < arr.length; i++){
     new_arr.push(funky(arr[i]));
    };
  };
  myEach(arr,funky)
  return new_arr;
};


var myInj = function(arr,funky) {
  var first = arr[0];
  var myEach = function (arr, funky) {

    for (var i = 0; i < arr.length; i++){
     first += funky(arr[i]);
    };
  };
  myEach(arr,funky);
  return first;
};