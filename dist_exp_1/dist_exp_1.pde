
float squareSize;
int numberOfSquares = 10;

boolean inverse = false;

void setup() {
  size(500, 500);
  
  noStroke();
  fill(#000000);
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
      float distance = dist(mouseX, mouseY, centerX, centerY);  
      pushMatrix();
      translate(centerX, centerY);
      scale(distance / width);
      rect(centerX, centerY, squareSize, squareSize);
      popMatrix();
    }
  }
}

