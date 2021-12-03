PImage bg;

void setup(){
  size(1700,1292);
  bg = loadImage("catarsis2.JPG");
  colorMode(HSB, 77, 110, 100);
  background(bg);
  loadPixels();
  for(int y = 0; y < height; y++){
    for(int h = 0; h < width; h++){
      if (red(get(h,y)) >60){
        pixels[y * width + h] = color(0);
      }
    }
  }
  updatePixels();
}

void draw(){

}
