float noiseX;
float noiseY;
float noiseT;
PFont mono;

void setup(){
  size(500,300);
  colorMode(HSB, 77, 110, 1);
  noiseX = random(20);
  noiseY = random(10);
  noiseT = random(50);
  textSize(70);
  mono = loadFont("Futura-Bold-48.vlw");
  textFont(mono);
}

void draw(){
  text("JustForFund", width/2-140, height/2);
  loadPixels();
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      float n = noise(noiseX + x * 0.01, noiseY + y * 0.01, noiseT + frameCount * 0.1);
      float level = int(n * 10);
      float hue = (level * 70) % 100;
      color c = color(hue, 200, 20);
      if (green(get(x,y))>=100){
        pixels[y * width + x] = c;
      }
    }
  }
  updatePixels();
}
