Function.prototype.myBind = function (context) {
  var fn = this;
  var zaksfunction = function(fn, context){
    fn.apply(context);
  };
  return zaksfunction(fn, context);
};

var m = function () {
  console.log(this.name);
}

var hello = {
  name: "Hello Zak"
};

m.myBind(hello);