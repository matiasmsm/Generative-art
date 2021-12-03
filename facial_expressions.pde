void setup(){
  size(400,400);
}
 
void draw(){
  background(0);
  translate(200,200);
  noStroke();
  fill(255,255,0);
  ellipse(0,0,250,380);
  fill(0);
  translate(0,20);
  arc(0,0,200,200,0,PI);
  ellipse(-80,-80,20,20);
  ellipse(80,-80,20,20);
}
