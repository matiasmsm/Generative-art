  
import processing.video.*;
Movie myMovie;

void setup() {
  size(600, 800);
  myMovie = new Movie(this, "walk_on_water2.mov");
  myMovie.speed(0.3);
  myMovie.loop();
}

void draw() {
  if (myMovie.available()) {
    myMovie.read();
  }
  image(myMovie, 0, 0);
}
