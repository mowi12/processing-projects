drop[] drops = new drop[3000]; //creates an array with n spaces

void setup() {
  size(1280, 720);
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new drop(); //creates new drop for each space in the array
  }
}

void draw() {
  background(230, 230, 250);
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
  }
}
