import processing.video.*;

Movie movie1,movie2;
import processing.opengl.*;

boolean mo1 = true;
boolean mo2 = false;
int spd = 1;
int count = 0;
float i;
PImage tex;

void setup() {
  size(404, 720, P3D);
  movie1 = new Movie(this, "void.mov");
  movie1.loop();
  movie1.speed(1);
  
}

void draw() {
  image(movie1, 0, 0, width, height);
  loadPixels();
  color k = color(random(0,200),random(0,150),random(50,120));
  fill(255);
  translate(200, 500, 0);
  rotateY(i);
  box(120);
  for(int y = 0; y < height; y++){
    for(int h = 0; h < width; h++){
      if (blue(get(h,y))>10){
        pixels[y*width + h] = color(k);
      }
      else{
        pixels[y*width + h] = color(0);
      }
    }
  }
  updatePixels();
  i+=.05;
}

void keyPressed() {
  exit();
}

void movieEvent(Movie movie) {  
  movie.read();
}
