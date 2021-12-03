float noiseX;
float noiseY;
float noiseT;
PImage bg;

void setup(){
  size(600, 800);
  bg = loadImage("mati.JPG");
  frameRate(10);
  colorMode(HSB, 360, 100, 100);
  noiseX = random(100);
  noiseY = random(100);
  noiseT = random(100);
}

void draw(){
  background(bg);
  loadPixels();
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width/2 -35; x++){
      float n = noise(noiseX + x * 0.03, noiseY + y * 0.03, noiseT + frameCount * 0.4);
      float level = int(n * 60);
      float hue = (level * 90) % 384;
      color c = color(hue, 500, 500); 
      if (red(get(x,y))>4000){
        pixels[y * width + x] = c;
      }
    }
  }
  updatePixels();
  saveFrame();
}
