// Pixel-sized particles version, of 'surfs_up'.
// Particles are now directly noise driven omitting the flow field.
// Array[], particle, pixel, noise()
// Mouse click to reset, mouseX adjusts background clear.
// 2:23 sec
// 3 

Particle[] particles;
float alpha;
color[] colarray = new color[5];
int time;
int wait = 11000;

void setup() {
  fullScreen(P3D);
  colorMode(HSB, 360, 100, 100);
  colarray[0] = color(263,26,35);
  colarray[1] = color(39,39,95);
  colarray[2] = color(5,59,85);
  colarray[3] = color(0,98,55);
  colarray[4] = color(0,0,95);
  background(color(8,3,97));
  noStroke();
  setParticles();
  time = millis();//store the current time
}

void draw() {
  if (millis() - time >= wait){
    setParticles();
    time = millis();
  }
  frameRate(30);
  alpha =map(height, 0, width, 5, 35);
  fill(0, alpha);
  rect(0, 0, width, height);
  loadPixels();
  for (Particle p : particles) {
    p.move();
  }
  updatePixels();
  saveFrame();
}

void setParticles() {
  particles = new Particle[5000];
  for (int i = 0; i < 5000; i++) { 
    int c = color(0,0,100);
    float x = random(width);
    float y = random(height);
    float adj = map(y, 0, height, 255, 0);
   // int c = color(40, adj, 255);
    particles[i]= new Particle(x, y, c);
  }
}

void mousePressed() {
  setParticles();
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
    wrap();
    display();
  }

  void update() {
    incr +=  .003;
    theta = noise(posX * .009, posY * .004, incr) * TWO_PI;
    posX += 2 * cos(theta);
    posY += 4 * sin(theta);
  }

  void display() {
    if (posX > 1 && posX < width-1 && posY > 1  && posY < height-1) {
      pixels[(int)posX + (int)posY * width] =  c;
    }
  }

  void wrap() {
    if (posX < 0) posX = width;
    if (posX > width ) posX =  0;
    if (posY < 0 ) posY = height;
    if (posY > height) posY =  0;
  }
}
