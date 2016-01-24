import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim, minim1, minim2;
AudioPlayer song, song1, song2;
PImage img, img2, img3, soundon, soundoff, black, ret, ret1, end;

//buttons
float x1 = 298, y1 = 545, w1 = 327, h = 70;
float x2 = 265, y2 = 628, w2 = 390;


//on and off
int onoff=0;

//song
int sn=0; 

//pages
int location;
//home = 0
//play = 1
//creds = 2


//masher



void setup()
{
 
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  
  fullScreen();
  minim = new Minim(this);
  minim1 = new Minim(this);
  minim2 = new Minim(this);
  // this loads back.mp3 from the data folder
  song = minim.loadFile("back.mp3");
  song.play();
  song.loop();
  song1 = minim1.loadFile("creds.mp3");
  song2 = minim2.loadFile("man.mp3");
  img = loadImage("back.jpg");  
  img2 = loadImage("play.PNG");  
  img3 = loadImage("creds.PNG");
  soundon = loadImage("soundOn.png");
  soundoff = loadImage("soundOff.png");
  black = loadImage("black.png");
   ret = loadImage("ret.png");
   ret1 = loadImage("ret1.png");
   end = loadImage("end.jpg");
  image(img, 0, 0, width, height);
  image(img2, x1, y1, w1, h);
  image(img3, x2, y2, w2, h);
  image(soundoff, width-100, height-100, 100, 100);
}

void draw()
{ 
   int s = second();
   textSize(32);
   PFont font;
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = createFont("ARBERKLEY-48", 32);
  textFont(font);
 
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
 
 
 //TO PLAY BUTTON
 noFill();
 if(mousePressed && location == 0){
  if(mouseX>x1 && mouseX <x1+w1 && mouseY>y1 && mouseY <y1+h){
   stroke(#9ACAF2);
   println("Play");
   song.pause();
   fill(0);
   clear();
   song1.play();
   song1.loop();
   location =1;
   image(img, 0, 0, width, height);
   image(soundoff, width-100, height-100, 100, 100);
   image(ret, 900, 648);
   fill(#E0D3D3);
   textSize(60);
   text("Choose a Song", 480, 250);
   textSize(40);
   text("INTERMEDIATE", 10, 299);
   text("TRIBULATION", 490, 299);
   text("DEXTERITY OF A GOD", 930, 299);
  }
 } 
 
 
 //
 //TO CREDITS
  if(mousePressed && location == 0){
   if(mouseX>x2 && mouseX <x2+w2 && mouseY>y2 && mouseY <y2+h){
    stroke(#9ACAF2);
    println("Creds");
    fill(0);
    location = 2;
    clear();
    image(img, 0, 0, width, height);
    image(soundoff, width-100, height-100, 100, 100);
    song.pause();
    song2.play();
    song2.loop();
    fill(#E0D3D3);
    textSize(96);
    text("Credits", 90, 280);
    textSize(32);
    text("By John Park and Charles Zhang", 90, 350);
    text("Keep it real", 650, 280);
    text("Songs were somewhat downloaded somehow. We do acknowledge the artists' talents.", 90, 420);
    text("Shoutout to our homie Samuel Konstantinovich", 90, 490);
    text("Shoutout to our homies at github to help us keep our previous edits", 90, 560);
    text("Shoutout to our homies who made the minim library ", 90, 630);
    image(ret, 900, 648);
   }
  }
  
  
 if(mousePressed && onoff==0){
  if(mouseX>width-100 && mouseX <width && mouseY>height-100 && mouseY <height){
   println("Music off");
   if (location==0 &&  song.isPlaying()){
    song.pause();
   }
   if (location==1 &&  song1.isPlaying()){
    song1.pause();
   }
   if (location==2 &&  song2.isPlaying()){
    song2.pause();
   }
    image(black, width-100, height-100, 100, 100);
    image(soundon, width-100, height-100, 100, 100);
    onoff=1;
  }
 } 
 
 
 //MUSIC ON AND OFF
 if(mousePressed && onoff==1){
   
   if(mouseX>width-100 && mouseX <width && mouseY>height-100 && mouseY <height){    
      println("Music on");
      
   if (location==0){
    song.loop();
   }
   if (location==1){
    song1.loop();
   }
   if (location==2){
    song2.loop();
   }
    image(black, width-100, height-100, 100, 100);
    image(soundoff, width-100, height-100, 100, 100);
    onoff=0;
   }
   }
   
 if(mousePressed && location == 2){
   if(mouseX>900 && mouseX <1220 && mouseY>648 && mouseY <772){
       song2.pause();
     setup();
  location =0;
      }
     }
 
 if(mousePressed && location == 1){
     if(mouseX>900 && mouseX <1220 && mouseY>648 && mouseY <772){
       song1.pause();
     setup();
  location =0;
      }
     }
 
  if(mousePressed && location == 4){
     if(mouseX>900 && mouseX <1220 && mouseY>648 && mouseY <772){
       //CURRENT SONG .pause();
     setup();
  location =0;
      }
     }
 
 //
 else{stroke(0);}
}


//ACTUALLY PLAY THE GAME
void play()
{
}

void gameover()
{
  image(ret1, 0, 0, width, height);
  location=4;
  image(ret1, 900, 648);
  //score Results
  
}