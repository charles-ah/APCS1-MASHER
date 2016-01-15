import processing.sound.*;
SoundFile file;
void setup() {
  size(1400, 700);
  noStroke();
  for(int i=1; i<11; i++){
  rect(25*i+(i*100)-40, 600, 80, 80);
  }
  file = new SoundFile(this, "mary.mp3");
  file.play();
}
