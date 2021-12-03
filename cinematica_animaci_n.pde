PImage img;
float x,y,z;

void setup() {
  size(1400, 800);
  noFill();
  stroke(225);
  strokeWeight(3);
  img = loadImage("logo.png");
}

void draw() {
  background(0);
  translate(width/2, height/2);
  beginShape();
  for (float x = -10; x <= 10; x += 1){
    strokeWeight(1.7);
    float y = 0;
    vertex(x-190, y);
  }
  endShape();
  
  beginShape();
  for (float x = -50; x <= 50; x += 1){
    strokeWeight(1.7);
    float y = 0;
    vertex(x+310, y);
  }
  endShape();

  beginShape();
  for (float t = 0; t <= 2*PI; t += PI/180){
    float n = random(-1.5,1.5);
    float x = cos(t)*60;
    float y = sin(t)*160;
    vertex(x-80+n, y);
  }

  endShape();
  beginShape();
  for (float t = 0; t <= 2*PI; t += PI/180){
    float n = random(-1.5,1.5);
    float x = cos(t)*60;
    float y = sin(t)*160;
    vertex(x+n -10, y);
  }

  endShape();
  beginShape();
  for (float t = 0; t <= 2*PI; t += PI/180){
    float n = random(-1.5,1.5);
    float x = cos(t)*60;
    float y = sin(t)*160;
    vertex(x+60+n, y);
  }

  endShape();
  beginShape();
  for (float t = 0; t <= 2*PI; t += PI/180){
    float n = random(-1.5,1.5);
    float x = cos(t)*60;
    float y = sin(t)*160;
    vertex(x+130+n, y);
  }

  endShape();
  beginShape();
  for (float t = 0; t <= 2*PI; t += PI/180){
    float n = random(-1.5,1.5);
    float x = cos(t)*60;
    float y = sin(t)*160;
    vertex(x+200+n, y);
  }

  endShape();
  image(img, -180, -40, 379*1.12, 88*1.12);

}
