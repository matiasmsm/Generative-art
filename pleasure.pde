// Pixel-sized particles version, of 'surfs_up'.
// Particles are now directly noise driven omitting the flow field.
// Array[], particle, pixel, noise()
// Mouse click to reset, mouseX adjusts background clear.
int cols, rows;
int scl = 1;
int w =  675;
int h = 900;

PImage bg;
 
float flying = 1;
 
float[][] terrain;
int count = 0;
int n = 0;
float rot = 0;
float c = 0;
Boolean reverse = false;
Boolean reverse1 = false;
Boolean reverse2 = false;
float scale = 0.1;
color[] colarray = new color[5];
Particle[] particles;
float alpha;

void setup() {
  size(675,900,P3D);
  colorMode(HSB, 360, 100, 100);
  cols = width / scl;
  rows = height/ scl;
  terrain = new float[cols][rows];
  colarray[0] = color(214,99,37);
  colarray[1] = color(197,56,59);
  colarray[2] = color(68,76,58);
  colarray[3] = color(41,94,100);
  colarray[4] = color(358,92,99);
  noStroke();
  bg = loadImage("god.png");
  texture(bg);
  background(bg);
  setParticles();
}

void draw() {
  background(bg);
  translate(width/2, height/2);
  rotateZ(rot);
  translate(-w/2, -h/2);
  beginShape(POINTS);
  for (Particle p : particles) {
    p.move();
  }
  endShape();
  if (c >= 100){
    reverse = true;
  }
  if (c<=0 ){
    reverse = false;
  }
  if (reverse){
    c-=1;
  }
  else{
    c += 1;
  }
  //87
  rot += PI*0.87;
}

void setParticles() {
  particles = new Particle[10000];
  for (int i = 0; i < 10000; i++) { 
    float x = random(width);
    float y = random(height);
    int c = colarray[int(random(0,5))];
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
    theta = noise(posX * .0009, posY * 0.009, incr) * TWO_PI;
    if (reverse){
      posY -= 10* sin(theta);
    }
    else{
      posY += 10* sin(theta);
    }
  }

  void display() {
    if (posX > 0 && posX < w && posY > 0  && posY < h) {
      stroke(c);
      strokeWeight(5);
      vertex(posX, posY, 50*sin(random(radians(0), radians(270))), map(posX,0,200,0,w), map(posY,0,200,0,h) );
    }
  }

  void wrap() {
    if (posX < 0) posX = w;
    if (posX > w ) posX =  0;
    if (posY < 0 ) posY = h;
    if (posY > h) posY =  0;
  }
}
