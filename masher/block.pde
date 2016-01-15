public class block
{
  int key;
  //PFont f;
  boolean fill;
  int xCoord;
  int yCoord;
  public block(int c,boolean lol)
  {
    key = c;
    fill = lol;
    //f = createFont("Arial",16,true); // STEP 2 Create Font
    xCoord = 0;
    yCoord = 0;
  }
  
  public void create(int y)
  {
     
    if (key == 0)
    {
     xCoord = 9*140; 
    }
    else
    {
      xCoord=((key-1))*140;
    }
    yCoord = y;
    
    if (fill)
    {
      fill(#A3E39E);
      rect(xCoord,y,140,30);
    }
    else
    {
      fill(#000000);
//      noStroke();
      rect(xCoord,y,140,30);
    }
    
  }
}