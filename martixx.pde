import processing.video.*;

Movie movie1;
import processing.opengl.*;

PImage bg;
int cols, rows;
int scl = 2;
int w = 1023 ;
int h = 1280;
 
float flying = 10;
 
float[][] terrain;
int count = 0;
float n = 0.1;
float c = 0;
Boolean reverse = false;
  
void setup() {
  size(1023, 1280, P3D);
  colorMode(HSB, 100, 110, 300);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
  bg = loadImage("la_catita.JPG");
  texture(bg);
}


void draw() {
  flying -= 0.1;
 
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -20,0);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  color k = color(random(70,200),random(0,150),random(100,200));
  background(k);
  //stroke(255);
  //noFill();
  translate(width/2, height/2);
  rotateY(c*10);
  scale(n);
  translate(-w/2, (-h/2));
  for (int y = 0; y < rows; y++) {
    texture(bg);
    beginShape(POINTS);
    for (int x = 0; x < cols; x++) {
      if(blue(bg.pixels[x*scl + y*scl*width])>80 && brightness(bg.pixels[x*scl + y*scl*width])<280){
          stroke(bg.pixels[x*scl + y*scl*width]);
          strokeWeight(0.8+n);
          vertex(x*scl, y*scl, terrain[x][y], map(x,0,cols,0,bg.width), map(y,0,rows,0,bg.height) );
          vertex(x*scl, (y+1)*scl, terrain[x][y+1], map(x,0,cols,0,bg.width), map(y,0,rows,0,bg.height));
        }
      }
      //rect(x*scl, y*scl, scl, scl);
    endShape();
    }
  count+=1000;
  c += PI/144;
  if(n>=20){
    reverse = true;
  }
  if(n<=0.1){
    reverse = false;
  }
  if(reverse){
    n-=0.1;
  }
  else{
    n+=0.1;
  }
}
