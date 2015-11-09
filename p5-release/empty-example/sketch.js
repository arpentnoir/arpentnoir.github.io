
function preload(){
img = loadImage("assets/teddy.png");
}

function setup() {
  // uncomment this line to make the canvas the full size of the window
   createCanvas(windowWidth, windowHeight);
}

function draw() {
  // draw stuff here
   image(img, 0, 0);
}