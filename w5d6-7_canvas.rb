---Canvas---

translate allows us to use the same rectangle but moves it over 100 px in this exp:

ctx.fillStyle = "red";
for(var i=0; i<data.length; i++) {
    var dp = data[i];
    ctx.translate(100, 0);
    ctx.fillRect(0,0,50,dp);
}


can save state using save() and restore() in the assigned variable:

for(var i=0; i<data.length; i++) { 
    c.save(); 
    c.translate(40+i*100, 460-dp*4); 
    var dp = data[i]; 
    c.fillRect(0,0,50,dp*4); 
    c.restore(); 
}

can mask to get partial shapes with .clip()

// draw rect the first time
ctx.fillStyle = 'red';
ctx.fillRect(0,0,400,100);

// create triangle path
ctx.beginPath();
ctx.moveTo(200,50);
ctx.lineTo(250,150);
ctx.lineTo(150,150);
ctx.closePath();

// stroke the triangle so we can see it
ctx.lineWidth = 10;
ctx.stroke();

// use triangle as clip, 
ctx.clip();
//fill rect in again with yellow
ctx.fillStyle = 'yellow';
ctx.fillRect(0,0,400,100);


to make events in coordition with the mouse
 isPointInPath. This function will tell you if a given coordinate is 
 inside of the current path. Here''s a quick example:

c.beginPath(); 
c.arc( 
    100,100, 40,  //40 pix radius circle at 100,100 
    0,Math.PI*2,  //0 to 360 degrees for a full circle 
); 
c.closePath(); 
var a = c.isPointInPath(80,0);     // returns true 
var b = c.isPointInPath(200,100);  // returns false 


can also use the amino library wich works interms of shapes and not pixles

---Animation---

to animate the best way is to use:
The easiest way to do this is with the JavaScript setInterval() function. 
It will call your drawing function every N msec
However, we should never actually use setInterval. 

Instead we should use a newer API requestAnimationFrame.
this gives the browser complete control and makes animation smoother.
To make requestAnimationFrame a loop just call it recursively as the first thing.

different browsers has their own versions. To fix this we will use Paul Irish''s 
shim script. This just maps the different variations to a new function: 
requestAnimFrame.

// shim layer with setTimeout fallback 
window.requestAnimFrame = (function(){ 
  return  window.requestAnimationFrame       ||  
          window.webkitRequestAnimationFrame ||  
          window.mozRequestAnimationFrame    ||  
          window.oRequestAnimationFrame      ||  
          window.msRequestAnimationFrame     ||  
          function( callback ){ 
            window.setTimeout(callback, 1000 / 60); 
          }; 
})();



Our rectangle does go across the screen, updating by five pixels every 
100 millesconds (or 10FPS), but the old rectangle is still there. 
It looks like the rectangle is just getting longer and longer.


now we clear the rectangel before we draw it
with c.clearRect(0,0,canvas.width,canvas.height); 

var x = 0; 
function drawIt() { 
    window.requestAnimFrame(drawIt); 
    var canvas = document.getElementById('canvas'); 
    var c = canvas.getContext('2d'); 
    c.clearRect(0,0,canvas.width,canvas.height); 
    c.fillStyle = "red"; 
    c.fillRect(x,100,200,100); 
    x+=5; 
} 
 
window.requestAnimFrame(drawIt); 

particle simulator algorithm

create par, update par, draw par, kill par.

simple snow example:
var canvas = document.getElementById('canvas'); 
var particles = []; 
var tick = 0; 
function loop() { 
    window.requestAnimFrame(loop); 
    createParticles(); 
    updateParticles(); 
    killParticles(); 
    drawParticles(); 
} 
window.requestAnimFrame(loop); 


?: is the loop function lazily evalutated?

sprite is an image usually cut from a larger (a sprite sheet)
image that can be drawn quickly

can draw a sprite by specifying source coordinates

context.drawImage( 
    img,        // the image of the sprite sheet 
    65,0,13,13, // source coordinates      (x,y,w,h) 
     0,0,13,13,  // destination coordinates (x,y,w,h) 
    ); 

now we flip through the pictures

var frame = tick % 10;  
var x = frame * 13; 
context.drawImage( 
    img,        // the image of the sprite sheet 
    x,0,13,13, // source coordinates      (x,y,w,h) 
    0,0,13,13,  // destination coordinates (x,y,w,h) 
    ); 
tick++;


---MAKING A GAME---

Space Invaders

