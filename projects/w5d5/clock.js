function Clock () {
  this.time = new Date();
}

Clock.TICK = 5000;

Clock.prototype.printTime = function () {
  // Format the time in HH:MM:SS
  console.log(clock.time);
  
};

Clock.prototype.run = function () {
  // 1. Set the currentTime.
  // 2. Call printTime.
  // 3. Schedule the tick interval.
  console.log("run " + clock)
  clock.printTime();
  setInterval(clock._tick, Clock.TICK);
  
  
};

Clock.prototype._tick = function () {
  // 1. Increment the currentTime.
  clock.time.setSeconds(5 + clock.time.getSeconds());
  // 2. Call printTime.
  clock.printTime();
};

var clock = new Clock();
clock.run();