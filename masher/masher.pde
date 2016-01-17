import processing.sound.*;
//SoundFile file;

boolean keyz[] = new boolean [10];

block notes[][]=new block[10][]; //10 for the 10 keys, second level represents the time of the blocks


int windowWidth,windowLength;


void setup()
{
  frameRate(60);
  //file = new SoundFile(this, "sample.mp3");
  //file.play();
  
  windowWidth = 1400;
  windowLength=700;
  size(1400,700);
  background(#000000);
  for(int i=0;i<10;i++)
  {
    fill(#64629B,127);
    rect(0+i*140,windowLength-160,windowWidth,20);
    fill(#F2FAFA);                        
    text((i+1)%10,i*140+65,windowLength-160+15);
  }
  
            
  for(int i =0;i<notes.length;i++)
  {
    notes[i]=new block[30];
    for(int j=0;j<notes[i].length;j++)
    {
      notes[i][j] = new block(i,true);
    }    
  }
  
}

int j = 0;
int y = 300;

void draw()
{
  println(j);
  int delay=0;
  
  //translate(0,10);
  if (j<notes[0].length)
       {
   
       for(int k=0;k<=j;k++)
       {
         for(int i=0;i<notes.length;i++)
         {
            notes[i][k].create(y-k*60);
            //track(i,k);
            //delay(50);
         }
         //delay(delay);
            
       }
         for(int k=j;k>=0;k--)
         {
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
     }
     else
     {
       j=notes[0].length-1;
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
       
       //delay(delay);
       
       
       
}

boolean track(int i,int j)
{
  if (notes[i][j].yCoord+60 >= windowLength-160 && notes[i][j].yCoord+60 <= windowLength-160+30)
  { 
    return true;
  }
  else if (notes[i][j].yCoord >= windowLength-160 && notes[i][j].yCoord <= windowLength-160+30)
  {
    return true;
  }
  return false;
}

void keyPressed()
{
 //for(int i = 0;i<notes.length;i++)
 //{
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
