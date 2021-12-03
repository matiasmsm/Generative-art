int change_clr;
PImage bg;

void setup(){
  size(750,1334);
  bg = loadImage("fetus1.PNG");
  frameRate(10);
  change_clr = 0;
}

void draw(){
  background(bg);
  loadPixels();
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      if (brightness(get(x,y))>=145){
        pixels[y * width + x] = color(change_clr);
      }
    }
  }
  updatePixels();
  change_clr += 1;
  saveFrame();
}
