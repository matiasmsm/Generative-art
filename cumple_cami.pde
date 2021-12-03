PImage cami;

IntList x_verts;
IntList y_verts;

void setup() {
  size(960, 1280); 
  cami = loadImage("cami1.jpeg");
  x_verts = new IntList();
  y_verts = new IntList();
}

void draw() {
  background(cami);
  loadPixels();
  for(int y = 0; y < height; y++){
    for(int h = 0; h < width; h++){
      if(red(get(h,y))>220){
        pixels[y*width + h] = color(255,random(20,40),random(20,80));
      }
      if (blue(get(h,y))>200){
        pixels[y*width + h] = color(random(10,100),random(20,40),random(80,220));
      }
    }
  }
  updatePixels();
}
