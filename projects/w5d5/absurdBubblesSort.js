var readline = require('readline');

var reader = readline.createInterface({

  input: process.stdin,
  output: process.stdout
});

function askIfLessThan(el1, el2, callback){
  reader.question("Is " + el1 + " Less than " + el2 + " ?", callback);
};

function outerBubbleSort(madeAnySwaps) {
  if (madeAnySwaps === true) {
    innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop);
  }
};

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {

    askIfLessThan(arr[i], arr[i + 1], function(isLessThan){
      if(isLessThan === "no"){
        var one = arr[i];
        var two = arr[i + 1];
        arr[i] = two;
        arr[i + 1] = one;
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
  } else if (i == (arr.length - 1)) {
    outerBubbleSortLoop(madeAnySwaps); {
    }
  }


};

function absurdBubbleSort(arr, sortCompletionCallback){
  var madeAnySwaps = false
  function outerBubbleSortLoop(madeAnySwaps) {

    if (madeAnySwaps === true) {
      madeAnySwaps = false
      innerBubbleSortLoop(arr, 0, madeAnySwaps, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  };
 innerBubbleSortLoop(arr, 0, madeAnySwaps, outerBubbleSortLoop);
};

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});

fn.bind(obj);
obj.fn();

obj.fn(arg);
fn.bind(obj)(arg);



