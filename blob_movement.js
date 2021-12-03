function setup() {
  createCanvas(windowWidth, windowHeight);
}

function draw() {
  blendMode(BLEND);
  background(100);
  noStroke();
  blendMode(SUBTRACT);
  blendMode(ADD);

  noStroke();
  translate(300,height/2);
  fill(255);
  drawLiq(18,50,20,90);
  translate(width-800,height/2 -300);
  fill(50);
  drawLiq(15,60,25,330);
}


function drawLiq(vNnum,nm,sm,fcm){
  push();
  rotate(frameCount/fcm);
  let dr = TWO_PI/vNnum;
  beginShape();
  for(let i = 0; i  < vNnum + 3; i++){
    let ind = i%vNnum;
    let rad = dr *ind;
    let r = height*0.3 + noise(frameCount/nm + ind) * height*0.1 + sin(frameCount/sm + ind)*height*0.06;
    curveVertex(cos(rad)*r, sin(rad)*r);
  }
  endShape();
  pop();
}
