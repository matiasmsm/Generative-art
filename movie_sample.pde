import processing.video.*;

Movie movie;
float noiseX;
float noiseY;
float noiseT;
float posX, posY;
float radiusX, radiusY;
float theta;

void setup() {
  size(750, 1334); 
  movie = new Movie(this, "yeah.mov");
  movie.loop();
  colorMode(HSB, 77, 110, 1);
  noiseX = random(20);
  noiseY = random(10);
  noiseT = random(50);
}

void draw() { 
  image(movie, 0, 0);
  saveFrame();
}

void movieEvent(Movie movie) {  
  movie.read();
}
