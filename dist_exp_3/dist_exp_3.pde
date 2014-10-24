
float squareSize;
int numberOfSquares = 10;

boolean inverse = false;

void setup() {
  size(800, 800);
  
  noStroke();
  fill(#000000);
  rectMode(CENTER);
  squareSize = width / numberOfSquares;
}

void draw() {
  background(#FFFFFF);
  drawGrid();
}

void drawGrid() {
  for(int i = 0; i < numberOfSquares; ++i) {
    for(int j = 0; j < numberOfSquares; ++j) {
      float centerX = i * squareSize + squareSize / 2;
      float centerY = j * squareSize + squareSize / 2;
      square(centerX, centerY, squareSize);
    }
  }
}

void mouseReleased() {
  inverse = !inverse;
}

void square(float x, float y, float a) {
  float distance = dist(mouseX, mouseY, x, y);  
  pushMatrix();
  translate(x, y);
  applyChanges(distance);
  rect(0, 0, a, a);
  popMatrix();
}

void applyChanges(float param) {
  if(inverse) {
    fill(0, 0, 0, (param / width) * 255);
  } else {
    fill(0, 0, 0, (width-param) / width * 255);
  }
}
