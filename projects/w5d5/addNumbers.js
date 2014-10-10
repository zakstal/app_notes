var readline = require('readline');

var reader = readline.createInterface({

  input: process.stdin,
  output: process.stdout
});

var addNumbers = function (sum, numsLeft, compCall) {
  var addTheNumber = function (numString) {
    var num = parseInt(numString);
    sum += num;
    numsLeft--;
    addNumbers(sum, numsLeft, compCall);
  };
  
  if (numsLeft > 0 ){
    console.log("here")
    reader.question("Choose a num", addTheNumber);
  } else if (numsLeft === 0) {
    compCall(sum);
  }
};

var endFn = function (sum) {
  console.log("Total Sum: " + sum);
  reader.close();
};

addNumbers(0, 3, endFn);