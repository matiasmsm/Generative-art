PImage [] imageArray = new PImage[10]; 
int n = 2;
Boolean revers = false;
void setup() {
  size(750, 1334); 
  for (int m=0; m < imageArray.length; m++) {
    imageArray [0] = loadImage("IMG_5643.PNG");
    imageArray [1] = loadImage("IMG_5644.PNG");
    imageArray [2] = loadImage("IMG_5645.PNG");
    imageArray [3] = loadImage("IMG_5659.PNG");
    imageArray [4] = loadImage("IMG_5660.PNG");
    imageArray [5] = loadImage("IMG_5670.PNG");
    imageArray [6] = loadImage("IMG_5671.PNG");
    imageArray [7] = loadImage("IMG_5672.PNG");
    imageArray [8] = loadImage("IMG_5676.PNG");
    imageArray [9] = loadImage("IMG_5677.PNG");
  }
}

void draw() {
  int random_pic = int(random(0,9));
  image(imageArray[random_pic], 0, 0);
  loadPixels();
  color k = color(random(0,200),random(0,150),random(0,90));
  for(int y = 0; y < height; y++){
    for(int h = 0; h < width; h++){
      if (brightness(get(h,y))>0+n){
        pixels[y*width + h] = color(k);
      }
      else{
        pixels[y*width + h] = color(random(0,10),random(0,10),random(0,10));
      }
    }
  }
  updatePixels();
  delay(87);
  if(n >=300){
    revers = true;
  }
  if(n<=0){
    revers = false;
  }
  if(revers){
    n-=10;
  }
  else{
    n+=10;
  }
}
