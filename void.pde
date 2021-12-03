import processing.video.*;

Movie movie;
float noiseX;
float noiseY;
float noiseT;
float posX, posY;
float radiusX, radiusY;
float theta;
IntList list_heights;

void setup() {
  size(1920, 1080); 
  movie = new Movie(this, "TEASER.mp4");
  movie.loop();
}

void draw() { 
  image(movie, 0, 0);
  loadPixels();
  list_heights = new IntList();
  int sum_height = 0;
  while (sum_height <= height) {
    int n_height = int(random(10, 100));
    if (sum_height + n_height >= height) {
      list_heights.append(height);
      break;
    } else {
      list_heights.append(sum_height);
      sum_height += n_height ;
    }
  }
  for (int i=0; i<list_heights.size() -1; i++){
    int height_first = list_heights.get(i);
    int second_index = i + 1;
    int height_second = list_heights.get(second_index);
    print("\n First height:"+ height_first);
    print("\n Second height:"+ height_second);
    int n_width = int(random(1700, width));
    for(int y=height_first; y < height_second; y++){
      for(int x = 0; x < width; x++){
        color c = color(get(x,y));
        pixels[y*n_width + x] = c;
      }
    }
  }
  updatePixels();
}

void movieEvent(Movie movie) {  
  movie.read();
}
