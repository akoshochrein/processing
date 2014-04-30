
PVector[] circleCenters;

void setup() {
  size(400,400);
  setupCircles();
  smooth();
}

void setupCircles() {
  circleCenters = new PVector[30];
  for( int i = 0; i < circleCenters.length; ++i ) {
    circleCenters[i] = new PVector(width/2, height/2);
  }
}

void draw() {
  updateBackground();
  drawCircles();
  updateCircles();
}

void updateBackground() {
  fill(0, 5);
  rect(0, 0, width, height); 
}

void drawCircles() {
  for( int i = 0; i < circleCenters.length; ++i ) {
    fill(255);
    noStroke();
    ellipse(circleCenters[i].x, circleCenters[i].y, random(10,30), random(10,30));
  } 
}

void updateCircles() {
  for( int i = 0; i < circleCenters.length; ++i ) {
    circleCenters[i].x = circleCenters[i].x + random(8) - 4;
    circleCenters[i].y = circleCenters[i].y + random(8) - 4;
  }
}
