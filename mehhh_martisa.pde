PShape s;

float angle = 0;
float targetAngle = 0;
float easing = 0.05f;

void setup() {
  size(1000, 1000, P3D);
  s = loadShape("instalacion.obj");
}

void draw() {
  angle = atan2( mouseY - 300, mouseX - -200 );
  float dir = (angle - targetAngle) / TWO_PI;
  dir -= round( dir );
  dir *= TWO_PI;
  targetAngle += dir * easing;
  background(204);
  scale(0.9);
  rotateX(targetAngle);
  rotateY(targetAngle);
  translate(-200, 300);
  shape(s,0,0);
}
