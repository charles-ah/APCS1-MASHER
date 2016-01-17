public class block
{
  int key;
  //PFont f;
  boolean fill;
  int xCoord;
  int yCoord;
  int hue;
  public block(int c,boolean lol)
  {
    key = c;
    fill = lol;
    //f = createFont("Arial",16,true); // STEP 2 Create Font
    xCoord = 0;
    yCoord = 0;
    hue=#000000;
    if(key==1)
    {
     hue=#A3E39E; 
    }
    if(key==2)
    {
      hue=#DE1010;
    }
    if(key==3)
    {
      hue=#8FD6F0;
    }
    if(key==4)
    {
     hue=#E3F74D; 
    }
    if(key==5)
    {
     hue=#E552FC; 
    }
    if(key==6)
    {
     hue=#52F8FC;
    }
    if(key==7)
    {
      hue=#FC7752;
    }
    if(key==8)
    {
     hue= #6752FC;
    }
    if(key==9)
    {
      hue=#4EB227;
    }
    if(key==0)
    {
      hue=#DBCC40;
    }
  }
  
  public void create(int y)
  {                                                                                     
    
    if (key == 0)
    {
     xCoord = 9*140+65; 
    }
    else
    {
      xCoord=((key-1))*140+65;
    }
    yCoord = y;
    
    
    
    if (fill)
    {
      fill(hue);
      ellipse(xCoord,y,60,60);
    }
    else
    {
      fill(#000000);
//      noStroke();
      ellipse(xCoord,y,60,60);
    }
    
  }
}
