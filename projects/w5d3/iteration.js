var arr = [2,5,3,2,6,7];

var bubSort = function(arr) {
  var isSort = false
  while (!isSort) {
    isSort = true;
    for (var i = 0; i < arr.length; i++){

      if (arr[i + 1] !== arr.length){
        if (arr[i] > arr[i + 1]){
          var one = arr[i];
          var two = arr[i + 1];

          arr[i] = two;
          arr[i + 1] = one;

          isSort = false;
        }
      }

    };

  };
  return arr;
};


var stir = "cat";

var subStr = function(str) {
  var subs = [];
  for(var i = 0; i < str.length; i++) {
    for(var j = i + 1; j <= str.length; j++) {

      subs.push(str.slice(i,j));
    };
  };
  return subs;
};

subStr(stir);