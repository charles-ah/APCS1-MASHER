import processing.sound.*;


boolean keyz[] = new boolean [10];

block notes[][]=new block[10][]; //10 for the 10 keys, second level represents the time of the blocks


int windowWidth,windowLength;


void setup()
{
  windowWidth = 1400;
  windowLength=700;
  size(1400,700);
  background(#000000);
  for(int i=0;i<10;i++)
  {
    fill(#64629B);
    rect(0+i*140,windowLength-70,windowWidth,30);
    fill(#F2FAFA);                        
    text((i+1)%10,i*140+65,windowLength-70+23);
  }
  
            
  for(int i =0;i<notes.length;i++)
  {
    notes[i]=new block[5];
    notes[i][0] = new block(i,true);
    notes[i][1] = new block(i,false);
    notes[i][2] = new block(i,true);
    notes[i][3] = new block(i,false);
    notes[i][4] = new block(i,true);
  }
  
}

int j = 0;
int y = 0;
void draw()
{
  println(y);
  int delay=10;
  for(int i=0;i<10;i++)
        {
          fill(#64629B);
          rect(0+i*140,windowLength-70,windowWidth,30);
          fill(#F2FAFA);                        
          text((i+1)%10,i*140+65,windowLength-70+23);
        }
  //translate(0,10);
  if (j<notes[0].length)
       {
   
       for(int k=j;k>=0;k--)
       {
         for(int i=0;i<notes.length;i++)
         {
            notes[i][k].create(y+k*30);
            //delay(50);
         }
         //delay(delay);
            
       }
         for(int k=j;k>=0;k--)
         {
            notes[0][k].create(y+k*30);
            //delay(delay);
         }
       //delay(delay);
         j++;
         y+=1.5;
     }
     else
     {
       j=0;
       println("end");
       //clear();
     }
      
       
       
       delay(delay);
       
       
}