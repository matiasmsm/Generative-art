// Pixel-sized particles version, of 'surfs_up'.
// Particles are now directly noise driven omitting the flow field.
// Array[], particle, pixel, noise()
// Mouse click to reset, mouseX adjusts background clear.
// 2:23 sec
// 3 

Particle[] particles;
float alpha;
color[] colarray = new color[5];

void setup() {
  size(2000, 1000);
  colorMode(HSB, 360, 100, 100);
  colarray[0] = color(263,26,35);
  colarray[1] = color(39,39,95);
  colarray[2] = color(5,59,85);
  colarray[3] = color(0,98,55);
  colarray[4] = color(0,0,95);
  noStroke();
  setParticles();
}

void draw() {
  frameRate(30);
  alpha = lerpColor(color(8,3,97), color(3,13,100),0.01);
  fill(0, alpha);
  rect(0, 0, width, height);

  loadPixels();
  for (Particle p : particles) {
    p.move();
  }
  updatePixels();
}

void setParticles() {
  particles = new Particle[1000];
  for (int i = 0; i < 1000; i++) { 
    int c = color(colarray[int(random(0,5))]);
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
    posY += 4 * sin(theta);
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
