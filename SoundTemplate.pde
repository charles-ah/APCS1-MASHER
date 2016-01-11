import processing.sound.*;
SoundFile file;

void setup() {
  size(640, 360);
  background(255);
 
 
  file = new SoundFile(this, "mary.mp3");
  file.play();
  
  void mousePressed() {
  file.stop();
  }   
}      

