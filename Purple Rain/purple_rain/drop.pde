class drop {
  float z = random(0, 20); //random z start value
  float x = random(width); //random x start value between whole width
  float y = random(-500, -100); //random y start value above the screen
  float yspeed = map(z, 0, 20, 0.01, 20); //speed of the drop relative to z (1, 20)
  float len = map(z, 0, 20, 1, 20); //length of the drop relative to z (10, 20)
  float wind = random(0, 1);
  
  void fall() {
    float grav = map(z, 0, 20, 0, 0.2); //gravity of the drop relative to z
    
    y = y + yspeed; //acceleration
    yspeed = yspeed + grav; //acceleration relative to gravity
    
    x = x + wind;
    
    if (y > height) { //reseting drop and all its values ((height * map(z, 0, 20, (1 / 3), 1)))
      x = random(width);
      y = random(-500, -100);
      z = random(0, 20);
      yspeed = map(z, 0, 20, 0.01, 20);
      len = map(z, 0, 20, 1, 20);
      wind = random(0, 1);
    }
  }
  
  void show() {
    float thick = map(z, 0, 20, 0.01, 3); //thickness relative to z (1, 3)
    strokeWeight(thick);
    stroke(138, 43, 226); //colour
    line(x, y, x, y + len); //drawing the drop
  }
}
