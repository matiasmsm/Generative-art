import java.io.File;
import java.util.Collections;
import java.util.Arrays; 

int cols, rows;
int scl = 20;
int w = 1000;
int h = 900;

float[][] terrain;
float flying = 0;

float rot = 0;

IntList x_verts;
IntList y_verts;
IntList next_x_verts;
IntList next_y_verts;

color[] colarray = new color[5];
Particle[] particles;

int i = 0;

int d = 0;

float theta;
ArrayList<PImage> imageArray = new ArrayList();
String filenames[];

String fileext = ".png";

void setup() {  
  // we'll have a look in the data folder
  java.io.File folder = new java.io.File(dataPath("monke"));
  java.io.FilenameFilter extfilter = new java.io.FilenameFilter() {
    boolean accept(File dir, String name) {
      return name.toLowerCase().endsWith(fileext);
    }
  };
  // list the files in the data folder
  String[] filenames = folder.list(extfilter);
  Arrays.sort(filenames);
  for (int i = 0; i < filenames.length; i++) {
    imageArray.add(loadImage("data/monke/"+filenames[i]));
  }
  size(1200, 800, P3D);
  colorMode(HSB, 360, 100, 100);
  colarray[0] = color(356, 79, 56);
  colarray[1] = color(0);
  // colarray[2] = color(110.55,92.16,100);
  // colarray[3] = color(30.64,73.73,100);
  // colarray[4] = color(357.41,75.54,72.16);
  background(0);
  i = 0;
  x_verts = new IntList();
  y_verts = new IntList();
  for (int y = 0; y < imageArray.get(i).height; y++) {
    for (int x = 0; x < imageArray.get(i).width; x++) {
      if(brightness(imageArray.get(i).get(x,y)) <35){
        if(brightness(imageArray.get(i).get(x+1,y)) >35){
          x_verts.append(x+1);
          y_verts.append(y);
        }
        if(brightness(imageArray.get(i).get(x-1,y)) >35){
          x_verts.append(x-1);
          y_verts.append(y);
        }
        if(brightness(imageArray.get(i).get(x,y+1)) >35){
          x_verts.append(x);
          y_verts.append(y+1);
        }
        if(brightness(imageArray.get(i).get(x,y-1)) >35){
          x_verts.append(x);
          y_verts.append(y-1);
        }
      }
    }
  }
  if(i==imageArray.size()-1){
    i = 0;
  }
  else{
    i +=1;
  }  
  next_x_verts = new IntList();
  next_y_verts = new IntList();
  for (int y = 0; y < imageArray.get(i).height; y++) {
    for (int x = 0; x < imageArray.get(i).width; x++) {
      if(brightness(imageArray.get(i).get(x,y)) <35){
        if(brightness(imageArray.get(i).get(x+1,y)) >35){
          next_x_verts.append(x+1);
          next_y_verts.append(y);
        }
        if(brightness(imageArray.get(i).get(x-1,y)) >35){
          next_x_verts.append(x-1);
          next_y_verts.append(y);
        }
        if(brightness(imageArray.get(i).get(x,y+1)) >35){
          next_x_verts.append(x);
          next_y_verts.append(y+1);
        }
        if(brightness(imageArray.get(i).get(x,y-1)) >35){
          next_x_verts.append(x);
          next_y_verts.append(y-1);
        }
      }
    }
  }
  int particle_count = x_verts.size();
  int next_particle_count = next_x_verts.size();
  if(particle_count < next_particle_count){
      int dif_num_particles = next_particle_count - particle_count;
      for(int f = 0; f < dif_num_particles; f++){
        int rand_indx = int(random(0, x_verts.size()));
        int rand_x = x_verts.get(rand_indx);
        int rand_y = y_verts.get(rand_indx);
        x_verts.append(rand_x);
        y_verts.append(rand_y);
      }
    }
  if(particle_count > next_particle_count){
      int dif_num_particles = particle_count - next_particle_count;
      for(int f = 0; f < dif_num_particles; f++){
        int rand_indx = int(random(0, next_x_verts.size()));
        int rand_x = next_x_verts.get(rand_indx);
        int rand_y = next_y_verts.get(rand_indx);
        next_x_verts.append(rand_x);
        next_y_verts.append(rand_y);
      }
    }
  setParticles();
  frameRate(30);
}


void draw() {
  background(0);
  translate(width/2, height/2);
  scale(0.8);
  rot += PI*1.17;
  beginShape(POINTS);
    int count_index_particles = 0;
    boolean true_shape = true;
    for (Particle p : particles) {
      if ( p.posX != next_x_verts.get(count_index_particles)) d ++ ;
      else d = 0 ;
      int next_posX = next_x_verts.get(count_index_particles);
      int next_posY = next_y_verts.get(count_index_particles);
      float dif_x = abs(next_posX - p.posX);
      float dif_y = abs(next_posY - p.posY);
      if(int(dif_x) > 0 || int(dif_y) > 0){
        true_shape = false;
      }
      p.move(next_posX, next_posY);  
      count_index_particles += 1;
    }
    if(true_shape){
      newVerts();
    }
  endShape();
  if(i==imageArray.size()-1){
    i = 0;
  }
  else{
    i +=1;
  }  
}

void newVerts() {
  x_verts = new IntList();
  y_verts = new IntList();
  for (int y = 0; y < imageArray.get(i).height; y++) {
    for (int x = 0; x < imageArray.get(i).width; x++) {
      if(brightness(imageArray.get(i).get(x,y)) <35){
        if(brightness(imageArray.get(i).get(x+1,y)) >35){
          x_verts.append(x+1);
          y_verts.append(y);
        }
        if(brightness(imageArray.get(i).get(x-1,y)) >35){
          x_verts.append(x-1);
          y_verts.append(y);
        }
        if(brightness(imageArray.get(i).get(x,y+1)) >35){
          x_verts.append(x);
          y_verts.append(y+1);
        }
        if(brightness(imageArray.get(i).get(x,y-1)) >35){
          x_verts.append(x);
          y_verts.append(y-1);
        }
      }
    }
  }
  if(i==imageArray.size()-1){
    i = 0;
  }
  else{
    i +=1;
  }
  int bright = 30;
  next_x_verts = new IntList();
  next_y_verts = new IntList();
  for (int y = 0; y < imageArray.get(i).height; y++) {
    for (int x = 0; x < imageArray.get(i).width; x++) {
      if(brightness(imageArray.get(i).get(x,y)) <bright){
        if(brightness(imageArray.get(i).get(x+1,y)) >bright){
          next_x_verts.append(x+1);
          next_y_verts.append(y);
        }
        if(brightness(imageArray.get(i).get(x-1,y)) >bright){
          next_x_verts.append(x-1);
          next_y_verts.append(y);
        }
        if(brightness(imageArray.get(i).get(x,y+1)) >bright){
          next_x_verts.append(x);
          next_y_verts.append(y+1);
        }
        if(brightness(imageArray.get(i).get(x,y-1)) >bright){
          next_x_verts.append(x);
          next_y_verts.append(y-1);
        }
      }
    }
  }
  int particle_count = x_verts.size();
  int next_particle_count = next_x_verts.size();
  if(particle_count < next_particle_count){
      int dif_num_particles = next_particle_count - particle_count;
      for(int f = 0; f < dif_num_particles; f++){
        int rand_indx = int(random(0, x_verts.size()));
        int rand_x = x_verts.get(rand_indx);
        int rand_y = y_verts.get(rand_indx);
        x_verts.append(rand_x);
        y_verts.append(rand_y);
      }
    }
  if(particle_count > next_particle_count){
      int dif_num_particles = particle_count - next_particle_count;
      for(int f = 0; f < dif_num_particles; f++){
        int rand_indx = int(random(0, next_x_verts.size()));
        int rand_x = next_x_verts.get(rand_indx);
        int rand_y = next_y_verts.get(rand_indx);
        next_x_verts.append(rand_x);
        next_y_verts.append(rand_y);
      }
    }
  setParticles();
  //saveFrame();
}

void setParticles() {
  particles = new Particle[x_verts.size()];
  for (int a = 0; a <x_verts.size(); a++) { 
    float k = x_verts.get(a);
    float n = y_verts.get(a);
    float z = 1;
    color c = colarray[int(random(0,4))];
    particles[a]= new Particle(k, n, z, c);
  }
}

class Particle {
  float posX, posY, posZ ,incr, theta;
  color  c;

  Particle(float xIn, float yIn, float zIn, color cIn) {
    posX = xIn;
    posY = yIn;
    posZ = zIn;
    c = cIn;
  }

  public void move(float targetX, float targetY) {
    update(targetX, targetY);
    wrap();
    display();
  }

  void update(float targetX, float targetY) {
    float coef = map(d,0,100,0,0.7);
    posX = lerp (posX, targetX, 0.05);
    posY = lerp (posY, targetY, 0.05);
  }

  void display() {
    if (posX > 0 && posX < w && posY > 0  && posY < h) {
      strokeWeight(-2);
      stroke(color(0,0,255));
      fill(color(0,0,255));
      vertex(posX, posY, 3);
    }
  }

  void wrap() {
    if (posX < 0) posX = w;
    if (posX > w ) posX =  0;
    if (posY < 0 ) posY = h;
    if (posY > h) posY =  0;
  }
}
