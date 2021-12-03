// Pixel-sized particles version, of 'surfs_up'.
// Particles are now directly noise driven omitting the flow field.
// Array[], particle, pixel, noise()
// Mouse click to reset, mouseX adjusts background clear.
int cols, rows;
int scl = 1;
int w = 1450 ;
int h = 890;
 
float flying = 1;
 
float[][] terrain;
int count = 0;
int n = 0;
int ola = 0;
float c = 0;
Boolean reverse = false;
Boolean reverse1 = false;
Boolean reverse2 = false;
float scale = 0.1;
color[] colarray = new color[5];
Particle[] particles;
float alpha;

void setup() {
  fullScreen(P3D);
  colorMode(HSB, 360, 100, 100);
  cols = width / scl;
  rows = height/ scl;
  terrain = new float[cols][rows];
  colarray[0] = color(352,100,12);
  colarray[1] = color(357,94,37);
  colarray[2] = color(359,97,60);
  colarray[3] = color(347,57,47);
  colarray[4] = color(336,83,69);
  noStroke();
  setParticles();
}

void draw() {
  int m = second();
  if (m >20){
    background(color(0,0,100));
    setParticles();
    m = 0;
  }
  background(color(0,0,100));
  translate(width/2, height/2);
  translate(-w/2, -h/2);
  beginShape(POINTS);
  for (Particle p : particles) {
    p.move();
  }
  endShape();
  c += PI/100;
}

void setParticles() {
  particles = new Particle[10000];
  int c = colarray[int(random(0,5))];
  for (int i = 0; i < 10000; i++) { 
    float x = random(width);
    float y = random(height);
    particles[i]= new Particle(x, y, c);
  }
}

class Particle {
  float posX, posY, incr, theta;
  color  c;

  Particle(float xIn, float yIn, color cIn) {
    posX = xIn;
    posY = yIn;
    c = cIn;
  }

  public void move() {
    update();
    display();
  }

  void update() {
    incr += 0.003;
    theta = noise(posX * .009, posY * 0.008, incr) * TWO_PI;
    posY += 2* sin(theta);
  }

  void display() {
    if (posX > 0 && posX < w && posY > 0  && posY < h) {
      stroke(c);
      strokeWeight(5);
      vertex(posX, posY, 1, map(posX,0,200,0,w), map(posY,0,200,0,h) );
    }
  }

  void wrap() {
    if (posX < 0) posX = w;
    if (posX > w ) posX =  0;
    if (posY < 0 ) posY = h;
    if (posY > h) posY =  0;
  }
}
