import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;

void setup(){
  size(500,500);
  minim = new Minim(this);
  player = minim.loadFile("FourTet.mp3");
  meta = player.getMetaData();
  beat = new BeatDetect();
  player.loop();
}
void draw(){
  background(0);
  noStroke();
  fill(#310807);
  beat.detect(player.mix);
  if (beat.isOnset());
  int bsize = player.bufferSize();
  for(int m=0; m<100000 ;m++){
    int a = floor(random(1,width));
    int b = floor(random(1,height));
    if(red(get(a,b))!=0){// if pixel is black
      int c = floor(random(0,4));// one of 4 directions
      int d = 0;// an x offset for direction
      int e = 0;// an y offset for direction
      switch(c){// assign x and y offsets
        case 0:
        d=1;
        e=0;
        break;
        case 1:
        d=0;
        e=1;
        break;
        case 2:
        d=-1;
        e=0;
        break;
        case 3:
        d=0;
        e=-1;
        break;
      }
      if((a+d>0)&&(b+e>0)&&
         (a+d<width-1)&&(b+e<height-1)&&
         // i was worried about the domain of get() or set()
         // it will not throw an "index out of bounds" anyway
        red(get(a+d,b+e))==0){// if the target is black
        print("SI");
        int ram = 10;// makes the color change
        color clr = get(a,b);//
        int re = int(constrain(red(clr)+random(-ram,ram),1,255));
        int gr = int(constrain(green(clr)+random(-ram,ram),1,255));
        int bu = int(constrain(blue(clr)+random(-ram,ram),1,255));
        print(color(re, gr, bu));
        set(a+d,b+e,color(re,gr,bu));
      }
    }
  }
}
