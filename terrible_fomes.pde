import processing.video.*;

Movie movie1;
import processing.opengl.*;

PImage bg;
int cols, rows;
int scl = 2;
int w = 742 ;
int h = 884;
 
float flying = 10;
 
float[][] terrain;
int count = 0;
int n = 1;
int ola = 1;
float c = 0;
float stroke = 0.1;
Boolean reverse = false;
Boolean reverse1 = false;
Boolean reverse2 = false;
  
void setup() {
  size(742, 884, P3D);
  colorMode(HSB, 77, 110, 20);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
  bg = loadImage("toma.jpg");
  texture(bg);
}


void draw() {
  flying -= 0.1;
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, 1,1);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  color k = color(random(0,200),random(0,150),random(0,90));
  background(0);
  //stroke(255);
  //noFill();
  translate(width/2, height/2);
  scale(0.8);
  rotateY(c);
  rotateX(c);
  rotateZ(c);
  translate(-w/2, -h/2);
  beginShape(POINTS);
  for (int y = 0; y < rows-1; y++) {
    texture(bg);
    for (int x = 0; x < cols; x++) {
        if(brightness(bg.pixels[y*scl*width + x*scl])>5){
          strokeWeight(2);
          fill(bg.pixels[y*scl*width + x*scl]);
          stroke(k);
          if(count >= 300){
            vertex(x*scl*random(-50,50), y*scl*random(-50,50), terrain[x][y]*random(-200,200), map(x,0,cols,0,bg.width), map(y,0,rows,0,bg.height) );
            vertex(x*scl*random(-50,50), (y+1)*scl*random(-50,50), terrain[x][y+1]*random(-200,200), map(x,0,cols,0,bg.width), map(y,0,rows,0,bg.height));
          }
          else{
            vertex(x*scl, y*scl, terrain[x][y], map(x,0,cols,0,bg.width), map(y,0,rows,0,bg.height) );
            vertex(x*scl, (y+1)*scl, terrain[x][y+1], map(x,0,cols,0,bg.width), map(y,0,rows,0,bg.height));
          }
        }
      }
      //rect(x*scl, y*scl, scl, scl);
  }
  endShape();
  count+=1;
  c += PI/100;
  if(n >=900){
    reverse = true;
  }
  if(n<=10){
    reverse = false;
  }
  if(reverse){
    n-=10;
  }
  else{
    n+=10;
  }
  if(ola >=100){
    reverse1 = true;
  }
  if(ola<=-100){
    reverse1 = false;
  }
  if(reverse1){
    ola-=5;
  }
  else{
    ola+=5;
  }
  if(stroke >=8){
    reverse2 = true;
  }
  if(stroke<=0.1){
    reverse2 = false;
  }
  if(reverse2){
    stroke-=0.1;
  }
  else{
    stroke+=0.1;
  }
  saveFrame();
}
