float angle = 0;
float w = 30; //width, amount of individual boxes
float ma; //macigal angle for rotating perspective
float maxD;

void setup() {
  size(400, 400, P3D);
  ma = atan(cos(QUARTER_PI)); //macigal angle for rotating perspective
  maxD = dist(0, 0, 200, 200); //max distance between center and outside
}

void draw() {
  lights(); //'enable' lights
  pointLight(50, 250, 50, 10, 30, 50);
  background(100);
  ortho(-400, 400, 400, -400, 0, 1000); //orthographic projection, values specify clipping volume
  rotateX(ma); 
  rotateY(QUARTER_PI);
  translate(width/2 + 75, height/2 - 75);

  for (int z = 0; z < height; z += w) {
    for (int x = 0; x < width; x += w) {
      pushMatrix();
      float d = dist(x, z, width / 2, height / 2);
      float offset = map(d, 0, maxD, -PI, PI); //strength of wave effect (-PI, PI)
      float a = angle + offset;
      float h = floor(map(sin(a), -1, 1, 100, 300));
      translate(x - width / 2, 0, z - height / 2);
      fill(255, 128, 0);
      box(w, h, w);
      popMatrix();
    }
  }

  angle -= 0.1; //'speed' of wave
}
