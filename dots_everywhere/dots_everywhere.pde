
int SCALING_FACTOR_WIDTH = 100;
int SCALING_FACTOR_HEIGHT = 20;

void setup() {
  background(0);
  size(400, 400);
  smooth();
}

void draw() {
  drawNCircles(mouseX*SCALING_FACTOR_WIDTH / width,
               mouseY*SCALING_FACTOR_HEIGHT / height);
  drawFadingBackground();
}

void drawNCircles(int n, int d) {
  noStroke();
  fill(255, random(100,180), random(100,180));
  for(int i = 0; i < n; ++i) ellipse(random(width), random(height), d, d);
}

void drawFadingBackground() {
  fill(0, 0, 0, 5);
  rect(0, 0, width, height);
}
