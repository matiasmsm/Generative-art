void setup(){
  size(1024,768);
  background(50);
  noFill();

}

void draw(){
  translate(512,384);
  for(int i=0; i<10; i++) {
    pushMatrix();
    rotate(i*PI/18);
    rectMode(CENTER);
    stroke(random(255),random(255),random(i*4),85);
    rect(0,0,random(200,400),random(200,400));
    stroke(random(255),random(i*4),random(255),90);
    rect(0,0,random(300,500),random(300,500));
    stroke(random(i*4),random(255),random(255),90);
    rect(0,0,random(400,600),random(400,600));
    popMatrix();
   }
}
