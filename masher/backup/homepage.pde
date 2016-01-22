import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer song;
PImage img, img2, img3, soundon, soundoff, black;

//buttons
float x1 = 298, y1 = 545, w1 = 327, h = 70;
float x2 = 265, y2 = 628, w2 = 390;

void setup()
{
  PFont font;
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("ARBERKLEY-48.vlw");
  
  fullScreen();
  minim = new Minim(this);
  // this loads back.mp3 from the data folder
  song = minim.loadFile("back.mp3");
  song.play();
  song.loop();
  img = loadImage("back.jpg");  
  img2 = loadImage("play.PNG");  
  img3 = loadImage("creds.PNG");
  soundon = loadImage("soundOn.png");
  soundoff = loadImage("soundOff.png");
  black = loadImage("black.png");
  image(img, 0, 0, width, height);
  image(img2, x1, y1, w1, h);
  image(img3, x2, y2, w2, h);
  image(soundoff, width-100, height-100, 100, 100);
}

void draw()
{
  //background(0);
  //stroke(255);
  // we draw the waveform by connecting neighbor values with a line
  // we multiply each of the values by 50 
  // because the values in the buffers are normalized
  // this means that they have values between -1 and 1. 
  // If we don't scale them up our waveform 
  // will look more or less like a straight line.
  //for(int i = 0; i < song.bufferSize() - 1; i++)
 // {
 //   line(i, 50 + song.left.get(i)*50, i+1, 50 + song.left.get(i+1)*50);
 //   line(i, 150 + song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
 // }
 
 //buttons
 noFill();
 if(mousePressed){
  if(mouseX>x1 && mouseX <x1+w1 && mouseY>y1 && mouseY <y1+h){
     stroke(#9ACAF2);
   println("Play");
   fill(0);
   clear();
  }
 } 
  if(mousePressed){
  if(mouseX>x2 && mouseX <x2+w2 && mouseY>y2 && mouseY <y2+h){
     stroke(#9ACAF2);
   println("Creds");
   fill(0);
   clear();
  image(img, 0, 0, width, height);
  }
 } 
 if(mousePressed){
  if(mouseX>width-100 && mouseX <width && mouseY>height-100 && mouseY <height){
   println("Music off");
    PausePlay();
  }
 } 
 else{stroke(0);}
}

void PausePlay(){
   if ( song.isPlaying() )
  {
    song.pause();
    image(black, width-100, height-100, 100, 100);
    image(soundon, width-100, height-100, 100, 100);
  }
   if ( !song.isPlaying() )
  {
    song.loop();
    image(black, width-100, height-100, 100, 100);
    image(soundoff, width-100, height-100, 100, 100);
  }
}
