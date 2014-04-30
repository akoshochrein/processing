
PVector[] circleCenters;

float centerDistanceFromCorners;

void setup() {
  size(800,800);
  setupCircles();
  smooth();
  centerDistanceFromCorners = getCenterDistanceFromCorners();
}

float getCenterDistanceFromCorners() {
  return sqrt( pow(width, 2) + pow(height, 2) )/2; 
}

void setupCircles() {
  circleCenters = new PVector[1000];
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
    noStroke();
    getFillByDistanceFromCenter(circleCenters[i]);
    ellipse(circleCenters[i].x, circleCenters[i].y, random(10,30), random(10,30));
  } 
}

void getFillByDistanceFromCenter( PVector v ) {
  float distanceFromCenter = getDistanceFromCenter( v );
  float greenScale = distanceFromCenter/centerDistanceFromCorners * 255;
  fill(255, greenScale, 0);
}

float getDistanceFromCenter( PVector v ) {
  return sqrt( pow(v.x - width/2, 2) + pow(v.y - height/2, 2) );
}

void updateCircles() {
  for( int i = 0; i < circleCenters.length; ++i ) {
    circleCenters[i].x = circleCenters[i].x + noise(circleCenter[i].x)*16 - 8;
    circleCenters[i].y = circleCenters[i].y + noise(circleCenter[i].x)*16 - 8;
  }
}

