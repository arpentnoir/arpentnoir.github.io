
import processing.video.*;
Movie clouds;
Dot D;
ArrayList Dots = new ArrayList();
PImage img;


void setup(){
  size(1280, 800);
  background(255, 255, 255);
  for(int i = 0; i < 1000; i++){
    D = new Dot(new PVector(random(width), random(height)), color(random(255), random(255), random(255)), 5);
    Dots.add(D);
  }
  //img = loadImage("sky.jpg");
  //clouds = new Movie(this, "clouds_004.mp4");
  //clouds.loop();
  smooth();
  noStroke();

}

void draw(){
  //image(clouds, 0, 0, 1280, 800);
  background(255, 255, 255);

  for(int i = 0; i < Dots.size(); i++){
    Dot D = (Dot) Dots.get(i);
    D.bounce();
    //D.toMouse();
    D.coherence();
    D.alignment();
    D.avoid();
    //D.approach();
    D.move();
    D.render();
  }
}

void movieEvent(Movie m){
  m.read();
}

void keyPressed(){
  D = new Dot(new PVector(mouseX, mouseY), color(0), 2);
  Dots.add(D);
}
