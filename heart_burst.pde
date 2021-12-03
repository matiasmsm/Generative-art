PImage bg;

void setup(){
  size(760,1018);
  bg = loadImage("congui5.JPG");
  reset();
}
void draw(){
  for(int m=0;m<100000;m++){
    // create onehundredthousand random points
    int a = floor(random(1,width));
    int b = floor(random(1,height));
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
     red(get(a+d,b+e))!=1){
      int ram = 10;// makes the color change
      color clr = get(a,b);//
      int re = int(constrain(red(clr)+random(-ram,ram),1,255));
      int gr = int(constrain(green(clr)+random(-ram,ram),1,255));
      int bu = int(constrain(blue(clr)+random(-ram,ram),1,255));
      set(a+d,b+e,color(re,gr,bu));
    }
  }
}
void keyPressed(){
  if(key==' '){
    reset();
//    save("evolution.bmp");
  }
}
void reset(){
  background(bg);
  noStroke();
  set(500,1000,color(255));
}
