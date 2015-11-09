import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class TartanGenerator3 extends PApplet {

int x, y, i;
float xs, ys, a, d; 
PImage img;

public void setup(){
  img = loadImage("photo-3.JPG");
  size(600, 600);
  background(0);
  noStroke();
  smooth();
  xs = random(img.width);
  ys = random(img.height);
  x=y=0;
  i = 1;
  a = PI/2;
  
  for(int q = 0; q < width * height; q++){
    fill(img.get(PApplet.parseInt(xs), PApplet.parseInt(ys)));
    xs = (img.width + xs + cos(a)) % img.width;
    ys = (img.height + ys + sin(a)) % img.height;
    fill(img.get(PApplet.parseInt(xs), PApplet.parseInt(ys)));
    //a+=(frameCount % 50) * d;

    if(x == width - 1){
      y++;
      i = - 1;
      rect(x, y, 1, 1);
      x = x + i;   
    } else if (x == 0){
      y++;
      i = 1;
      rect(x, y, 1, 1);
      x = x + i;
    } else {
      x = x + i;
      rect(x, y, 1, 1);
    }
  }
}

public void draw(){
}

public void mouseClicked(){
  setup();
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "TartanGenerator3" });
  }
}
