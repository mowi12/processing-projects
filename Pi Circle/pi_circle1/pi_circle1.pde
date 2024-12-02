String pi;
int[] digits;
int[] counts = new int[10];
int index = 0;

void setup() {
  size(600, 600);
  pi = loadStrings("pi_digits.txt")[0];
  //println(pi.length());
  String[] sdigits = pi.split("");
  //println(sdigits.length);
  digits = int(sdigits);
  //printArray(digits);
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  int cD = digits[index];
  index++;
  counts[cD]++;
  
  float w = width / counts.length;
  for (int i = 0; i < counts.length; i++) {
    //float x = i * w + w/2;
    //float y = height / 2;
    
    float a = map(i, 0, counts.length, 0, TWO_PI);
    float x = 200 * cos(a);
    float y = 200 * sin(a);
    
    float d = counts[i];
    ellipse(x, y, d, d);
  }
}
