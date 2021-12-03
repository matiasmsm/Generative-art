import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;

int radius = 10;
int numLines = 300;
float nx = 0;
float ny = 0;
void setup(){
  size(600,600);
  background(0);
  stroke(255, 20);
  minim = new Minim(this);
  player = minim.loadFile("FourTet.mp3");
  meta = player.getMetaData();
  beat = new BeatDetect();
  player.loop();
}

void draw(){
  background(0);
  float angle = 0;
  pushMatrix();
  translate(width/2, height/2);
  beat.detect(player.mix);
  if (beat.isOnset());
  int bsize = player.bufferSize();
  for(int i = 0; i < numLines; i++){
    float x1, x2, y1, y2;
    float randLength = map(noise(nx+i*.1, ny), 0, 1, 10, radius * 10);
    strokeWeight(map(randLength, 0, radius*3, 1, 6));
    x1 = radius * cos(angle);
    y1 = radius * sin(angle);
    x2 = x1 + randLength * cos(angle+PI/2);
    y2 = y1 + randLength * sin(angle+PI/2);
    line(x1, y1, x2, y2);
    angle+=TWO_PI/numLines;
  }
  popMatrix();
  nx+=.05;
  ny+=.01;
}
