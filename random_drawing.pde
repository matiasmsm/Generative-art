int[] coords = {
  40, 40, 80, 60, 100, 100, 60, 120, 50, 150
};

int vert_x = width/2;
int vert_y = height/2;
int ver_x = 1;
int ver_y = 1;

float noiseX;
float noiseY;
float noiseT;
color c_init = color(100, 200, 50);

void setup() {
  size(1200, 800, P3D);
  smooth();
  colorMode(HSB, 77, 110, 1);
  noiseX = random(20);
  noiseY = random(10);
  noiseT = random(50);
};

void draw() {
  float n = noise(noiseX + vert_x * 0.01, noiseY + vert_y * 0.05, noiseT + frameCount * 0.1);
  float level = int(n * 15);
  float hue = (level * 30) % 100;
  color c = color(hue, 200, 50);
  color k = color(int(random(200)), int(random(200)), int(random(10)));
  fill(k);
  stroke(c);
  beginShape();
  vertex(vert_x, vert_y, 10);
  for(int x = 0; x < 4; x++){
    ver_x = int(random(0,width));
    ver_y = int(random(0,height));
    vertex(ver_x, ver_y, 10);
  };
  vert_x = ver_x;
  vert_y = ver_y;
  endShape();
}
