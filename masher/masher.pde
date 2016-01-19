import processing.sound.*;
<<<<<<< HEAD
import java.util.*;
SoundFile file;
PImage img;

PFont f; 
=======
//SoundFile file;
>>>>>>> 84aa43af0b51f74a3beccd8217f79bd35cab2488

boolean keyz[] = new boolean [10];

block notes[][]=new block[10][]; //10 for the 10 keys, second level represents the time of the blocks

int paused = 0;


void setup()
{
<<<<<<< HEAD
  img = loadImage("gameover.png");
  
  fullScreen();
  frameRate(100);
  file = new SoundFile(this, "tougenkyou.mp3");
  //file.cue(10);
  file.play();
 f = createFont("Arial",16,true);
  
  //size(1400,700);
=======
  frameRate(60);
  //file = new SoundFile(this, "sample.mp3");
  //file.play();
  
  windowWidth = 1400;
  windowLength=700;
  size(1400,700);
>>>>>>> 84aa43af0b51f74a3beccd8217f79bd35cab2488
  background(#000000);
  for(int i=0;i<10;i++)
  {
    fill(#64629B,127);
<<<<<<< HEAD
    rect(0+i*width/10,height-160,width/10,20);
    fill(#F2FAFA);                        
    text((i+1)%10,i*140+65,height-160+15);
=======
    rect(0+i*140,windowLength-160,windowWidth,20);
    fill(#F2FAFA);                        
    text((i+1)%10,i*140+65,windowLength-160+15);
>>>>>>> 84aa43af0b51f74a3beccd8217f79bd35cab2488
  }
  
   Random randgen = new Random(100);
  for(int i =0;i<notes.length;i++)
  {
<<<<<<< HEAD
    notes[i]=new block[(int)file.duration()];
    for(int j=0;j<notes[i].length;j++)
    {
      notes[i][j] = new block(i,randgen.nextInt());
=======
    notes[i]=new block[30];
    for(int j=0;j<notes[i].length;j++)
    {
      notes[i][j] = new block(i,true);
>>>>>>> 84aa43af0b51f74a3beccd8217f79bd35cab2488
    }    
  }
  
}

int j = 0;
<<<<<<< HEAD
int y = 0;
int count;

void draw()
{
  count++;
=======
int y = 300;

void draw()
{
  println(j);
>>>>>>> 84aa43af0b51f74a3beccd8217f79bd35cab2488
  int delay=0;
  
  //translate(0,10);
  if (j<notes[0].length)
       {
   
       for(int k=0;k<=j;k++)
       {
         for(int i=0;i<notes.length;i++)
         {
            notes[i][k].create(y-k*60);
<<<<<<< HEAD
=======
            //track(i,k);
            //delay(50);
>>>>>>> 84aa43af0b51f74a3beccd8217f79bd35cab2488
         }
         
            
       }
         for(int k=j;k>=0;k--)
         {
<<<<<<< HEAD
            notes[0][k].create(y-k*60);           
         }
      
       j++;
       
       if(notes[0][notes[0].length-1].yCoord >= height+60)
       {
        file.stop();
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
              rect(0+(i-1)*width/10,height-160,width/10,20);
  
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
=======
            notes[0][k].create(y-k*60);
            //track(0,k);
            //delay(delay);
         }
       delay(delay);
       j++;
       
       if(notes[0][29].yCoord >= windowLength+60)
       {
        
        clear();
        text("GAME OVER",700,350);
       }
       
         y+=4;
>>>>>>> 84aa43af0b51f74a3beccd8217f79bd35cab2488
     }
     else
     {
       j=notes[0].length-1;
<<<<<<< HEAD
       //println("end");
       //clear();
     }
      
      
=======
       println("end");
       //clear();
     }
      
       for(int i=0;i<10;i++)
        {
          fill(#64629B,127);
          rect(0+i*140,windowLength-160,windowWidth,20);
          fill(#F2FAFA);                        
          text((i+1)%10,i*140+65,windowLength-160+15);
        }
>>>>>>> 84aa43af0b51f74a3beccd8217f79bd35cab2488
       
       //delay(delay);
       
       
       
}

boolean track(int i,int j)
{
<<<<<<< HEAD
  if (notes[i][j].yCoord>= height-160-60 && notes[i][j].yCoord+60 <= height-160+30+60)
  { 
    return true;
  }
  
=======
  if (notes[i][j].yCoord+60 >= windowLength-160 && notes[i][j].yCoord+60 <= windowLength-160+30)
  { 
    return true;
  }
  else if (notes[i][j].yCoord >= windowLength-160 && notes[i][j].yCoord <= windowLength-160+30)
  {
    return true;
  }
>>>>>>> 84aa43af0b51f74a3beccd8217f79bd35cab2488
  return false;
}

void keyPressed()
{
 //for(int i = 0;i<notes.length;i++)
 //{
<<<<<<< HEAD
   if((int)key==32)
   {
    paused++;
    if(paused%2!=0)
    {
     //textFont(f,16);                  // STEP 3 Specify font to be used
     //fill(#FFFFFF);
     //text("PAUSED",width/2,height/2);
     file.stop();
     noLoop(); 
    }
    else
    {
      clear();
      file.jump(count/100);
     loop(); 
    }
   }
   
=======
>>>>>>> 84aa43af0b51f74a3beccd8217f79bd35cab2488
   if(key >= '0' && key <= '9')
   {
     int keyInt=Integer.parseInt(key+"");
     for(int j=0;j<notes[keyInt].length;j++)
      {
       if(key == Integer.toString(notes[keyInt][j].key).charAt(0) && track(keyInt,j))
       {  
         notes[keyInt][j].hue = #FFFFFF;
         break;
       }
      }
   }
  
 //}
}
<<<<<<< HEAD


void loadGameOver()
{
    image(img, 0, 0,width,height);
}
=======
>>>>>>> 84aa43af0b51f74a3beccd8217f79bd35cab2488
