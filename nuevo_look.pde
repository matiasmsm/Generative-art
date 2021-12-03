PImage [] imageArray = new PImage[1]; 
PImage bg;
Boolean revers = false;

int cols, rows;
int scl = 50;
int w = 1600 ;
int h = 2134;
 
float flying = 10;
 
float[][] terrain;
int count = 0;
float n = 0.1;
float c = 0;
Boolean reverse = false;
Boolean reverse1 = false;
Boolean reverse2 = false;

float q = 0;
int pic = 0;
float stroke = 0.1;
void setup() {
  size(1600, 2134, P3D); 
  for (int m=0; m < imageArray.length; m++) {
    imageArray [0] = loadImage("1.JPG");
  }
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
}

void draw() {
  color k = color(random(100,200),random(10,150),random(100,200));
  flying -= 0.1;
 
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -1,1);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  bg = imageArray[0];
  translate(width/2, height/2);
  background(0);
  rotateY(c);
  rotateZ(c);
  scale(n);
  translate(-w/2, (-(h/2)));
  strokeWeight(stroke);
  beginShape(LINES);
  for (int y = 0; y < rows; y++) {
    texture(bg);
    for (int x = 0; x < cols; x++) {
        if(brightness(bg.pixels[y*scl*width + x*scl])>10){
          stroke(bg.pixels[y*scl*width + x*scl]);
          vertex(x*scl, y*scl, terrain[x][y]*(random(-600,600)), map(x,0,cols,0,bg.width), map(y,0,rows,0,bg.height) );
        }
      }
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  count+=1;
  c += radians(0.2);
  if(n >=0.9){
    reverse = true;
  }
  if(n<=0.1){
    reverse = false;
  }
  if(reverse){
    n-=0.007;
  }
  else{
    n+=0.007;
  }
  if(stroke >=10){
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
}
