// Pixel-sized particles version, of 'surfs_up'.
// Particles are now directly noise driven omitting the flow field.
// Array[], particle, pixel, noise()
// Mouse click to reset, mouseX adjusts background clear.

Particle[] particles;
float alpha;
color[] colarray = new color[5];
int m = 1;

void setup() {
  size(2000, 1000);
  background(0);
  colarray[0] = color(263,26,35);
  colarray[1] = color(39,39,95);
  colarray[2] = color(5,59,85);
  colarray[3] = color(0,98,55);
  colarray[4] = color(0,0,95);
  noStroke();
  setParticles();
}

void draw() {
  alpha = map(0, 0, width, 5, 35);
  fill(0, alpha);
  rect(0, 0, width, height);

  loadPixels();
  for (Particle p : particles) {
    p.move();
  }
  updatePixels();
}

void setParticles() {
  particles = new Particle[40000];
  for (int i = 0; i < 40000; i++) { 
    float x = random(width);
    float y = random(height);
    float adj = map(y, 0, height, 255, 0);
   // int c = color(40, adj, 255);
    int c = colarray[int(random(0,5))];
    particles[i]= new Particle(x, y, c);
  }
  endShape();
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
    incr +=  .03;
    theta = noise(posX * .009, posY * .0004, incr) * TWO_PI;
    posY += 2 * sin(theta);
    m+=1;
  }

  void display() {
    if (posX > 1 && posX < width-1 && posY > 1  && posY < height-1) {
      pixels[(int)posX + (int)posY * width] =  c;
      pixels[(int)posX-1 + ((int)posY-1) * width] =  c;
      pixels[(int)posX-1 + ((int)posY+1) * width] =  c;
      pixels[(int)posX +1 + ((int)posY-1) * width] =  c;
      pixels[(int)posX +1 + ((int)posY+1) * width] =  c;
      pixels[(int)posX -1 + ((int)posY) * width] =  c;
      pixels[(int)posX + ((int)posY+1) * width] =  c;
      pixels[(int)posX + ((int)posY-1) * width] =  c;
      pixels[(int)posX +1 + ((int)posY+1) * width] =  c;
    }
  }

  void wrap() {
    if (posX < 0) posX = width;
    if (posX > width ) posX =  0;
    if (posY < 0 ) posY = height;
    if (posY > height) posY =  0;
  }
}
