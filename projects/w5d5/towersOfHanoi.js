var readline = require('readline');

var reader = readline.createInterface({

  input: process.stdin,
  output: process.stdout
});

var discs = {
  one: "  ▣▣▣  ",
  two: " ▣▣▣▣▣ ",
  three: "▣▣▣▣▣▣▣",
  base: "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
  nums: "     0        1        2     "
};

function TofH() {
  this.towers = [[discs.three, discs.two, discs.one],[],[]];
}

TofH.prototype.isWon = function () {
  return ((this.towers[1].length === 3) || (this.towers[2].length === 3));
};

TofH.prototype.isValidMove = function (startTIdx, endTIdx) {
  var startT = this.towers[parseInt(startTIdx)];
  var endT  = this.towers[parseInt(endTIdx)];
  if (startT.empty()) {
    return false;
  } else if (endT.empty()) {
    return true;
  } else {
    return (startT[startT.length - 1] < endT[endT.length - 1]);
  };
};

TofH.prototype.move = function (sti, eti) {
  if (this.isValidMove(sti,eti)) {
    this.towers[eti].push(this.towers[sti].pop());
    return true;
  } else {
    return false;
  }

};

TofH.prototype.print = function () {
  console.log('\033[2J')

  for (var i = 3; i > 0; i--) {
    var blank = "  "
    this.towers.forEach(function(tower){
      if (tower.length >= i ) {
        blank += tower[i - 1]
      } else {
        blank += "       "
      };
      blank += "  ";
    });
    console.log(blank + "  ");
  }
  console.log(discs.base);
  console.log(discs.nums);
  // console.log(JSON.stringify(this.towers));
};

TofH.prototype.promptMove = function (callback) {
  this.print();
  reader.question("Choose a tower to move from: ", function (from) {
    reader.question("Choose a tower to move to: ", function (to) {
      callback(from, to);
    })
  });
};

TofH.prototype.run = function (completionCallback) {
  that = this
  this.promptMove(function(from, to){
    if (!that.move(from, to)) {
      console.log("You can't do that! Do you even know the rules for this game?");
    }
    if(!that.isWon()){
      that.run(completionCallback);
    } else {
      completionCallback(that);
    }
  });
};

TofH.prototype.endGame = function (that) {
  that.print();
  console.log("Thanks for playing");
  reader.close();
};

var game = new TofH();

game.run(game.endGame);
//use console.log('\033[2J')

Array.prototype.empty = function () {
  return (this.length === 0);
};


