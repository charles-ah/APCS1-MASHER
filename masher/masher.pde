import processing.sound.*;


boolean keyz[] = new boolean [36];

block notes[];


int windowWidth,windowLength;


void setup()
{
  windowWidth = 1400;
  windowLength=700;
  size(1400,700);
  for(int i=0;i<10;i++)
  {
    fill(#64629B);
    rect(0+i*140,windowLength-80,windowWidth,30);
    fill(#F2FAFA);                        
    text((i+1)%10,i*140+65,windowLength-80+23);
  }
  
            
  
  notes=new block[3];
  notes[0] = new block(2);
  notes[1] = new block(2);
  notes[2] = new block(2);
}

void draw()
{
   
     //println("lol");
     for(int i = 0;i<notes.length;i++)
     {
       notes[i].create();
       translate(0,30);
     }
    
}