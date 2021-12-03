import processing.opengl.*;

boolean reverse = false;
int count = 1;
float i;
float noiseX;
float noiseY;
float noiseT;

void setup() {
  size(1000, 800, OPENGL);
}

void draw() {
  color k = color(random(0,100),random(0,150),random(1,10));
  color v = color(random(0,200),random(0,150),random(1,10));
  color c = color(random(0,200),random(0,150),random(1,10));
  background(color(0));
  stroke(color(random(20,190),random(80,150),random(50,200)));
  fill(color(0));
  translate(width/2, height/2, 0);
  rotateY(i*0.8);
  sphere(200);
  sphereDetail(3, 20);
  translate(width/2, height/2, random(300));
  i+=.03;
  if (count >=40){
    reverse = true;
  }
  if (count <4){
    reverse = false;
  }
  if(reverse){
    count -= 1;
  }
  else{
    count += 1;
  }
  rotateY(i);
  rotateX(i*0.2);
  rotateZ(i*4);
}
