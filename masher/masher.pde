import processing.sound.*;


boolean keyz[] = new boolean [10];

block notes[][]=new block[10][]; //10 for the 10 keys, second hierachy represents the time of the blocks


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
    notes[i]=new block[4];
    notes[i][0] = new block(i);
    notes[i][1] = new block(10);
    notes[i][2] = new block(i);
    notes[i][3] = new block(10);
  }
  
}

int j = 0;
int y = 0;
void draw()
{
  if (j<notes[0].length-1)
       {
    
        for(int i=0;i<10;i++)
        {
          fill(#64629B);
          rect(0+i*140,windowLength-70,windowWidth,30);
          fill(#F2FAFA);                        
          text((i+1)%10,i*140+65,windowLength-70+23);
        }
        translate(0,y);
       for(int i=1;i<notes.length;i++)
       {
          //for(int k=0;k<j;k++)
          //{
            notes[i][j].create(0);
          //}
       }
       //for(int k=0;k<j;k++)
       //{
         notes[0][j].create(0);
       //}
         
       
         j++;
     }
     else
     {
       j=0;
       println("end");
     }
      
       y+=30;
       
       delay(100);
       
}