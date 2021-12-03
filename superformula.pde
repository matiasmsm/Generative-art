void setup() {
  size(500, 500);
  
  noFill();
  stroke(225);
  strokeWeight(2);
}

float t = 0;

void draw() {
  background(0);
  
  translate(width / 2, height / 2);
  
  beginShape();
  
  // add some vertices...
  for (float theta = 0; theta <= 2 * PI; theta += 0.001) {
    float rad = r(theta,
      2, // a
      2, // b
      6, // m
      1, // n1
      sin(t) * 0.5 +1, // n2
      cos(t) * 0.5 +1 // n3
    );
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x, y);
  }
  
  endShape();
  
  t += 0.1;
}


float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m * theta / 4.0) / a), n2) + pow(abs(sin(m * theta / 4.0) / b), n3), -1.0 / n1);
}
