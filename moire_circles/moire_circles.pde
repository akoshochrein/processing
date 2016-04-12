void setup() {
  size(800, 600);
  background(#000000);
  noFill();
  stroke(#FFFFFF);
  for (int i = 0; i < 10; ++i) {
    circles(random(width), random(height), random(20, 40));
  }
}

void circles(float x, float y, float n) {
  for (int i = 0; i < n; ++i) {
//    ellipse(x, y, i * random(10, 20), i * random(10, 20));
    ellipse(x, y, i * 20, i * 20);
  }
}
