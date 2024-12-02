class puck {
  float r = 20;
  float x = width/2;
  float y = height/2;
  float xspeed;
  float yspeed;
  
  puck() {
    reset();
  }
  
  void checkpaddleLeft(paddle p) {
    if ((y - r/2 < p.y + p.h/2 && y + r/2 > p.y - p.h/2) && (x - r/2 < p.x + p.w/2) && (xspeed < 0)) {
      if (x > p.x) {
        float diff = y - (p.y - p.h/2);
        float rad = radians(45);
        float angle = map (diff, 0, p.h, -rad, rad);
        xspeed = 5 * cos(angle);
        yspeed = 5 * sin(angle);
        
        x = p.x + p.w/2 + r;
      }
    }
  }
      
  void checkpaddleRight(paddle p) {
    if ((y - r/2 < p.y + p.h/2 && y + r/2 > p.y - p.h/2) && (x + r/2 > p.x - p.w/2) && (xspeed > 0)) {
       if (x < p.x) {
        float diff = y - (p.y - p.h/2);
        float rad = radians(135);
        float angle = map (diff, 0, p.h, radians(225), radians(135));
        xspeed = 5 * cos(angle);
        yspeed = 5 * sin(angle);
        
        x = p.x - p.w/2 - r;
      }
    }
  }
  
  void update() {
    x = x + xspeed;
    y = y + yspeed;
  }
  
  void reset() {
    x = width/2;
    y = height/2;
    
    float angle = random(-PI/4, PI/4);
    xspeed = 5 * cos(angle);
    yspeed = 5 * sin(angle);
    
    if (random(1) < 0.5) {
      xspeed *= -1;
    }
  }
  
  void edges() {
   if (y < (r/2) || y > (height - (r/2))) {
     yspeed *= -1;
   }
   
   if (x > (width + (r/2))) {
     //ding.play();
     leftscore++;
     reset();
   }
   
   if (x < -(r/2)) {
     //ding.play();
     rightscore++;
     reset();
   }
  }
  
  void show() {
    fill(255);
    ellipse(x, y, r, r); 
  }
}
