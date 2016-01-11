public class block
{
  int velocity;
  char key;
  PFont f;
  
  
  public block(int v,char c)
  {
    velocity = v;
    key = c;
    f = createFont("Arial",16,true); // STEP 2 Create Font

  }
  
  public void create(int x,int y)
  {
    fill(#A3E39E);
    rect(x,y,30,30);
    textFont(f,16);                  // STEP 3 Specify font to be used
    fill(#F2FAFA);                         // STEP 4 Specify font color 
    text(key,x+11,y+23);   // STEP 5 Display Text
    
  }
}