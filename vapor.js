/* Process4.reload() - Alessandro Valentino 2017
  Inspired by Process 4 by Casey Reas ( http://reas.com/compendium_text/ );
  The main modification is in the visualization:the distance
  between the centers controls the thickness of the line which is drawn, with color given by interpolating the
  colors of the two circles overlapping;
 */

var elements = [];
var tot = 80;
let lapse = 0;    // mouse timer
let hu;           // tint

function setup() {
  createCanvas(1112, 834);
  colorMode(HSB, 255);
  hu = random(255);
  init();

}

function draw() {
  
  //Do not clear the screen;
  for (var i = 0 ; i < elements.length; i++){
    var el = elements[i];

    el.move();
  //  el.show();
    el.bounce();

  }

  // Checking overlaps

  for (var i = 0; i < elements.length; i++){
    var el = elements[i];
      for (var j = i + 1; j < elements.length; j++){
        var el2 = elements[j];
        el.onOverlap(el2);
    }
  }
}

function mousePressed(){
  init();
}

function init(){
  background(0);
  // Distribute the Elements randomly on a line ;
  elements = [];

  for (var  i = 0; i < tot; i++){
    var s = int(random(0, 2));
    var col = color((hu + i)%255, 200, 255, 2); //Randomly choose cool colors, with alpha equal to 2;

    elements.push( new Element(random(width),height, random(40, 60), col));
    
  }
}


// Define the Element1 class

function Element(x, y, rad, col){
  var pos;
  var vel;
  var dir;
  var r;
  var color;


  this.pos = new p5.Vector(x, y);
  this.vel = new p5.Vector(random(-1, 1), random(-1, 1));
  this.dir = this.vel.copy();
  this.r = rad;
  this.color = col;

  // Define movement: every Element moves on a straight line;

  this.move = function(){
    var mag = this.vel.mag(); //Keep track of the velocity;
    
    this.vel.x += (this.dir.x - this.vel.x) * 0.01;  //Slowly change the velocity vector
    this.vel.y += (this.dir.y - this.vel.y) * 0.01; //to agree with the new direction;
    this.vel.normalize();
    this.vel.mult(mag); //Each element will move with the same initial velocity;

    this.pos.add(this.vel);

  }

  //Define behaviour when the circles overlap
  
  this.onOverlap = function(other){
    var d = (this.pos.x - other.pos.x) * (this.pos.x - other.pos.x) + (this.pos.y - other.pos.y) * (this.pos.y - other.pos.y); 

    //If touching, we change their direction
    
    if (d == (this.r + other.r) * (this.r + other.r)){
      this.dir.rotate(0.01 * 2 * PI);
      other.dir.rotate(0.01 * 2 * PI);
    }
    
    // If overlapping, they will move away from their centers;
    if (d < (this.r + other.r) * (this.r + other.r)){
      
      
      this.dir.x = this.pos.x - other.pos.x;
      this.dir.y = this.pos.y - other.pos.y;
      this.dir.normalize();
      
      //To avoid double counting, we change also the direction of the other Element

      other.dir = this.dir.copy();
      other.dir.mult(-1);
      
      this.visualize(other, d);
}

  }

  //Use this for debugging purpouses;

  this.show = function(){
    stroke(0,  255);
    ellipse(this.pos.x, this.pos.y, this.r * 2, this.r * 2);
    line(this.pos.x + this.dir.x * this.r, this.pos.y + this.dir.y * this.r, this.pos.x, this.pos.y);
  }

  // Check if the Element touches the edges, in which case it bounces back;

  this.bounce = function(){
    if (this.pos.x < 0){
      this.pos.x = 0;
      this.vel.x = -this.vel.x;

    }

    if (this.pos.x > width){
      this.pos.x = width;
      this.vel.x = -this.vel.x;

    }

    if (this.pos.y < 0){
      this.pos.y = 0;
      this.vel.y = -this.vel.y;

    }

    if (this.pos.y > height){
      this.pos.y = height;
      this.vel.y = -this.vel.y;

    }
  }
  
  /*Define visualization: draw a line between the centers when they overlap; the distance between
  the centers controls the thickness of the line;
  */
   
  this.visualize = function(other, d){
    var c = map(d, 0, (this.r + other.r) * (this.r + other.r), 1, 0.5);
    noFill();
    strokeWeight(c * 2);
    stroke(lerpColor(this.color, other.color, 0.5));
   line(this.pos.x, this.pos.y, other.pos.x, other.pos.y);


  }
}

function mousePressed(){
// prevents mouse press from registering twice
  if (frameCount - lapse > 15){
    save('pix.jpg');
    lapse = frameCount;  
  }
}
