
ArrayList<PVector> points;

void setup() {
  size(800, 600);
  
  background(#FFFFFF);
  noFill();
  
  points = new ArrayList<PVector>();
  for(int i = 0; i < 20; ++i) {
    points.add(new PVector(random(width), random(height)));
  }
}

void draw() {
  background(#FFFFFF);
  drawPoints();
  updatePoints();
}

void drawPoints() {
  beginShape();
  for(int i = 0; i < points.size(); ++i) {
    curveVertex(points.get(i).x, points.get(i).y);
  }
  endShape();
}

void updatePoints() {
  for(int i = 0; i < points.size(); ++i) {
    PVector currentPoint = points.get(i);
    float distance = dist(currentPoint.x, currentPoint.y, mouseX, mouseY);
    float newX = currentPoint.x + (mouseX - currentPoint.x) / distance * 2;
    float newY = currentPoint.y + (mouseY - currentPoint.y) / distance * 2;
   
    points.set(i, new PVector(newX, newY));
  }
}
