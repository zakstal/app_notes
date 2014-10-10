var array = [1, 2, 1, 3, 3]

var myUniq = function(array) {
  var arr = []
  for(var i = 0; i < array.length; i++) {
    var el = array[i];
    if (arr.indexOf(el) === -1 ){
      arr.push(el);
    }
  };
  return arr
};

var sumArray = [-1, 0, 2, -2, 1]

var twoSum = function(arr) {
  var result = [];
  for (var i = 0; i < arr.length; i++ ){
    for (var j = (i + 1); j < arr.length; j++){

      if ((arr[i] + arr[j]) === 0){
        var coor = [i,j].sort();
        result.push(coor);
      }
    };
  };
  return result.sort();
};

var rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]

  var myTrans = function(rows) {
    var cols = [];
    for (var i = 0; i < rows.length; i++){
      var row = [rows[0][i],rows[1][i],rows[2][i]];
      cols.push(row);
    };
    return cols;
  };
