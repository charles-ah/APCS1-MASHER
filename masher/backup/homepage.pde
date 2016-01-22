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

//masher
import java.util.*;
AudioPlayer player;
AudioInput input;
AudioMetaData meta;
PFont f; 
boolean keyz[] = new boolean [10];
block notes[][]=new block[10][]; //10 for the 10 keys, second level represents the time of the blocks
int paused = 0;
int score=0;
int j = 0;
int y = 0;
int count;


void setup()
{
  //masher
   fullScreen();
  frameRate(100);
  player = minim.loadFile("glorious.mp3");
  meta = player.getMetaData();
f = createFont("Arial",16,true);  

  // The font must be located in the sketch's 
  // "data" directory to load successfully
  
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
    song.pause();
   fill(0);
   clear();
   player.play();
   playing();
   {
    fill(#64629B,127);
    rect(0+i*width/10,height-160,width/10,20);
    fill(#F2FAFA);                        
    text((i+1)%10,i*140+65,height-160+15);
  }
  
   Random randgen = new Random(100);
  for(int i =0;i<notes.length;i++)
  {
    notes[i]=new block[(int)(meta.length()/250)];
    for(int j=0;j<notes[i].length;j++)
    {
      notes[i][j] = new block(i,randgen.nextInt());
    }    
  }
  println(meta.length());
   
   
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
   else
  {
    song.loop();
    image(black, width-100, height-100, 100, 100);
    image(soundoff, width-100, height-100, 100, 100);
  }
}

void playing()
{
  count++;
  //background(0);
  loadScore(width-28,20);
  //translate(0,10);
  if (j<notes[0].length)
       {
   
       for(int k=0;k<=j;k++)
       {
         for(int i=0;i<notes.length;i++)
         {
            notes[i][k].create(y-k*60);
         }
         
            
       }
         for(int k=j;k>=0;k--)
         {
            notes[0][k].create(y-k*60);           
         }
      
       j++;
       
       if(notes[0][notes[0].length-1].yCoord >= height+60 || !player.isPlaying())
       {
        player.close();
        clear();
        loadGameOver();
        //text("GAME OVER",700,350);
       }
       else
       {
         
         for(int i=0;i<10;i++)
          {
            fill(#64629B,127);
            
            if(keyPressed && (key >= '0' && key <= '9') && Integer.parseInt(key+"") == i)
            {
              fill(#F2FAFA);
              if(key=='0')
              {
                rect(0+9*width/10,height-160,width/10,20);
              }
              else
              {
               rect(0+(i-1)*width/10,height-160,width/10,20); 
              }
  
              fill(#F2FAFA);                        
              text((i+1)%10,i*width/10+65,height-160+15);              
            }
            else
            {
              rect(0+i*width/10,height-160,width/10,20);
  
              fill(#F2FAFA);                        
              text((i+1)%10,i*width/10+65,height-160+15);
            }
          } 
       }
       
         y+=5;
     }
     else
     {
       j=notes[0].length-1;
       //println("end");
       //clear();
     }
      
      
       
       //delay(delay);
       
       
       
}


boolean track(int i,int j)
{
  if (notes[i][j].yCoord>= height-160-60 && notes[i][j].yCoord<= height-160+60)
  { 
    return true;
  }
  
  return false;
}

void keyPressed()
{
 //for(int i = 0;i<notes.length;i++)
 //{
   if((int)key==32)
   {
    paused++;
    if(paused%2!=0)
    {
     //textFont(f,16);                  // STEP 3 Specify font to be used
     //fill(#FFFFFF);
     //text("PAUSED",width/2,height/2);
     player.pause();
     noLoop(); 
    }
    else
    {
      clear();
      player.play();
     loop(); 
    }
   }
   
   if(key >= '0' && key <= '9')
   {
     int keyInt=Integer.parseInt(key+"");
     for(int j=0;j<notes[keyInt].length;j++)
      {
       if(key == Integer.toString(notes[keyInt][j].key).charAt(0) && track(keyInt,j))
       {  
         notes[keyInt][j].hue = 0;//#FFFFFF;
         score++;
         break;
       }
      }
   }
  
 //}
}


void loadGameOver()
{
    text("SCORE: "+(score-notes[0].length),width/2,height-160);
}

void loadScore(int x,int y)
{
  //background(0);
   fill(0);    // black rectangle = background for information
  //noStroke();
  rect(width-30,0, 20, 20);
  fill(#FFFFFF);  // Text
  
  text(""+(score-notes[0].length),x,y);
}
