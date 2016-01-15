import processing.sound.*;
SoundFile file;
PImage img;
int numFrames = 12;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
int value = 0;


void setup() {
  
  //main menu
  size(1400, 700);
  background(#2B1D5A);
  img = loadImage("m.png");
  //img2 = loadImage("a.gif");
  fill(0, 102, 153);
  textSize(200);
  text("MASHER", 50, 200);
  
  //animations
  frameRate(24);
  images[0]  = loadImage("a1.gif");
  images[1]  = loadImage("a2.gif"); 
  images[2]  = loadImage("a3.gif");
  images[3]  = loadImage("a4.gif"); 
  images[4]  = loadImage("a5.gif");
  images[5]  = loadImage("a6.gif"); 
  images[6]  = loadImage("a7.gif");
  images[7]  = loadImage("a8.gif"); 
  images[8]  = loadImage("a9.gif");
  images[9]  = loadImage("a10.gif"); 
  images[10] = loadImage("a11.gif");
  images[11] = loadImage("a12.gif"); 
  
  //alternative looks
  fill(#B4ABD3);
  noStroke();
  for(int i=1; i<8; i++){
  rect(25*i+(i*120)-40, 600, 80, 80);
  fill(#B4ABD3);
  }
  
  //sound system
  //file = new SoundFile(this, "mary.mp3");
  //file.play();
}

void draw(){ 
  
  //work in progress animation
  currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  int offset = 0;
  for (int x = -100; x < width; x += images[0].width) { 
    image(images[(currentFrame+offset) % numFrames], x, -20);
    offset+=2;
    image(images[(currentFrame+offset) % numFrames], x, height/2);
    offset+=2;
  }
  
  //background image
  image(img, 375, 200, width/2, height/2);
  //image(img2, 200, 100, width/2, height/2);
  
 // subpage
 fill(value);
  rect(25, 25, 50, 50);
  
}

void mouseClicked() {
  if (value == 0) {
    value = 2;
  setup2();
  } else {
    value = 0;
  }
}
