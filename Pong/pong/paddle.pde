float gap = 10;

class paddle {
  float x;
  float y = height/2;
  float w = 20;
  float h = 100;
  
  float ychange = 0;
  
  paddle(boolean left) {
    if (left) {
      x = w/2 + gap;
    } else {
      x = width - w/2 - gap;
    }
  }
  
  void update() {
    y += ychange;
    y = constrain(y, h/2, height - h/2);
  }
  
  void move(float steps) {
    ychange = steps;
  }
  
  void show() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, w, h);
  }
}
