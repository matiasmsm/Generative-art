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


boolean a = false;
color[] colors = new color[2];

void setup(){
  size(533, 709);
  bg = loadImage("peace.JPG");
  colorMode(HSB, 77, 110, 20);
  noiseX = random(20);
  noiseY = random(10);
  noiseT = random(50);
  colors[0] = color(0, 0, 0);
  colors[1] = color(255, 0, 100);
  background(bg);
}


void draw(){
  background(bg);
  loadPixels();
  for(int y = 0; y < height/8 +75; y++){
    for(int h = 0; h < width/2 +65; h++){
      if (red(get(h,y))>54){
        float ns = noise(noiseX, noiseY , noiseT + frameCount * 0.07);
        float levl = int(ns * 70);
        float hu = (levl * 20) % 100;
        color d = color(7, random(30), random(150));
        pixels[y * width + h] = d;
      }
    }
  }
  updatePixels();
  loadPixels();
  for(int y = height/8 +75; y < height; y++){
    for(int h = 0; h < width/2 +65; h++){
      if (red(get(h,y))>62){
        float ns = noise(noiseX, noiseY , noiseT + frameCount * 0.07);
        float levl = int(ns * 70);
        float hu = (levl * 20) % 100;
        color d = color(random(100), random(100), random(24));
        pixels[y * width + h] = d;
      }
    }
  }
  updatePixels();
  loadPixels();
  for(int y = 200; y < height/2+100; y++){
    for(int h = width/2 +65; h < width; h++){
      if (green(get(h,y))<16){
        float ns = noise(noiseX, noiseY , noiseT + frameCount * 0.07);
        float levl = int(ns * 70);
        float hu = (levl * 20) % 100;
        color d = color(hu, random(100), random(100));
        pixels[y * width + h] = d;
      }
    }
  }
  updatePixels();
}
