import processing.video.*;
  
import processing.sound.*;
Sound s;
Amplitude amp;
SoundFile file;
Pulse pulse;

Movie movie;
float noiseX;
float noiseY;
float noiseT;
float posX, posY;
float radiusX, radiusY;
float theta;
int spd;
int increase_speed = 1;
int pause_count = 0;
int increase_count = 60;
boolean a = false;
int random_pix = int(random(1,20));
int count_random_pic = 0;

PImage im1;
PImage im2;
PImage im3;
PImage im4;
PImage im5;
PImage [] imageArray = new PImage[5];

void setup() {
  size(720, 1280); 
  for (int m=0; m < imageArray.length; m++) {
    imageArray [0] = loadImage("5.tif");
    imageArray [1] = loadImage("4.tif");
    imageArray [2] = loadImage("3.tif");
    imageArray [3] = loadImage("6.tif");
    imageArray [4] = loadImage("7.tif");
  }
  movie = new Movie(this, "liberacion4.mov");
  movie.loop();
  frameRate(60);
  colorMode(HSB, 77, 110, 1);
  noiseX = random(20);
  noiseY = random(10);
  noiseT = random(50);
}

void draw() {
  int random_pic = int(random(0,5));
  image(movie, 0, 0);
  loadPixels();
  for(int y = 0; y < height; y++){
    for(int h = 0; h < width; h++){
      float ns = noise(4, noiseY , noiseT + frameCount * 0.07);
      float levl = int(ns * 10);
      float hu = (levl * 50) % 100;
      color d = color(0, 100, 10);
      if (green(get(h,y)) <74){
        pixels[y * width + h] = d;
      }
      else{
        pixels[y * width + h] = d;
      }
      if(y < 200){
        if (red(get(h,y))== 0){
          pixels[y * width + h] = d;
        }
      }
    };
  }
  updatePixels();
  image(imageArray[random_pic], int(random(50, width-200)), int(random(50, height-200)));
  imageArray[random_pic].format = ARGB;
  imageArray[random_pic].loadPixels();

  for(int i=0;i<imageArray[random_pic].pixels.length;i++){
    if (imageArray[random_pic].pixels[i] == color(0, 100, 10)){
      imageArray[random_pic].pixels[i] = color(0, 0);
    }
  }
  imageArray[random_pic].updatePixels();
  imageArray[random_pic].resize(290,320);
  saveFrame();
}

void movieEvent(Movie movie) {  
  movie.read();
  movie.speed(1.2);
}
