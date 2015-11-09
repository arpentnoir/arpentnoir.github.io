 /* @pjs preload="teddy.png"; */
int x, y, i;
float xs, ys, a, d; 

void setup(){
  size(200, 200);
  background(100);
  PImage img = loadImage("./teddy.png");
  image(img, 0, 0);
}

void draw(){
}

void mouseClicked(){
  setup();
}
