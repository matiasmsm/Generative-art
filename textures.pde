import processing.video.*;

Movie movie1;
import processing.opengl.*;

PImage bg;
int cols, rows;
int scl = 4;
int w = 640 ;
int h = 800;
 
float flying = 10;
 
float[][] terrain;
int count = 0;
int n = 20;
float c = 0;
Boolean reverse = false;
  
void setup() {
  size(640, 800, P3D);
  colorMode(HSB, 100, 110, 300);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
  bg = loadImage("1111version2.jpg");
  texture(bg);
}


void draw() {
  flying -= 0.1;
 
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -170,0);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  background(0);
  //stroke(255);
  //noFill();
  translate(width/2, height/2);
  rotateY(c);
  scale(0.001*n);
  translate(-w/2, (-h+400));
  color k = color(random(10,200),random(0,150),random(100,200));
  for (int y = 0; y < rows-1; y++) {
    texture(bg);
    beginShape(POINTS);
    for (int x = 0; x < cols; x++) {
        stroke(bg.pixels[x*scl + y*scl*width]);
        fill(bg.pixels[x*scl + y*scl*width]);
        strokeWeight(1*(n/100));
        vertex(x*scl, y*scl, terrain[x][y], map(x,0,cols,0,bg.width), map(y,0,rows,0,bg.height) );
        vertex(x*scl, (y+1)*scl, terrain[x][y+1], map(x,0,cols,0,bg.width), map(y,0,rows,0,bg.height));
      }
      //rect(x*scl, y*scl, scl, scl);
    endShape();
    }
  count+=1000;
  c += PI/200;
  if(n >=1000){
    reverse = true;
  }
  if(n<=20){
    reverse = false;
  }
  if(reverse){
    n-=2;
  }
  else{
    n+=2;
  }
}
