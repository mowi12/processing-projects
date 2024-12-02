String pi;
int[] digits;
int index = 0;
float r = 200;

void setup() {
  size(600, 600);
  background(0);
  translate(width / 2, height / 2);
  stroke(255);
  noFill();
  ellipse(0, 0, 2 * r, 2 * r);
  
  pi = loadStrings("pi_digits.txt")[0];
  //println(pi.length());
  String[] sdigits = pi.split("");
  //println(sdigits.length);
  digits = int(sdigits);
  //printArray(digits);
}

void draw() {
  translate(width / 2, height / 2);
  int digit = digits[index];
  int nextdigit = digits[index + 1];
  index++;
  
  float diff = TWO_PI/40; //(10)
  
  float a1 = map(digit, 0, 10, 0, TWO_PI) + random(-diff, diff);
  float a2 = map(nextdigit, 0, 10, 0, TWO_PI) + random(-diff, diff);
  
  float x1 = r * cos(a1);
  float y1 = r * sin(a1);
  
  float x2 = r * cos(a2);
  float y2 = r * sin(a2);
  
  stroke(255, 50);
  line(x1, y1, x2, y2);
}
