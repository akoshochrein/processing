
void setup() {
  size(800, 600);
  background(#FFFFFF);
  noFill();
  
  for(int i = 0; i < 7; ++i) {
    strokeWeight(random(2, 10));
    stroke(0, 0, 0, random(72, 255));
    drawRandomCurve((int)random(20, 30));
  }
}

void drawRandomCurve(int vertices) {
  beginShape();
  float prevVertexX = random(width);
  float prevVertexY = random(height);
  for(int i = 0; i < vertices; ++i) {
    float currentVertexX = prevVertexX + random(-150, 150);
    float currentVertexY = prevVertexY + random(-150, 150);
    curveVertex(currentVertexX, currentVertexY);
    prevVertexX = currentVertexX;
    prevVertexY = currentVertexY;
  }
  endShape();
}
