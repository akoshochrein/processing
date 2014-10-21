
int CANVAS_WIDTH = 400;
int CANVAS_HEIGHT = 400;
int NO_LINES = 60;
int TIME = 0;

void setup() {
  size(CANVAS_WIDTH, CANVAS_HEIGHT);
  background(255);
  frameRate(17);
}

void draw() {
  drawLineBatch();
  TIME += 1;
}

void drawLineBatch() {
  pushMatrix();
  translate(CANVAS_WIDTH/2, CANVAS_HEIGHT/2);
  rotate(TIME);
  for (int i = -CANVAS_WIDTH; i < CANVAS_WIDTH; i += CANVAS_WIDTH/NO_LINES) {
    stroke(random(255), random(255), random(255));
    line(i, -CANVAS_WIDTH, i, CANVAS_HEIGHT);
  }
  popMatrix();
}

