var imgs = [];
var imgIndex = -1;
var img;
var paint;
var subStep = 800;
var z = 0;
var isStop = false;
var count = 0;

function preload() {
  imgs[0] = loadImage("test1.png");
  imgs[1] = loadImage("test2.png");
  imgs[2] = loadImage("test3.png");
}

function setup() {
	if(windowWidth < 600)
  	createCanvas(windowWidth, windowWidth);
	else 
  	createCanvas(600, 600);
  img = createImage(width, height);
  nextImage();
  paint = new Paint(createVector(width/2, height/2));
  background(255, 255, 255);
  colorMode(RGB, 255, 255, 255, 255);
}

function draw() {
  //console.log(frameRate());
  if (!isStop) {
  	for (var i = 0 ; i < subStep ; i++) {
      paint.update();
      paint.show();
      z+= 0.01;
    }
  }
	count++;
	if (count > width) {
		isStop = true;
	}
	//background(255);
	//image(img, 0, 0, width, height);
}

function fget(i, j) {
  var index = j * img.width + i;
  index *= 4;
  return color(img.pixels[index], img.pixels[index+1], img.pixels[index+2], img.pixels[index+3]);
}

function fset(i, j, c) {
  var index = j * img.width + i;
  index *= 4;
  img.pixels[index] = red(c);
  img.pixels[index+1] = green(c);
  img.pixels[index+2] = blue(c);
  img.pixels[index+3] = alpha(c);
}

function keyPressed() {
  console.log(key);
  if (key === 's' || key === 'S') {
    isStop = !isStop;
  } 
}
function mouseClicked() {
  nextImage();
	isStop = false;
	count = 0;
}
function touchStarted() {
  nextImage();
	isStop = false;
	count = 0;
}

function nextImage() {
	if (!img) return;
  imgIndex = (++imgIndex) % imgs.length;
  var targetImg = imgs[imgIndex];
  img.copy(targetImg, 0, 0, targetImg.width, targetImg.height, 0, 0, img.width, img.height);
  //img.resize(width, height);
  img.loadPixels();
  clear();
}