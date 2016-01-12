import processing.sound.*;


boolean keyz[] = new boolean [36];

block notes[];

<<<<<<< HEAD
int windowWidth,windowLength;
=======
void setup
{
 size(1700, 1000);
}
>>>>>>> 24b65172f6e9965570c5093fb9791b152ce58979



void setup()
{
  windowWidth = 1400;
  windowLength=700;
  size(1400,700);
  fill(#64629B);
  rect(0,windowLength-80,windowWidth,30,5);
  
  
  notes=new block[3];
  notes[0] = new block(1,'2');
  notes[1] = new block(1,'2');
  notes[2] = new block(1,'2');
}

void draw()
{
 for(int i = 0;i<notes.length;i++)
 {
   notes[i].create(4,4);
   //translate(0,30);
 }

}
