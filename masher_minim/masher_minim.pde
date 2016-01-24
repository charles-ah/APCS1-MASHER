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

ArrayList<ArrayList<block>> beats = new ArrayList<ArrayList<block>>(6);
ArrayList<block> inner = new ArrayList<block>(1);

 String file="tougenkyou.mp3";

int paused = 0;
int state=0;
int score=0;
void setup()
{
  img = loadImage("gameover.png");
  
  
  frameRate(100);
  
  beat = new BeatDetect();
  beat.setSensitivity(1000);
  beat.detectMode(BeatDetect.FREQ_ENERGY);
  minim = new Minim(this);
  player = minim.loadFile(file);
  meta = player.getMetaData();
  
  
 f = createFont("Arial",16,true);
  
  //size(1400,700);
  fullScreen();
  background(#000000);
  makekeys();
 
  
  
  
   Random randgen = new Random(10);
   println(beats.size());
   //beats= new ArrayList(new ArrayList<block>());
  for(int i =0;i<6;i++)
  {  
    beats.add(inner);
    inner.add(new block(keyz[i],1));
    inner = new ArrayList<block>();
  }
  
  println(beats.size());
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
       println(beat.isOnset());
       if(beat.isKick()||beat.isSnare()||beat.isHat())
       {
         for(int i =0;i<6;i++)
          {
            
            //notes[i][notes[i].length-1] = new block(keyz[i],(int)Math.random());//randgen.nextInt());
            (beats.get(i)).add(new block(keyz[i],(int)(35*Math.random())));
          }
          
       }
       
       //println(beat.isOnset());
       
       play();
     }
     if(state == 2)
     {
       clear();
       text("PAUSED",width/2,height/2);
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
  println(beats.size());
  if (j<=(beats.get(0)).size())
       {
       for(int k=0;k<j;k++)
       {
         for(int i=0;i<beats.size();i++)
         {
           if((beats.get(i)).get(k).yCoord <= height)
           {
            ((beats.get(i)).get(k)).create();
            ((beats.get(i)).get(k)).yCoord+=5;
            
           }
         }     
       }
       
       j++;
       
       if((beats.get(0)).get((beats.get(0)).size()-1).yCoord >= height+60 || !player.isPlaying())
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
       
         //y+=5;
     }
     else
     {
       j=(beats.get(0)).size()-1;
       //println("end");
       //clear();
     }
      
      
       
       //delay(delay);
       
       
       
}

boolean track(int i,int j)
{
  if ((beats.get(i)).get(j).yCoord >= height-400-60 && (beats.get(i)).get(j).yCoord <= height-400+90)
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
     //noLoop(); 
     state=2;
    }
    else
    {
      background(0);
      state = 1;
      player.play();
     loop(); 
    }
   }
   
   if(key=='a')
   {
     for(int j=0;j<(beats.get(0)).size();j++)
     {
        if(track(0,j))
       {  
         (beats.get(0)).get(j).hue = 0;//#FFFFFF;
         score++;
         break;
       }
     }
   }
   if(key=='s')
   {
     for(int j=0;j<(beats.get(1)).size();j++)
     {
        if(track(0,j))
       {  
         (beats.get(1)).get(j).hue = 0;//#FFFFFF;
         score++;
         break;
       }
     }
   }
   if(key=='d')
   {
     for(int j=0;j<(beats.get(2)).size();j++)
     {
        if(track(0,j))
       {  
         (beats.get(2)).get(j).hue = 0;//#FFFFFF;
         score++;
         break;
       }
     }
   }
   if(key=='j')
   {
     for(int j=0;j<(beats.get(3)).size();j++)
     {
        if(track(0,j))
       {  
         (beats.get(3)).get(j).hue = 0;//#FFFFFF;
         score++;
         break;
       }
     }
   }
   if(key=='k')
   {
     for(int j=0;j<(beats.get(4)).size();j++)
     {
        if(track(0,j))
       {  
         (beats.get(4)).get(j).hue = 0;//#FFFFFF;
         score++;
         break;
       }
     }
   }
   if(key=='l')
   {
     for(int j=0;j<(beats.get(5)).size();j++)
     {
        if(track(0,j))
       {  
         (beats.get(5)).get(j).hue = 0;//#FFFFFF;
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
    //text("SCORE: "+(score-notes[0].length),width/2,height-400);
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
                rect(0+5*width/6,height-400,width/6,20);
              }
              else
              {
               rect(0+i*width/6,height-400,width/6,20); 
              }
  
              fill(#F2FAFA);                 
              text(keyz[i],i*width/6+width/12,height-400+15);              
            }
            else
            {
              rect(0+i*width/6,height-400,width/6,20);
  
              fill(#F2FAFA);                        
              text(keyz[i],i*width/6+width/12,height-400+15);
            }
          } 
}