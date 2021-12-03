var offset = 0;
var strum = 1;

function setup() { 
  createCanvas(400, 400);
} 

function draw() { 
  
  background(220);
  stroke(4);
  noFill();
  beginShape();
  vertex(0, height);
  for(var x = 0; x < width; x++){
    //var angle = map(x, 0, width, 0, TWO_PI);
    var angle = offset + x * 0.01;
    // map x between 0 and width to 0 and Two Pi
    var y = map(sin(angle), -strum, strum, 150, 250);
    vertex(x, y);
  }
  vertex(width, height);
  endShape();
  offset += 0.1;
  
}
