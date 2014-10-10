var range = function(start, ending) {
  if (start === ending) {
    return [start];
  } else {
    return (range(start, ending - 1)).concat([ending]);
  }
};

var exponent = function(base,exp) {
  if (exp === 0){
    return 1;
  } else {
    return base * exponent(base, exp - 1);
  }
};

exponent(2,2);

var exponent2 = function (base, exp) {
  if (exp ===0) {
    return 1;
  } else if (exp === 1) {
    return base;
  } else {
    var half = exponent2(base, exp / 2);

    if (exp % 2 == 0) {
      return half * half;
    } else {
      return base * half * half;
    }
  }
};

exponent2(2,2);

var fib = function(num) {
  if (num <= 2){
    return [0,1];
  } else {
    fibs = fib(num - 1);

    return fibs.concat(fibs.slice(-2)[0] + fibs.slice(-1)[0]);
  }
};

fib(5);

var sortArr = [1,2,3,4,5]

var bsearch = function (arr,num) {
  var half = arr.length/2;

  if (num > arr[half]){ //upper
    return 1 + bsearch(arr[half, arr.length],num);
  } else if (num < arr[half]) {
    return bsearch(arr[half, arr.length],num);
  } else {
    return num;
  }
};

bsearch(sortArr, 4);