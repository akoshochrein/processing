
void setup() {
  size(800, 600);
  noStroke();
}

void draw() {
  float radius = random(200);
  fill(random(255), random(255), random(255), 145);
  ellipse(random(width), random(height), radius, radius);
}

void keyPressed() {
  if(key == ' ') {
    noLoop();
  }
}

