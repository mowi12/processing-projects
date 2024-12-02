//import processing.sound.*;

puck puck;

//SoundFile ding;

paddle left;
paddle right;

int leftscore = 0;
int rightscore = 0;

int paddlespeed = 10;

void setup() {
  size(600, 400);
  //ding = new SoundFile(this,"ding.mp3");
  puck = new puck();
  left = new paddle(true);
  right = new paddle(false);
  
}

void draw() {
  background(0);
  
  puck.checkpaddleRight(right);
  puck.checkpaddleLeft(left);
  
  left.show();
  right.show();
  left.update();
  right.update();
  
  puck.update();
  puck.edges();
  puck.show();
  
  fill(255);
  textSize(32);
  text(leftscore, 32, 40);
  text(rightscore, width - 64, 40);
}

void keyReleased() {
  left.move(0);
  right.move(0);
}

void keyPressed() {
  if (key == 'w') {
    left.move(-paddlespeed);
  } else if (key == 's') {
    left.move(paddlespeed);
  }
  
  if (key == 'u') {
    right.move(-paddlespeed);
  } else if (key == 'j') {
    right.move(paddlespeed);
  }
}
