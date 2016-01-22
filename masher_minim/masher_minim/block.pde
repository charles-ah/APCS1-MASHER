public class block
{
  char key;
  //PFont f;
  int fill;
  int xCoord;
  int yCoord;
  int hue;
  public block(char c,int lol)
  {
    key = c;
    fill = lol;
    //f = createFont("Arial",16,true); // STEP 2 Create Font
    xCoord = 0;
    yCoord = 0;
    hue=#000000;
    if(key=='a')
    {
     hue=#A3E39E; 
    }
    if(key=='s')
    {
      hue=#DE1010;
    }
    if(key=='d')
    {
      hue=#8FD6F0;
    }
    if(key=='j')
    {
     hue=#E3F74D; 
    }
    if(key=='k')
    {
     hue=#E552FC; 
    }
    if(key=='l')
    {
     hue=#52F8FC;
    }
    
  }
  
  public void create(int y)
  {                                                                                     
    if(key=='a')
    {
     xCoord = 0*width/6+width/12; 
    }
    if(key=='s')
    {
      xCoord = 1*width/6+width/12; 
    }
    if(key=='d')
    {
      xCoord = 2*width/6+width/12; 
    }
    if(key=='j')
    {
     xCoord = 3*width/6+width/12; 
    }
    if(key=='k')
    {
     xCoord = 4*width/6+width/12;  
    }
    if(key=='l')
    {
     xCoord = 5*width/6+width/12; 
    }
    
    
    yCoord = y;
    
    
    
    if (fill%7==0)
    {
      fill(hue);
      ellipse(xCoord,y,60,60);
    }
    else
    {
      //fill(#000000);
//      noStroke();
     // ellipse(xCoord,y,60,60);
    }
    
  }
}