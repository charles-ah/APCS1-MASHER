import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


import java.util.*;

//Minim minim;
AudioPlayer player1;
AudioPlayer player2;
BeatDetect beat;
AudioMetaData meta;
Frequency hz;
//PImage img;

PFont f; 

char keyz[] = {'a','s','d','j','k','l'};

//block notes[][]=new block[6][]; //10 for the 10 keys, second level represents the time of the blocks

ArrayList<ArrayList<block>> beats = new ArrayList<ArrayList<block>>(0);
ArrayList<block> inner = new ArrayList<block>(1);

 

int paused = 0;
int state=0;
int score=0;
void setup1(String music)
{
  song.close();
  song1.close();
  song2.close();
  //song3.close();
  
  
  String file=music;
  //img = loadImage("gameover.png");
  textFont(font);
  
  frameRate(100);
  
  beat = new BeatDetect();
  beat.setSensitivity(1000);
  beat.detectMode(BeatDetect.FREQ_ENERGY);
  minim = new Minim(this);
  player1 = minim.loadFile(file);
  player2 = minim.loadFile(file);
  meta = player1.getMetaData();
  
  
 f = createFont("Arial",16,true);
  
  //size(1400,700);
  fullScreen();
  background(#000000);
 // makekeys();
 
  
  
  
   Random randgen = new Random(10);
   println(beats.size());
   //beats= new ArrayList(new ArrayList<block>());
  for(int i =0;i<4;i++)
  {  
    beats.add(inner);
    inner.add(new block(keyz[i],1));
    inner = new ArrayList<block>();
  }
  
  //println(beats.size());
  //println(meta.length());
  state=1;
}

int j = 0;
int y = 0;
int time;
int first=0;
void draw(int u)
{
  time++;
   if(state == 1)
     {
       if( ((beats.get(0)).get(first)).yCoord>=height-405)
       {
         player1.play();
       }
       
       
       player2.play();
       player2.mute();
       beat.detect(player2.mix);
      
       if(beat.isKick()||beat.isSnare()||beat.isHat())
       {
         //int a = (int)(3*Math.random());
         //(beats.get(a)).add(new block(keyz[a],0));
         for(int i =0;i<4;i++)
          {
            
            //notes[i][notes[i].length-1] = new block(keyz[i],(int)Math.random());//randgen.nextInt());
            //if(i!=a)
            //{
              (beats.get(i)).add(new block(keyz[i],(int)(10*Math.random())));
              (beats.get(i)).add(new block(keyz[i],1));
            
            if(first==0)
            {
             first=(beats.get(i)).size()-1; 
            }
           // }
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
     
     if(meta.length()/1000-player1.position()/1000==0)
       {
         println("end");
        player1.close();
        player2.close();
        clear();
        gameover();
        //text("GAME OVER",700,350);
       }
       else
       {
         makekeys();
       }
}

void play()
{
  println(player1.position());
  println(meta.length());
  
  
  loadScore(width-28,20);
  //translate(0,10);
  println(beats.size());
  if (j<=(beats.get(0)).size())
       {
       for(int k=0;k<(beats.get(0)).size();k++)
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
  if ((beats.get(i)).get(j).yCoord >= height-160-60 && (beats.get(i)).get(j).yCoord <= height-160+80)
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
     player1.pause();
     //noLoop(); 
     state=2;
    }
    else
    {
      background(0);
      state = 1;
      player1.play();
     loop(); 
    }
   }
   
   if(key=='a')
   {
     int temp = score;
     for(int j=0;j<(beats.get(0)).size();j++)
     {
        if(track(0,j))
       {  
         //#FFFFFF;
         if(((beats.get(0)).get(j)).fill%9==0)
         {
           score++;
         }
         
         (beats.get(0)).get(j).hue = 0;
         break;
       }
        
     }
     if(score == temp)
     {
      score--; 
     }
   }
   if(key=='s')
   {
     int temp = score;
     for(int j=0;j<(beats.get(1)).size();j++)
     {
        if(track(0,j))
       {  
         //#FFFFFF;
         if(((beats.get(1)).get(j)).fill%9==0)
         {
           score++;
         }
         (beats.get(1)).get(j).hue = 0;
         break;
       }
       
     }
     if(score == temp)
     {
      score--; 
     }
   }
   if(key=='d')
   {
     int temp = score;
     for(int j=0;j<(beats.get(2)).size();j++)
     {
        if(track(0,j))
       {  
         //#FFFFFF;
         if(((beats.get(2)).get(j)).fill%9==0)
         {
           score++;
         }
         (beats.get(2)).get(j).hue = 0;
         break;
       }
        
     }
     if(score == temp)
     {
      score--; 
     }
   }
   if(key=='j')
   {
     int temp = score;
     for(int j=0;j<(beats.get(3)).size();j++)
     {
        if(track(0,j))
       {  
         //#FFFFFF;
         if(((beats.get(3)).get(j)).fill%9==0)
         {
           score++;
         }
         (beats.get(3)).get(j).hue = 0;
         break;
       }
       
     }
     if(score == temp)
     {
      score--; 
     }
   }
   /*
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
         (beats.get(5)).get(j).hue = #FFFFFF;
         score++;
         break;
       }
     }
   }
   */
  
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
  rect(width-40,0, 40, 25);
  fill(#FFFFFF);  // Text
  text("SCORE", x-10,y-10);
  text(""+(score),x,y+5);
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
                rect(0+5*width/4,height-160,width/4,20);
              }
              else
              {
               rect(0+i*width/4,height-160,width/4,20); 
              }
  
              fill(#F2FAFA); 
              textFont(font);
              text(keyz[i],i*width/4+width/8,height-160+15);              
            }
            else
            {
              rect(0+i*width/4,height-160,width/4,20);
  
              fill(#F2FAFA); 
              textFont(font);
              text(keyz[i],i*width/4+width/8,height-160+15);
            }
          } 
}