import processing.sound.*;
Sound s;
SoundFile file;


float noiseX;
float noiseY;
float noiseT;
PImage bg;
  
IntList x_verts;
IntList y_verts;
IntList x_extrem;
IntList y_extrem;

int y_dif = 0;

boolean reduce = false;
color[] colors = new color[2];

void setup(){
  size(2000, 1300);
}


void draw(){
  loadPixels();
  for(int y = 0; y < height; y+=5){
    for(int h = 0; h < width; h++){
      pixels[y * width + h] = color(random(200), random(200),random(100));
      }
    }
  updatePixels();
 }
