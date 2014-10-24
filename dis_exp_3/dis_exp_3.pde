
float squareSize;
int numberOfSquares = 100;
float canvasDiag;

boolean inverse = false;

void setup() {
  size(800, 800);
  
  noStroke();
  fill(#000000);
  rectMode(CENTER);
  
  squareSize = width / numberOfSquares;
  canvasDiag = dist(0, 0, width, height);
  
  colorMode(HSB, 360, 100, 100);
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
    fill(param / canvasDiag * 360, 100, 100);
  } else {
    fill(param / canvasDiag * 360, 100, 100);
  }
}
