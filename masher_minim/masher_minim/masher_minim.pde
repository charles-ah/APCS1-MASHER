import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


import java.util.*;

Minim minim;
AudioPlayer player;
BeatDetect beat;
AudioMetaData meta;
Frequency hz;
PImage img;

PFont f; 

char keyz[] = {'a','s','d','j','k','l'};

block notes[][]=new block[6][]; //10 for the 10 keys, second level represents the time of the blocks

 String file="glorious.mp3";

int paused = 0;
int state=0;
int score=0;
void setup()
{
  img = loadImage("gameover.png");
  
  
  frameRate(100);
  
  beat = new BeatDetect();
  beat.setSensitivity(1000);
  minim = new Minim(this);
  player = minim.loadFile(file);
  meta = player.getMetaData();
  
  
 f = createFont("Arial",16,true);
  
  //size(1400,700);
  fullScreen();
  background(#000000);
  makekeys();
 
  
  
  
   Random randgen = new Random(10);
  for(int i =0;i<notes.length;i++)
  {
    notes[i]=new block[(int)(meta.length()/250)];
    for(int j=0;j<notes[i].length;j++)
    {
      notes[i][j] = new block(keyz[i],randgen.nextInt());
    }    
  }
  println(meta.length());
  state=1;
}

int j = 0;
int y = 0;
int count;

void draw()
{
   if(state == 1)
     {
       player.play();
       beat.detect(player.mix);
       /*
       if(beat.isOnset())
       {
         notes[(int)(5*Math.random())][]
       }
       */
       println(beat.isOnset());
       
       play();
     }
}

void play()
{
  count++;
  //println(hz.asHz());
  //println(hz.asMidiNote());
  //background(0);
  loadScore(width-28,20);
  //translate(0,10);
  if (j<notes[0].length)
       {
       for(int k=0;k<=j;k++)
       {
         for(int i=0;i<notes.length;i++)
         {
           if(notes[i][k].yCoord <= height)
           {
            notes[i][k].create(y-k*60);
           }
         }     
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
         makekeys();
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
  if (notes[i][j].yCoord >= height-160-60 && notes[i][j].yCoord <= height-160+60)
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
   
   if(key=='a')
   {
     for(int j=0;j<notes[0].length;j++)
     {
        if(track(0,j))
       {  
         notes[0][j].hue = 0;//#FFFFFF;
         score++;
         break;
       }
     }
   }
   if(key=='s')
   {
     for(int j=0;j<notes[1].length;j++)
     {
        if(track(1,j))
       {  
         notes[1][j].hue = 0;//#FFFFFF;
         score++;
         break;
       }
     }
   }
   if(key=='d')
   {
     for(int j=0;j<notes[2].length;j++)
     {
        if(track(2,j))
       {  
         notes[2][j].hue = 0;//#FFFFFF;
         score++;
         break;
       }
     }
   }
   if(key=='j')
   {
     for(int j=0;j<notes[3].length;j++)
     {
        if(track(3,j))
       {  
         notes[3][j].hue = 0;//#FFFFFF;
         score++;
         break;
       }
     }
   }
   if(key=='k')
   {
     for(int j=0;j<notes[4].length;j++)
     {
        if(track(4,j))
       {  
         notes[4][j].hue = 0;//#FFFFFF;
         score++;
         break;
       }
     }
   }
   if(key=='l')
   {
     for(int j=0;j<notes[5].length;j++)
     {
        if(track(5,j))
       {  
         notes[5][j].hue = 0;//#FFFFFF;
         score++;
         break;
       }
     }
   }
   
  
 //}
}


void loadGameOver()
{
    image(img, 0, 0,width,height);
    text("SCORE: "+(score-notes[0].length),width/2,height-160);
}

void loadScore(int x,int y)
{
  //background(0);
   fill(0);    // black rectangle = background for information
  //noStroke();
  rect(width-30,0, 30, 20);
  fill(#FFFFFF);  // Text
  
  text(""+(score),x,y);
}

void makekeys()
{
  for(int i=0;i<6;i++)
          {
            fill(#64629B,127);
            
            if(keyPressed && keyz[i]==key)
            {
              fill(#F2FAFA);
              if(i==5)
              {
                rect(0+5*width/6,height-160,width/6,20);
              }
              else
              {
               rect(0+i*width/6,height-160,width/6,20); 
              }
  
              fill(#F2FAFA);                 
              text(keyz[i],i*width/6+width/12,height-160+15);              
            }
            else
            {
              rect(0+i*width/6,height-160,width/6,20);
  
              fill(#F2FAFA);                        
              text(keyz[i],i*width/6+width/12,height-160+15);
            }
          } 
}