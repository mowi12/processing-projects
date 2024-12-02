int[] digits;
int index = 0;

int base = 6;
int lineLength = 10;
int direction = 1;
float oldX = 0;
float oldY = 0;

void setup() {
  size(1920, 1080);
  background(0);
  frameRate(180);
  
  //initLines();
  
  String pi = loadStrings("pi_digits.txt")[0];
  String[] sdigits = pi.split("");
  digits = int(sdigits);
}

void initLines() {
  stroke(255, 50);
  strokeWeight(1);
  line(-width, height / 2, width, height / 2);
  line(width / 2, -height, width / 2, height);
}

void draw() {
  translate(width / 2, height / 2);
  
  int digit = digits[index];
  index++;
  
  float angle = TWO_PI / base * digit * direction;
  
  float x = oldX + lineLength * cos(angle);
  float y = oldY + lineLength * sin(angle);
  
  boolean flag = false;
  if (x <= -width / 2) {
    x +=width;
    flag = true;
  } else if (x >= width / 2) {
    x -= width;
    flag = true;
  }
  if (y <= -height / 2) {
    y += height;
    flag = true;
  } else if (y >= height / 2) {
    y -= height;
    flag = true;
  }
  
  if (flag) {
    direction *= -1;
    oldX = x;
    oldY = y;
    return;
  }
  
  colorMode(RGB, 255);
  float r = map(x, -width / 2, width / 2, 0, 255);
  float b = map(y, -width / 2, width / 2, 0, 255);
  //float alpha = min(max((255 / base) * (digit / base), 50), 255);
  stroke(r, 51, b, 255);
  strokeWeight(1);
  line(oldX, oldY, x, y);
  
  direction *= -1;
  oldX = x;
  oldY = y;
}
